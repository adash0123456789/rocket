#Mini Project: Rocket Chip SoC + Custom SystemVerilog Accelerator (QuestaSim)
step-by-step recipe for adding a custom accelerator IP to a Rocket Chip/Chipyard SoC, including:

10 memory-mapped registers
Ability to fetch instructions/data from memory
Perform a calculation
Store results back to memory
Interrupt the core when done

Integrating SV accelerator as an MMIO slave at 0x40000000 with 10 registers and an IRQ.
Simulating the SoC (Rocket core + custom IP) in QuestaSim or Verilator.
Running C test code by initializing a memory file.
