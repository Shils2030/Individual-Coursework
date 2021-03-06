module task1_tb;

//Use these for the inputs.
logic a,b,c;
integer i;

//Use these two signals for the outputs
logic [1:0] y_structural, y_other;

// Instantiate both UUT
task1a u1 (y_structural, a, b, c);
task1b u2 (y_other, a, b, c);

initial
begin

//Write your testbench here

{a, b, c} = 3'b000;
#2 {a, b, c} = 3'b001;		//This is going through all the possiblities in the truth table.
#2 {a, b, c} = 3'b010;
#2 {a, b, c} = 3'b011;
#2 {a, b, c} = 3'b100;
#2 {a, b, c} = 3'b101;
#2 {a, b, c} = 3'b110;
#2 {a, b, c} = 3'b111;

//Task1b below

a <= 0;  		//Since this does not have to use structural, I used a different one which uses i as an integer to go through all the possiblilties.
b <= 0;

$monitor("A=%0b B=%0b C=%0b y_other=%0b", a, b, c, y_other);	//This will display the simulation results if I had a monitor.

	for (i = 0; i < 8; i = i + 1) begin
		{a, b, c} = i;
		#10;
	end
end

initial $monitor("y_structural=%b, a=%b, b=%b, c=^b", y_structual, a, b, c);   ////This will display the simulation results if I had a monitor.

endmodule

