use askama::Template;
use wast::{Wast, WastDirective, WastRet, parser};

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
    arg_types: String,
    result_types: String,
    tests: Vec<TestCases>,
}

#[derive(Debug)]
struct TestCases {
    args: String,
    expected: String,
}

fn args_to_types(args: &[wast::WastArg]) -> String {
    let types: Vec<String> = args
        .iter()
        .map(|arg| match arg {
            wast::WastArg::Core(val) => match val {
                wast::core::WastArgCore::I32(..) => String::from("i32"),
                wast::core::WastArgCore::I64(..) => String::from("i64"),
                _ => panic!("Unsupported argument type: {:?}", val),
            },
            _ => panic!("Unsupported argument type: {:?}", arg),
        })
        .collect();

    match types.len() {
        0 => String::from("()"),
        1 => format!("({}, )", types[0]),
        _ => format!("({}, )", types.join(", ")),
    }
}

fn args_to_string(args: &[wast::WastArg]) -> Vec<String> {
    args.iter()
        .map(|arg| match arg {
            wast::WastArg::Core(val) => match val {
                wast::core::WastArgCore::I32(i) => format!("{}i32", i),
                wast::core::WastArgCore::I64(i) => format!("{}i64", i),
                _ => panic!("Unsupported argument type: {:?}", val),
            },
            _ => panic!("Unsupported argument type: {:?}", arg),
        })
        .collect()
}

fn results_to_types(results: &[WastRet]) -> String {
    let types: Vec<String> = results
        .iter()
        .map(|result| match result {
            WastRet::Core(val) => match val {
                wast::core::WastRetCore::I32(..) => String::from("i32"),
                wast::core::WastRetCore::I64(..) => String::from("i64"),
                _ => panic!("Unsupported result type: {:?}", val),
            },
            _ => panic!("Unsupported result type: {:?}", result),
        })
        .collect();
    match types.len() {
        0 => String::from("()"),
        1 => format!("{}", types.join(", ")),
        _ => format!("({})", types.join(", ")),
    }
}

fn results_to_string(results: &[WastRet]) -> Vec<String> {
    results
        .iter()
        .map(|result| match result {
            WastRet::Core(val) => match val {
                wast::core::WastRetCore::I32(i) => format!("{}i32", i),
                wast::core::WastRetCore::I64(i) => format!("{}i64", i),
                _ => panic!("Unsupported result type: {:?}", val),
            },
            _ => panic!("Unsupported result type: {:?}", result),
        })
        .collect()
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
                WastDirective::AssertReturn { exec, results, .. } => {
                    let (name, args) = match exec {
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
                            arg_types: args_to_types(&args),
                            result_types: results_to_types(&results),
                        });
                    }
                    current_module
                        .functions
                        .last_mut()
                        .unwrap()
                        .tests
                        .push(TestCases {
                            args: args_to_string(&args).join(", "),
                            expected: results_to_string(&results).join(", "),
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
        print!("{:#?}", test);
        let mut output_path = test_path.join(format!("wast_{}_test", test.name));
        output_path.set_extension("rs");
        fs::write(output_path, res).expect("fs::write() should be able to write");
    }
}
