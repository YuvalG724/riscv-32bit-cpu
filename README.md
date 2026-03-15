# RISC-V Single Cycle CPU (Verilog)

A 32-bit RISC-V single-cycle processor implemented in Verilog as part of a digital design project.

This project demonstrates RTL design, processor architecture, and hardware simulation using ModelSim.

---

## Features

- 32-bit RISC-V architecture
- Single-cycle datapath
- Register file with 32 registers
- Arithmetic Logic Unit (ALU)
- Immediate generator
- Instruction memory and data memory
- Control unit for instruction decoding
- Fully simulated in ModelSim

---

## Architecture

The processor implements the classic RISC-V single cycle datapath:

PC → Instruction Memory → Control Unit  
↓  
Register File → ALU → Data Memory → Register Writeback
---

## Supported Instructions

Current implementation supports:

- ADD
- SUB
- AND
- OR
- ADDI
- LW
- SW
- BEQ

---

## Project Structure

```
src/         Verilog RTL modules
sim/   CPU simulation testbench
output/  ModelSim waveform results
```

---

## RTL Modules

| Module | Description |
|------|-------------|
| pc.v | Program counter |
| alu.v | Arithmetic logic unit |
| regfile.v | 32-register file |
| control.v | Instruction decoder |
| imm_gen.v | Immediate generator |
| imem.v | Instruction memory |
| dmem.v | Data memory |
| cpu_top.v | Top-level CPU |

---

## Simulation

The processor was simulated using ModelSim.

---

## Tools Used

- Verilog HDL
- ModelSim
- Digital Logic Design
- RISC-V ISA

---

## Future Improvements

- Pipeline implementation
- Hazard detection
- Branch prediction
- FPGA implementation

---
