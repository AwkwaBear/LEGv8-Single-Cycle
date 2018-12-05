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
	0:			// ADD instruction
		begin
		reg2loc = 0;   // Pick 2nd reg field
		branch = 0;    // Disable branch
    uncondbranch = 0;
		memread = 0;   // Disable memory
		memtoreg = 0;  // Select ALU to write to memory
		alu_select = 0; // Have ALU do an ADD
		memwrite = 0;  // Disable memory
		alusrc = 0;    // Select register for input to ALU
		regwrite = 1;  // Write result back to register file
		end
	5:			// LD instruction
		begin
		reg2loc = 0;   // Pick 2nd reg field
		branch = 0;    // Disable branch
    uncondbranch = 0;
		memread = 1;   // Disable memory
		memtoreg = 1;  // Select ALU to write to memory
		alu_select = 0; // Have ALU do an ADD
		memwrite = 0;  // Disable memory
		alusrc = 1;    // Select register for input to ALU
		regwrite = 1;  // Write result back to register file
		end
	6:			// STORE instruction
		begin
		reg2loc = 1;   // Pick 2nd reg field
		branch = 0;    // Disable branch
    uncondbranch = 0;
		memread = 0;   // Disable memory
		memtoreg = 0;  // Select ALU to write to memory
		alu_select = 0; // Have ALU do an ADD
		memwrite = 1;  // Disable memory
		alusrc = 1;    // Select register for input to ALU
		regwrite = 0;  // Write result back to register file
		end
	7:			// CBZ instruction
		begin
		reg2loc = 1;   // Pick 2nd reg field
		branch = 1;    // Enable branch
    uncondbranch = 0;
		memread = 0;   // Disable memory
		memtoreg = 0;  // Select ALU to write to memory
		alu_select = 2; // Have ALU pass input 1
		memwrite = 0;  // Disable memory
		alusrc = 0;    // Select register for input to ALU
		regwrite = 0;  // Write result back to register file
		end
	8:			// ADDI instruction
		begin
		reg2loc = 0;   // Pick 2nd reg field
		branch = 0;    // Disable branch
    uncondbranch = 0;
		memread = 0;   // Disable memory
		memtoreg = 0;  // Select ALU to write to memory
		alu_select = 0; // Have ALU do an ADD
		memwrite = 0;  // Disable memory
		alusrc = 1;    // Select register for input to ALU
		regwrite = 1;  // Write result back to register file
		end
	9:			// ANDI instruction
		begin
		reg2loc = 0;   // Pick 2nd reg field
		branch = 0;    // Disable branch
    uncondbranch = 0;
		memread = 0;   // Disable memory
		memtoreg = 0;  // Select ALU to write to memory
		alu_select = 4; // Have ALU do an AND
		memwrite = 0;  // Disable memory
		alusrc = 1;    // Select register for input to ALU
		regwrite = 1;  // Write result back to register file
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
