module lab1SVSim(
	input 	logic [3:0] s, input logic clk,
	output 	logic [2:0] led, output logic [6:0] seg
);

	xor g1(led[0], s[0], s[1]);
	and g2(led[1], s[2], s[3]);
	
	logic [24:0] counter = 0;
	logic int_osc;
	logic ledOn = 0;
	// Internal high-speed oscillator
	// HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
		// Simple clock divider
	always_ff @(posedge clk)
		begin
			counter <= counter + 1;
			if(counter == 10241637)
				begin
					counter <= 0;
					if(ledOn == 0) ledOn <= 1;
					else ledOn <= 0;
				end
		end
		
	assign led[2] = ledOn;
	
	always_comb begin
		case(s)
			4'h0: seg = 7'b1000000;
			4'h1: seg = 7'b1110011;
			4'h2: seg = 7'b0100100;
			4'h3: seg = 7'b0100001;
			4'h4: seg = 7'b0010011;
			4'h5: seg = 7'b0001001;
			4'h6: seg = 7'b0001000;
			4'h7: seg = 7'b1100011;
			4'h8: seg = 7'b0000000;
			4'h9: seg = 7'b0000001;
			4'ha: seg = 7'b0000010;
			4'hb: seg = 7'b0011000;
			4'hc: seg = 7'b1001100;
			4'hd: seg = 7'b0110000;
			4'he: seg = 7'b0001100;
			4'hf: seg = 7'b0001110;

		endcase
	end

endmodule
