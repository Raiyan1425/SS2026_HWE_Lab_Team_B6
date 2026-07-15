# Exercise 01 – Clock Divider
## Objective
The objective of this exercise was to design a clock divider in VHDL that generates a lower-frequency clock (`CLK_N`) from a higher-frequency input clock (`CLK`).
## Description
The clock divider was implemented using a counter-based approach. The input clock is counted internally, and after reaching a predefined value (`N`), the output clock toggles its state. This effectively reduces the output clock frequency by a factor of `N`.
A VHDL testbench was also created to verify the functionality of the design through behavioral simulation in AMD Vivado.
## Files Included
- `clk_divider.vhd`
- `clk_divider_tb.vhd`
## Tools Used
- AMD Vivado ML Edition 2025.2
- VHDL (STANDARD Library)
## Verification
The design was verified using a behavioral simulation. The waveform confirms that the output clock (`CLK_N`) toggles at a lower frequency than the input clock (`CLK`), demonstrating the correct operation of the clock divider.
