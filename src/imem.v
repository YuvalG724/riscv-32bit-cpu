module imem(
    input [31:0] addr,
    output [31:0] instruction
);

reg [31:0] memory [0:63];

assign instruction = memory[addr >> 2];

integer i;

initial begin

for(i=0;i<64;i=i+1)
memory[i] = 32'b0;

memory[0] = 32'h00500093;
memory[1] = 32'h00A00113; 
memory[2] = 32'h002081B3; 
memory[3] = 32'h00302023; 

end

endmodule
