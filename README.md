# VLSI-Based 2-bit and 4-bit ALU Design using Cadence & Verilog

This project showcases the design and implementation of both 2-bit and 4-bit Arithmetic Logic Units (ALUs) using industry-standard tools — Cadence Virtuoso for CMOS schematic design and Xilinx Vivado with Verilog for FPGA synthesis.

The ALUs are capable of performing a variety of operations including addition, subtraction, logical gates, shift operations, and ring counters. All operations are verified through simulation and timing analysis.



## Project Objectives

- Design a **2-bit ALU** using **45nm CMOS technology** in Cadence Virtuoso
- Design a **4-bit ALU** using **Verilog and FPGA synthesis (Xilinx Vivado)**
- Perform and simulate multiple operations:
  - Addition
  - Subtraction
  - XOR (Mirror circuit)
  - AND (Transmission gates)
  - SISO Left Shift
  - Ring Counter
- Analyze **power, area, and timing** reports


## Tools & Technologies

| Tool | Purpose |
|------|---------|
| Cadence Virtuoso | Schematic design and simulation (2-bit ALU) |
| Xilinx Vivado 2024.2 | Verilog implementation and FPGA simulation (4-bit ALU) |
| FPGA Target | Virtex-7 |
| Technology Node | 45nm CMOS |
| Language | Verilog HDL |

---

## Key Features

### 2-bit ALU (Cadence)
- Designed using logic gates and full adders
- XOR via Mirror circuit for low delay
- AND gate using minimum number of transmission gates
- Simulated with schematic waveforms

###  4-bit ALU (Verilog)
- Operates synchronously with clock signal
- Supports:
  - `00`: 4-bit addition with carry-out
  - `01`: 4-bit subtraction with borrow
  - `10`: SISO Left Shift using shift register
  - `11`: Ring Counter (left circular shift)
- Tracks **carry-out** and **zero flag**

---

##  Sample Verilog Snippet (4-bit ALU Logic)

```verilog
case (control)
    2'b00: {carry_out, result} = A + B;           // ADD
    2'b01: {carry_out, result} = A - B;           // SUB
    2'b10: shift_reg = {shift_reg[2:0], 1'b0};    // SISO LEFT SHIFT
    2'b11: result = {A[2:0], A[3]};               // RING COUNTER
endcase
