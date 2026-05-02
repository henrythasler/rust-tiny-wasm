use askama::Template;
use wast::{Wast, WastDirective, parser};

use std::fs;
use std::path::Path;

#[derive(Template, Debug)]
#[template(
    path = "wast_integration_tests.rs.jinja",
    escape = "none",
    // whitespace = "minimize"
)]
struct WastFile {
    name: String,
    modules: Vec<TestModule>,
}

#[derive(Debug)]
struct TestModule {
    name: String,
    functions: Vec<TestFunction>,
}

#[derive(Debug)]
struct TestFunction {
    name: String,
    tests: Vec<TestCases>,
}

#[derive(Debug)]
struct TestCases {
    args: String,
    expected: String,
}

fn main() {
    let base = Path::new("tests/assets/wast");
    let test_path = Path::new("tests");
    let mut tests: Vec<WastFile> = vec![];

    let blocked = ["invalid", "draft", "dummy"];

    for entry in fs::read_dir(base).expect("Should be able to read the folder content") {
        let entry = entry.unwrap();
        let file = entry.path();

        // Skip if not a .wast file
        if file.extension().and_then(|e| e.to_str()) != Some("wast") {
            continue;
        }

        // Skip if filename contains any blocked substring
        if let Some(file_name) = file.file_name().and_then(|f| f.to_str())
            && blocked.iter().any(|sub| file_name.contains(sub))
        {
            println!("Skipping blocked file: {}", file_name);
            continue;
        }

        let wast_file = fs::read_to_string(Path::new(&file)).unwrap();
        let buf = parser::ParseBuffer::new(&wast_file).unwrap();
        let wast = parser::parse::<Wast>(&buf).unwrap();

        let mut test_modules: Vec<TestModule> = vec![];

        for directive in wast.directives {
            match directive {
                WastDirective::Module(mut module) => {
                    let wasm = module.encode().unwrap();

                    let wasm_filename = format!(
                        "{}_{}",
                        file.file_stem().unwrap().to_str().unwrap(),
                        test_modules.len()
                    );
                    let mut output_path = base.join(&wasm_filename);
                    output_path.set_extension("wasm");

                    fs::write(&output_path, wasm).expect("fs::write() should be able to write");
                    test_modules.push(TestModule {
                        name: wasm_filename,
                        functions: vec![],
                    });
                }
                WastDirective::AssertReturn { exec, .. } => {
                    let (name, _args) = match exec {
                        wast::WastExecute::Invoke(invoke) => {
                            let name = invoke.name;
                            let args = invoke.args;
                            (name, args)
                        }
                        _ => continue,
                    };
                    let current_module = test_modules.last_mut().unwrap();
                    // check if the function already exists in the last module, if not create it
                    if !current_module.functions.iter().any(|f| f.name == name) {
                        current_module.functions.push(TestFunction {
                            name: String::from(name),
                            tests: vec![],
                        });
                    }
                    current_module
                        .functions
                        .last_mut()
                        .unwrap()
                        .tests
                        .push(TestCases {
                            args: String::from(""),
                            expected: String::from(""),
                        });
                }
                _ => panic!("unsupported WastDirective: {:?}", directive),
            }
        }

        tests.push(WastFile {
            name: String::from(file.file_prefix().unwrap().to_str().unwrap()),
            modules: test_modules,
        });
    }

    for test in tests {
        let res = test.render().unwrap();
        let mut output_path = test_path.join(format!("wast_{}_test", test.name));
        output_path.set_extension("rs");
        fs::write(output_path, res).expect("fs::write() should be able to write");
    }
}
