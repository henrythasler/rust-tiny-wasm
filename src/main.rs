use current_platform::{COMPILED_ON, CURRENT_PLATFORM};

fn get_name() -> &'static str {
    let name: &'static str = "world";
    return name
}

#[cfg(test)]
#[cfg_attr(coverage, coverage(off))]
mod tests {
    use super::*;

    #[test]
    fn test_add() {
        assert_eq!(get_name(), "world");
    }
}

fn main() {
    let name: &str = get_name();
    println!("Compiled on '{}' for '{}'", COMPILED_ON, CURRENT_PLATFORM);
    println!("Hello, {}!", name);
}
