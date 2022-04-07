
module task2 #(parameter N=16'b1010110011100001) (output logic [15:0] Q, input logic CLK, n_RESET);

//Write solution here
logic feedback;
int i;
logic [N-1:0] taps;
initial
begin
taps = ?0;
case (N)
2: taps |= (1?b1 << 1);
3: taps |= (1?b1 << 1);
4: taps |= (1?b1 << 1);
5: taps |= (1?b1 << 2);
6: taps |= (1?b1 << 1);
7: taps |= (1?b1 << 1);
8: taps |= ((1?b1 << 6) | (1?b1 << 5)
| (1?b1 << 1));
9: taps |= (1?b1 << 4);
10: taps |= (1?b1 << 3);
11: taps |= (1?b1 << 2);
12: taps |= ((1?b1 << 7) | (1?b1 << 4)
| (1?b1 << 3));
13: taps |= ((1?b1 << 4) | (1?b1 << 3)
| (1?b1 << 1));
14: taps |= ((1?b1 << 12) | (1?b1 << 11)
| (1?b1 << 1));
15: taps |= (1?b1 << 1);
16: taps |= ((1?b1 << 5) | (1?b1 << 3)
| (1?b1 << 2));
17: taps |= ((1?b1 << 3));
18: taps |= ((1?b1 << 7));
19: taps |= ((1?b1 << 6) | (1?b1 << 5)
| (1?b1 << 1));
20: taps |= (1?b1 << 3);
21: taps |= (1?b1 << 2);
22: taps |= (1?b1 << 1);
23: taps |= (1?b1 << 5);
24: taps |= ((1?b1 << 4) | (1?b1 << 3)
| (1?b1 << 1));
25: taps |= (1?b1 << 3);
26: taps |= ((1?b1 << 8) | (1?b1 << 7)
| (1?b1 << 1));
27: taps |= ((1?b1 << 8) | (1?b1 << 7)
| (1?b1 << 1));
28: taps |= (1?b1 << 3);
29: taps |= (1?b1 << 2);
30: taps |= ((1?b1 << 16) | (1?b1 << 15)
| (1?b1 << 1));
31: taps |= (1?b1 << 3);
32: taps |= ((1?b1 << 28) | (1?b1 << 27)
| (1?b1 << 1));
33: taps |= (1?b1 << 13);
34: taps |= ((1?b1 << 15) | (1?b1 << 14)
| (1?b1 << 1));
35: taps |= (1?b1 << 2);
36: taps |= (1?b1 << 11);
endcase
end
always_ff @(posedge clock, negedge n_set)
if (?n_set)
q <= ?1;
else
q <= {feedback, q[N-1:1]};
always_comb
begin
feedback = q[0];
for (i = 1; i <= N - 1; i++)
if (taps[i])
feedback ?= q[i];
end
endmodule

endmodule