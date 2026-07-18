use super::*;

/// Parses a wasmparser::ConstExpr and returns the constant value as i64.
///
/// # Arguments
/// * `expr` - The constant expression to parse
/// # Returns
/// * `Result<i64>` - The constant value as i64 if successful, or an error if the expression is invalid
pub fn parse_const_expr(expr: wasmparser::ConstExpr) -> Result<i64> {
    let reader = &mut expr.get_operators_reader();
    if !reader.eof() {
        let op = reader.read().unwrap();

        match op {
            Operator::I32Const { value } => return Ok(value as i64),
            Operator::I64Const { value } => return Ok(value),
            _ => {
                return Err(TinyWasmError::Parser(String::from(
                    "Invalid const expression, expected i32.const or i64.const",
                )));
            }
        }
    }
    Err(TinyWasmError::Parser(String::from(
        "Empty const expression",
    )))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_i32_const_expr() {
        let reader = wasmparser::BinaryReader::new(&[0x41, 0x2A, 0x0B], 0); // i32.const 42; end
        let expr = wasmparser::ConstExpr::new(reader);
        assert_eq!(parse_const_expr(expr), Ok(42));
    }

    #[test]
    fn test_parse_large_i32_const_expr() {
        let reader = wasmparser::BinaryReader::new(&[0x41, 0xd5, 0xd4, 0xd6, 0xd2, 0x7a, 0x0B], 0); // i32.const 0xaa55aa55; end
        let expr = wasmparser::ConstExpr::new(reader);
        assert_eq!(parse_const_expr(expr), Ok(-1437226411));
    }

    #[test]
    fn test_parse_i64_const_expr() {
        let reader = wasmparser::BinaryReader::new(&[0x42, 0x2A, 0x0B], 0); // i64.const 42; end
        let expr = wasmparser::ConstExpr::new(reader);
        assert_eq!(parse_const_expr(expr), Ok(42));
    }

    #[test]
    fn test_parse_invalid_const_expr() {
        let reader = wasmparser::BinaryReader::new(&[0x00, 0x0B], 0); // unreachable; end
        let expr = wasmparser::ConstExpr::new(reader);
        assert!(parse_const_expr(expr).is_err());
    }

    #[test]
    fn test_parse_invalid_reader() {
        let reader = wasmparser::BinaryReader::new(&[], 0); // <empty>
        let expr = wasmparser::ConstExpr::new(reader);
        assert!(parse_const_expr(expr).is_err());
    }
}
