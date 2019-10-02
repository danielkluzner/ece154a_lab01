// alu.v
// ECE 154A, Fall 2019
// Authors: Daniel Kluzner, Benji

// A 32-bit arithmetic logic unit (ALU)
// as seen in 5.2.4 of "Harris & Harris"

module alu(
       input [31:0] a,
       input [31:0] b,
       input [2:0] f,
       output [31:0] y,
       output zero
);

   reg temp0;
   reg [31:0] tempy;
   reg [31:0] tempb;   

   always @* begin
      
      casex({f})
	3'b000: tempy = a & b;
	3'b001: tempy = a | b;
	
	// adder/subtractor case
	3'bx10: begin
	   if(f[2] == 0) tempb = b;
	   else tempb = ~b;
	   tempy = a + tempb + 32'h00000001;
	end
	/*
	3'b010: tempy = a + b;
	3'b110: tempy = a - b;
	 */
	3'b111: begin
	   if(a[31] < b[31]) tempy = 32'h00000001;
	   else tempy = 32'b0;
	end
	default: tempy = 32'b0;
      endcase // case ({f})
      
      if(y == 8'h0) assign temp0 = 1'b1;
      else assign temp0 = 1'b0;
      
   end

   assign y = tempy;
   assign zero = temp0;

endmodule
