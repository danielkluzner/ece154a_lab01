// testbench.v
// ECE 154A, Fall 2019
// Authors: Daniel Kluzner, Benji

// A testbench for the "alu" module

module alu_tb();

   reg [31:0] sim_a;
   reg [31:0] sim_b;
   reg [2:0]  sim_f;
   wire [31:0] sim_y;
   wire sim_zero;

   alu a_test(
	      .a(sim_a),
	      .b(sim_b),
	      .f(sim_f),
	      .y(sim_y),
	      .zero(sim_zero)
	      );

   initial begin

      sim_a = 32'h00000003;
      sim_b = 32'h0;
      sim_f = 3'b0;

      #5;

      sim_b = 32'h00000001;

      #5;

      $stop;

   end

endmodule

