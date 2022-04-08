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

wire t1, t2, k;

//Place and connect gates

xor g1(Y, A, B, C);
xor g2(k, A, B);
and (t1, A, B);
and (t2, k, C);
or (Y, t1, t2);

endmodule
