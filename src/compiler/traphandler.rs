use super::*;
use crate::runtime::WasmReturnCode;

pub const TRAP_SKIP_BRANCH: i32 = 4;

pub fn trap_inline(
    trap_code: TrapCode,
    trap_locations: &mut Vec<Patch>,
    machinecode: &mut Vec<u32>,
) {
    machinecode.push(processing::mov_imm(
        IReg::X1,
        trap_code as u32,
        RegSize::Int64bit,
    ));
    machinecode.push(processing::mov_imm(
        IReg::X0,
        WasmReturnCode::Trap as u32,
        RegSize::Int64bit,
    ));

    trap_locations.push(Patch {
        location: machinecode.len(),
        instruction: Instruction::Br,
    });
    machinecode.push(branch::branch(0));
}
