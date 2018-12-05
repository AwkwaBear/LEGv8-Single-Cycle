
//____________________________________________________________________
// EE 361
// LEGLite Single Cycle
//
// Obviously, it's incomplete.  Just the ports are defined.
//

module LEGLiteSingle(
	iaddr,		// Program memory address.  This is the program counter
	daddr,		// Data memory address
	dwrite,		// Data memory write enable
	dread,		// Data memory read enable
	dwdata,		// Data memory write output
	alu_out,	// Output of alu for debugging purposes
	clock,
	idata,		// Program memory output, which is the current instruction
	ddata,		// Data memory output
	reset
	);



output [15:0] iaddr;
output [15:0] daddr;
output dwrite;
output dread;
output [15:0] dwdata;
output [15:0] alu_out;
input clock;
input [15:0] idata; // Instructions
input [15:0] ddata;
input reset;
wire reg2loc;
wire memread;
wire memtoreg;
wire[2:0] alu_select;
wire memwrite;
wire alusrc;

wire[15:0] pcout; //idata input
wire[15:0] signext;
/* CONTROL UNIT*/
wire[15:0] alumuxout;
wire[15:0] iaddr;  //current instructions
wire[15:0] readreg2;
wire[15:0] rdata1;
wire[15:0] rdata2;
wire[15:0] wdata;
wire[2:0] waddr;

assign alu_out = daddr;
assign iaddr = pcout;
assign dwdata = rdata2;
assign iaddr = pcout;
assign dwrite = memwrite;
assign dread = memread;
assign signext = {{10{idata[11]}}, idata[11:6]};

Control control(
	reg2loc,
	uncondbranch,
	branch,
	memread,
	memtoreg,
	alu_select,
	memwrite,
	alusrc,
	regwrite,
	{idata[15:12]}
	);


/*MUX FOR REGISTER FILE*/
MUX2 regfilemux(
	readreg2,
	{{13'b0},idata [11:9]},
	{{13'b0},idata [2:0]},
	reg2loc
	);


/*REGISTER FILE*/
RegFile regfile(
	rdata1,
	rdata2,
	clock,
	wdata,
	{idata[2:0]},
	{idata[5:3]},
	readreg2[2:0],
	regwrite
	);

/* MUX FOR ALU */
MUX2 alumux(
	alumuxout,
	rdata2,
	signext,
	alusrc
	);


/*MUX for DATA MEMORY*/
MUX2 datamux(
	wdata,
	daddr,
	ddata,
	memtoreg
	);

/*ALU*/
ALU alu(
	daddr,
	zero_result,
	rdata1,
	alumuxout,
	alu_select
	);


/*PROGRAM COUNTER*/
PCLogic PC(
	iaddr,
	clock,
	signext,
	uncondbranch,
	branch,
	zero_result,
	reset
	);


endmodule
