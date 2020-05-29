`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:46:26 05/10/2019
// Design Name:   RippleCarryAdder32
// Module Name:   C:/Users/karim/Desktop/Xilinix Project/ECE465/stimulus_test.v
// Project Name:  ECE465
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RippleCarryAdder32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stimulus_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg cin;

	// Outputs
	wire [31:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	RippleCarryAdder32 uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.S(S), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50 A=1;
		#50 A=0;
		#50 B=1;
		#50 A=12; 
		#50 B=4;
	end
      
		initial begin
			$monitor("A=%d,B=%d,cin=%d,S=%d, cout=%d\n",A,B,cin,S,cout);
		end
endmodule

