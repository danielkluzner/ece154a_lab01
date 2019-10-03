// testbench.v
// ECE 154A, Fall 2019
// Authors: Daniel Kluzner, Benji

// A testbench for the "alu" module

module alu_tb();

   reg [2:0]  sim_f;
   reg [31:0] sim_a;
   reg [31:0] sim_b;
   wire [31:0] sim_y;
   wire sim_zero;

   alu a_test(
	      .f(sim_f),
	      .a(sim_a),
	      .b(sim_b),
	      .y(sim_y),
	      .zero(sim_zero)
	      );

   initial begin

      sim_a = 32'b0;
      sim_b = 32'b0;
      sim_f = 3'b010;

      #5;

      sim_b = 32'hFFFFFFFF;

      #5;

      sim_a = 32'h00000001;

      #5;

      sim_a = 32'h000000FF;
      sim_b = 32'h00000001;

      #5;

      sim_f = 3'b110;
      sim_a = 32'b0;
      sim_b = 32'b0;

      #5;

      sim_b = 32'hFFFFFFFF;

      #5;

      sim_a = 32'h00000001;
      sim_b = 32'h00000001;

      #5;

      sim_a = 32'h00000100;

      #5;

      sim_f = 3'b111;
      sim_a = 32'b0;
      sim_b = 32'b0;

      #5;

      sim_b = 32'h00000001;

      #5;

      sim_b = 32'hFFFFFFFF;

      #5;

      sim_a = 32'h00000001;
      sim_b = 32'b0;

      #5;

      sim_a = 32'hFFFFFFFF;

      #5;

      sim_f = 3'b0;
      sim_a = 32'hFFFFFFFF;
      sim_b = 32'hFFFFFFFF;

      #5;

      sim_b = 32'h12345678;

      #5;

      sim_a = 32'h12345678;
      sim_b = 32'h87654321;

      #5;

      sim_a = 32'b0;
      sim_b = 32'hFFFFFFFF;

      #5;

      sim_f = 3'b001;
      sim_a = 32'hFFFFFFFF;

      #5;

      sim_a = 32'h12345678;
      sim_b = 32'h87654321;

      #5;

      sim_a = 32'b0;
      sim_b = 32'hFFFFFFFF;

      #5;

      sim_b = 32'b0;

      #5;

      $stop;

   end

endmodule

