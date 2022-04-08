//Dataflow or behavioural only

/*
A	B	C	Y
0	0	0	00
0	0	1	01
0	1	0	01
0	1	1	10
1	0	0	01
1	0	1	10
1	1	0	10
1	1	1	11
*/

module task1b(output logic [1:0] Y, input logic A, B, C); 	//Here I am using the assign statements to complete my full adder

	assign Y[1] = (A ^ B) ^ C;
	assign Y[0] = (A & B) | ((A ^ B) & C);			//I can use the two statements for each bit of Y the output.

endmodule

