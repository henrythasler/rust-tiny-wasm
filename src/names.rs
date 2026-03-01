/// This function returns a name
/// 
/// For now, this can only return "world"
/// 
/// ```
/// let result = tiny_wasm::names::get_name();
/// assert_eq!(result, "world");
/// ```
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