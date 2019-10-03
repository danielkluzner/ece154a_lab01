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
	
   //make memory array large enough to hold all the values from the input file (16 values), 
   // //with each location large enough to hold the largest value (8 bits)
   reg [31:0] data [0:104];   //16 memory words (lines), 8 bits wide
   reg [2:0]  f_temp;
   reg [31:0] a_temp, b_temp;
   reg [31:0] y_temp;
   reg zero_temp;
   
   integer i;
   initial $readmemh("alu.tv", data);

   initial begin
      for (i=0; i < 105; i=i+5) begin
	 f_temp = data[i];
	 a_temp = data[i+1];
	 b_temp = data[i+2];
	 y_temp = data[i+3];
	 zero_temp = data[i+4];
	 sim_a = a_temp;
	 sim_b = b_temp;
	 sim_f = f_temp;

	 #5;
	 if(y_temp == sim_y && zero_temp == sim_zero) begin
	    //$display("sim_y: %h, sim_z: %d", sim_y, sim_zero);
	    //$display("y_temp: %h, z_temp: %d", y_temp, zero_temp);
	    $display("Test %d passed", i/5);

	 end
	 #5;
      end

      $stop;
   end     

endmodule
