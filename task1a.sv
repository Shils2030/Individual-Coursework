// ELEC241 C1 2022
//Structural Version

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

module task1a(output logic [1:0] Y, input logic A, B, C);

//Internal wires

wire t1, t2, t3, t4 ,t5, t6, t7, t8, t9, t10;		//Since I cannot use an XOR gate I had to find another way to do the full adder logic circuit. This required alot of wires.

//Place and connect gates

not n0 (t1, A);					//Not gates to start with the other gates following, naming them after their first letter.
not n1 (t2, B);
not n2 (t3, C);
and a0 (t4, t1, t2, C);
and a1 (t5, t1, B, t3);
and a2 (t6, A, B, C);
and a3 (t7, A, t2, t3);
or o0 ( Y[1], t4, t5, t6, t7);
and a4 (t8, B, C);
and a5 (t9, A, B);
and a6 (t10, A, C);
or o1 (Y[0], t8, t9, t10);	//Using the Y[0] to display the 2 bit output

endmodule
