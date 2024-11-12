# Vivado & Vitis
Vivado : FPGA Hardware Design
Vitis  : Software-Hardware Integrated Application Development

Flow    : .xo(in vitis) + .bit(in vivado) -> .xclbin(in vitis)
          -> Load .xclbin in FPGA to accelerate hardware using host application

# 241105
## Vivado - FPGA Design Sequence
1. Create project
2. RTL Simulation
3. Synthesis
  - Convert Netlist(Gate Array) to FPGA Resources(LUT, Register)
4. Implementation
  - Place & Route Synthesized Netlist
5. Bitstream
  - Generate .bit that can be directly loaded onto the FPGA to program it
6. Program FPGA
## Debounce code is included

# 241107
## Vitis HLS
1. Create project
  - Device code : Host code transferring data to FPGA or receiving processed data from FPGA //
                  Function or loop in device code is converted to hardware
  - Top module  : It defines the main function or entry point on device code to be used in the hardware module on the FPGA
  - Solution    : A set of configurationos for the design //
                  We can create various solutions in the same project
2. C Simulation
  - Verify that the device code is free from functional errors
3. C Synthesis
  - Convert the C code written in HLS to Verilog code
  - Functions within the code are synthesized into modules
4. C/RTL Cosimulation
  - Verify the timing and functional consistency between the original C/C++ code and RTL
  - Check if the hardware can operate at the desired frequency through simulation with timing information included
5. RTL Export
  - Generate '.xo'(in kernel flow) which is hardware acceleration kernel file
