// EE 361
// LEGLite
//
// * PC and PC Control:  Program Counter and
//         the PC control logic
//--------------------------------------------------------------
// PC and PC Control
module PCLogic(
     output logic [15:0] pc,  // current pc value
     input logic clock, // clock input
     input logic [15:0] signext,	// from sign extend circuit
     input logic uncondbranch,
     input logic branch,
     input logic alu_zero,
     input logic reset
     );


always_ff @(posedge clock)
	begin
	if (reset==1) pc <= 0;
//if Branch and ALU_zero are received signext for PC update
  else if (branch == 1 && alu_zero == 1) pc <= pc + (signext << 1);
  //if uncond branch is 1 then branch
  else if(uncondbranch == 1) pc <= pc + (signext << 1);
	else pc <= pc+2; // default
	end

endmodule
