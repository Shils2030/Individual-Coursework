module task2_tb;

// Add internal signals here

initial begin

//Write testbench here

	localparam N = 16;
	reg CLK, n_RESET;
	wire [15:N] Q;

	//Instantiate unit under test

	task2 #(.N(N)) uut(
		.CLK(CLK),
		.n_RESET(n_RESET),
		.Q(Q)
	);

	//Generating a clock signal
	localparam T = 10;
	always
	begin
		CLK = 1'b0;
		#(T / 2);
		CLK = 1'b1:
		#(T / 2);
	end

	initial
	begin
	//Quick reset for 2ns
		n_RESET = 1'b0;
		#2
		n_RESET = 1'b1;
		
		repeat(2) @(negedge clk);
		wait ( Q == 1);

		#20 $stop;
	end

end

endmodule
