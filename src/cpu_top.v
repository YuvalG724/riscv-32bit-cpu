module cpu_top(
    input clk,
    input reset
);

wire [31:0] PC;
wire [31:0] PC_next;
wire [31:0] instruction;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] write_data;
wire [31:0] imm_out;
wire [31:0] alu_result;
wire zero;
wire [31:0] mem_read_data;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;
wire MemToReg;
wire Branch;
wire [1:0] ALUOp;

// ALU control
wire [3:0] alu_control;

assign PC_next = PC + 4;

pc PC1(
    .clk(clk),
    .reset(reset),
    .PC_in(PC_next),
    .PC_out(PC)
);
 
imem IMEM1(
    .addr(PC),
    .instruction(instruction)
);


control CTRL1(
    .opcode(instruction[6:0]),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .MemToReg(MemToReg),
    .Branch(Branch),
    .ALUOp(ALUOp)
);


// Register File
regfile REG1(
    .clk(clk),
    .regWrite(RegWrite),
    .rs1(instruction[19:15]),
    .rs2(instruction[24:20]),
    .rd(instruction[11:7]),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);



imm_gen IMM1(
    .instruction(instruction),
    .imm_out(imm_out)
);


wire [31:0] alu_input2;

assign alu_input2 = (ALUSrc) ? imm_out : read_data2;


// ALU
alu ALU1(
    .A(read_data1),
    .B(alu_input2),
    .control_in(alu_control), // simplified ALU control
    .result(alu_result),
    .zero(zero)
);

dmem DMEM1(
    .clk(clk),
    .mem_read(MemRead),
    .mem_write(MemWrite),
    .addr(alu_result),
    .write_data(read_data2),
    .read_data(mem_read_data)
);

assign write_data = (MemToReg) ? mem_read_data : alu_result;


endmodule
