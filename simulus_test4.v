`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:58:38 05/10/2019
// Design Name:   CarryLookAheadAdder32bit
// Module Name:   C:/Users/karim/Desktop/Xilinix Project/ECE465/simulus_test4.v
// Project Name:  ECE465
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CarryLookAheadAdder32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simulus_test4;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg cin;

	// Outputs
	wire [31:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	CarryLookAheadAdder32bit uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.sum(sum), 
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
		#50 A=32; 
		#50 B=64;
	end
	
	initial begin
			$monitor("A=%d,B=%d,cin=%d,sum=%d, cout=%d\n",A,B,cin,sum,cout);
		end
      
endmodule

