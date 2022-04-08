
module task2 #(parameter N=16'b1010110011100001) (output logic [15:N] Q, input logic CLK, n_RESET);

//Write solution here
	
	reg [15:N] Q_reg, Q_next;
	wire taps;
	
	always @(posedge CLK, negedge n_RESET)
	begin
		if (~n_RESET)
			Q_reg <= 'd1010110011100001; //LFSR should not start at 0 instead it starts at the number required
		else
			Q_reg <= Q_next;
	end

	//Next state logic
	always @(taps, Q_reg)
		Q_next = {taps, Q_reg[15:N - 1]};

	//Output logic
	assign Q = Q_reg;
	
	//N = 16
	assign taps = Q_reg[16] ^ Q_reg[16] ^ Q_reg[13] ^ Q_reg[4];

	//Looked at a table that showed that the taps to use for 16 bit LFSR.

endmodule