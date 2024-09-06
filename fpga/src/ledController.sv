// lab1_MD.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/6/24

// This is my sub module for lab1 that has a four bit input s read in from onboard 
// dip switches and outputs a 3 bit led[2:0] signal which control onboard leds
module ledController(
	input 	logic [3:0] s,
	output 	logic [2:0] led
);

	xor g1(led[0], s[0], s[1]);
	and g2(led[1], s[2], s[3]);
	
	logic [24:0] counter = 0;
	logic int_osc;
	logic ledOn = 0;
	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
		// Simple clock divider
	always_ff @(posedge int_osc)
		begin
			counter <= counter + 1;
			if(counter == 10000000)
				begin
					counter <= 0;
					if(ledOn == 0) ledOn <= 1;
					else ledOn <= 0;
				end
		end
		
	assign led[2] = ledOn;
endmodule