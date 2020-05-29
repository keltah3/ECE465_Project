`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:02:35 05/10/2019
// Design Name:   CarryLookAheadAdder32bit
// Module Name:   C:/Users/karim/Desktop/Xilinix Project/ECE465/simulus_test2.v
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

module simulus_test2;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg cin;

	// Outputs
	wire [15:0] sum;
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
		#50 A=12; 
		#50 B=4;
	end
	
	initial begin
			$monitor("A=%d,B=%d,cin=%d,sum=%d, cout=%d\n",A,B,cin,sum,cout);
		end
      
endmodule

