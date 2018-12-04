// EE 361
// LEGLite 
// 
// The control module for LEGLite
//   The control will input the opcode value (3 bits)
//   then determine what the control signals should be
//   in the datapath
// 
//---------------------------------------------------------------
module Control(
     output logic reg2loc,
     output logic uncondbranch,
     output logic branch,
     output logic memread,
     output logic memtoreg,
     output logic [2:0] alu_select,
     output logic memwrite,
     output logic alusrc,
     output logic regwrite,
     input logic [3:0] opcode
     );


always_comb
	case(opcode)
	0:	// ADD
		begin
		reg2loc = 0;
		uncondbranch = 0;
		branch = 0;   
		memread = 0;  
		memtoreg = 0;
		alu_select = 0; // Have ALU do an ADD
		memwrite = 0; 
		alusrc = 0; 
		regwrite = 1;
		end
	default:
		begin
		reg2loc = 0;
		uncondbranch = 0;
		branch = 0;   
		memread = 0;   
		memtoreg = 0;  
		alu_select = 0; 
		memwrite = 0; 
		alusrc = 0;    
		regwrite = 0;
		end
	endcase

endmodule




