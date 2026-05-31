use super::*;
use crate::runtime::WasmReturnCode;

pub fn trap_inline(
    trap_code: TrapCode,
    trap_locations: &mut Vec<Patch>,
    machinecode: &mut Vec<u32>,
) {
    machinecode.push(processing::mov_imm(
        Reg::X1,
        trap_code as u32,
        RegSize::Reg64bit,
    ));
    machinecode.push(processing::mov_imm(
        Reg::X0,
        WasmReturnCode::Trap as u32,
        RegSize::Reg64bit,
    ));

    trap_locations.push(Patch {
        location: machinecode.len(),
        instruction: Instruction::Br,
    });
    machinecode.push(branch::branch(0));
}
