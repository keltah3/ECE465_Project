module FullAdder(a, b, cin, cout, sum);
	input a, b, cin; // inputs
	output cout, sum; // output
	wire w1, w2, w3, w4; // internal wires
	xor G1(w1, a, b); 
	xor G2(sum, w1, cin);
	and  G3(w2, a, b);
	and G4(w3, a, cin);
	and G5(w4, b, cin);
	or G6(cout, w2, w3, w4); 
endmodule

module RippleCarryAdder32(A, B, cin, S, cout);
	input[31:0] A, B;
	input cin;
	output[31:0] S;
	output cout;
	wire [31:0] C;

	FullAdder fa0(A[0], B[0], cin, C[1], S[0]);
	FullAdder fa1(A[1], B[1], C[1], C[2], S[1]);
	FullAdder fa2(A[2], B[2], C[2], C[3], S[2]);
	FullAdder fa3(A[3], B[3], C[3], C[4], S[3]);
	
	FullAdder fa4(A[4], B[4], C[4], C[5], S[4]);
	FullAdder fa5(A[5], B[5], C[5], C[6], S[5]);
	FullAdder fa6(A[6], B[6], C[6], C[7], S[6]);
	FullAdder fa7(A[7], B[7], C[7], C[8], S[7]);
	
	FullAdder fa8(A[8], B[8], C[8], C[9], S[8]);
	FullAdder fa9(A[9], B[9], C[9], C[10], S[9]);
	FullAdder fa10(A[10], B[10], C[10], C[11], S[10]);
	FullAdder fa11(A[11], B[11], C[11], C[12], S[11]);
	
	FullAdder fa12(A[12], B[12], C[12], C[13], S[12]);
	FullAdder fa13(A[13], B[13], C[13], C[14], S[13]);
	FullAdder fa14(A[14], B[14], C[14], C[15], S[14]);
	FullAdder fa15(A[15], B[15], C[15], C[16], S[15]);
	
	FullAdder fa16(A[16], B[16], C[16], C[17], S[16]);
	FullAdder fa17(A[17], B[17], C[17], C[18], S[17]);
	FullAdder fa18(A[18], B[18], C[18], C[19], S[18]);
	FullAdder fa19(A[19], B[19], C[19], C[20], S[19]);
	
	FullAdder fa20(A[20], B[20], C[20], C[21], S[20]);
	FullAdder fa21(A[21], B[21], C[21], C[22], S[21]);
	FullAdder fa22(A[22], B[22], C[22], C[23], S[22]);
	FullAdder fa23(A[23], B[23], C[23], C[24], S[23]);	
	
	FullAdder fa24(A[24], B[24], C[24], C[25], S[24]);
	FullAdder fa25(A[25], B[25], C[25], C[26], S[25]);
	FullAdder fa26(A[26], B[26], C[26], C[27], S[26]);
	FullAdder fa27(A[27], B[27], C[27], C[28], S[27]);
	
	FullAdder fa28(A[28], B[28], C[28], C[29], S[28]);
	FullAdder fa29(A[29], B[29], C[29], C[30], S[29]);
	FullAdder fa30(A[30], B[30], C[30], C[31], S[30]);
	FullAdder fa31(A[31], B[31], C[31], cout, S[31]);		
endmodule

module CarryLookAheadAdder4bit(A,B, cin, sum,cout);
input [3:0] A,B;
input cin;
output [3:0] sum;
output cout;

wire [3:0] p,g,c;

assign p = A^B;//propagate
assign g = A&B; //generate

assign c[0] = cin;
assign c[1] = g[0]|(p[0]&c[0]);
assign c[2] = g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
assign c[3] = g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
assign cout = g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&p[0]&c[0];
assign sum = p^c;

endmodule

module CarryLookAheadAdder32bit(A,B, cin, sum,cout);
input [31:0] A,B;
input cin;
output [31:0] sum;
output cout;
wire c1, c2, c3, c4, c5, c6, c7;

CarryLookAheadAdder4bit CLA1 (A[3:0], B[3:0], cin, sum[3:0], c1);
CarryLookAheadAdder4bit CLA2 (A[7:4], B[7:4], c1, sum[7:4], c2);
CarryLookAheadAdder4bit CLA3 (A[11:8], B[11:8], c2, sum[11:8], c3);
CarryLookAheadAdder4bit CLA4 (A[15:12], B[15:12], c3, sum[15:12], c4);
CarryLookAheadAdder4bit CLA5 (A[19:16], B[19:16], c4, sum[19:16], c5);
CarryLookAheadAdder4bit CLA6 (A[23:20], B[23:20], c5, sum[23:20], c6);
CarryLookAheadAdder4bit CLA7 (A[27:24], B[27:24], c6, sum[27:24], c7);
CarryLookAheadAdder4bit CLA8 (A[31:28], B[31:28], c7, sum[31:28], cout);

endmodule

module ShiftAddMultiplier32(Multiplier,Multiplicand, Product);

   input [31:0]  Multiplier;
	input	[15:0]  Multiplicand;
   output[31:0]  Product;
   reg [31:0]    Product;
   reg           cr;
   integer       i; //used for for loop
	
   always @(*)
     begin
//initialize
        Product[31:16] = 32'd0;
        Product[15:0] = Multiplier;
        cr = 1'd0;
//add,shift algorithm        
         for(i=0; i<16; i=i+1)
           begin
               if(Product[0])
                 begin 
                        // add using the 32 bit ripple carry adder
                   RippleCarryAdder32 RCA32 (Product[63:32], Multiplicand, 1'b0, Product[63:32], cr);
                       //shift 
                   Product[31:0] = {cr,Product[31:1]};
                   cr = 0;
                 end               
               else
                 begin
                     Product[31:0] = {cr,Product[31:1]};
                      cr = 0;
                 end 
      end    //end of for loop..          
  end //end of always block
endmodule