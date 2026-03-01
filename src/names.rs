pub fn get_name() -> &'static str {
    let name: &'static str = "world";
    return name
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_get_name() {
        assert_eq!(get_name(), "world");
    }
}