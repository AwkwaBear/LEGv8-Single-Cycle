// EE 361
// LEGLite Single Cycle
// 
// Obviously, it's incomplete.  Just the ports are defined.
//

module LEGLiteSingle(
	output [15:0] logic iaddr,	// Program memory address.  This is the program counter
	output [15:0] logic daddr,	// Data memory address
	output logic dwrite,		// Data memory write enable
	output logic dread,		// Data memory read enable
	output logic [15:0] dwdata,	// Data memory output
	output logic [15:0] alu_out, // Output of alu for debugging purposes
	input logic clock,
	input logic [15:0] idata,	// Program memory output, which is the current instruction
	input logic [15:0] ddata,	// Data memory output
	input logic reset
	);


endmodule

