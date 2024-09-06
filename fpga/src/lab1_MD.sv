// lab1_MD.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/3/24

// This is my top module for lab1 that has a four bit input s read in from onboard 
// dip switches and outputs both a 3 bit led[2:0] signal which control onboard leds
// in addition to a 7 bit output signal seg[6:0] that controls a seven segment display
module lab1_MD(
	input 	logic [3:0] s,
	output 	logic [2:0] led, output logic [6:0] seg
);
	// calls submodule to drive leds
	ledController s0 (s, led);
	// calls submodule to drive sevenSegment display
	sevenSegment s1 (s, seg);

endmodule