// adapted from NERP demo vga640x480.v

module vga(
	input wire pclk,		//pll clock: 25.13MHz
	input wire clr,			//asynchronous reset
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
    output wire [5:0] rgb,
	output wire D1,
	output wire D2,
	output wire D3,
	output wire D4,
	output wire D5,
	);

wire clk;

  SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
                  .PLLOUT_SELECT("GENCLK"),
                  .DIVR(4'b0001),
                  .DIVF(7'b1000010),
                  .DIVQ(3'b100),
                  .FILTER_RANGE(3'b001),
                 ) uut (
                         .REFERENCECLK(pclk),
                         .PLLOUTCORE(clk),
                         .LOCK(D5),
                         .RESETB(1'b1),
                         .BYPASS(1'b0)
                        );

// video structure constants
parameter hpixels = 800; // horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
// parameter hbp = 144; 	// end of horizontal back porch
// parameter hfp = 784; 	// beginning of horizontal front porch
// parameter vbp = 31; 		// end of vertical back porch
// parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

always @(posedge clk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end

	end
end

assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

assign D1 = 0;
assign D2 = 0;
assign D3 = 0;
assign D4 = 0;

colors #(.hbp(144), .hfp(784), .vbp(31), .vfp(511)) cb(vc, hc, rgb);

endmodule

