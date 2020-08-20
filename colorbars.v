module colorbars
   #(
    parameter hbp = 144,
    parameter hfp = 784,
    parameter vbp = 31,
    parameter vfp = 511
    )
    (
    input [9:0] vc,
    input [9:0] hc,
    output [5:0] rgb
    );

    always @(hc,vc)
    begin
        // first check if we're within vertical active video range
        if (vc >= vbp && vc < vfp)
        begin
            // now display different colors every 80 pixels
            // while we're within the active horizontal range
            // -----------------
            // display white bar
            if (hc >= hbp && hc < (hbp+80))
            begin
                rgb = 'b111111;
            end
            // display yellow bar
            else if (hc >= (hbp+80) && hc < (hbp+160))
            begin
                rgb = 'b111100;
            end
            // display cyan bar
            else if (hc >= (hbp+160) && hc < (hbp+240))
            begin
                rgb = 'b001111;
            end
            // display green bar
            else if (hc >= (hbp+240) && hc < (hbp+320))
            begin
                rgb = 'b001100;
            end
            // display magenta bar
            else if (hc >= (hbp+320) && hc < (hbp+400))
            begin
                rgb = 'b110011;
            end
            // display red bar
            else if (hc >= (hbp+400) && hc < (hbp+480))
            begin
                rgb = 'b110000;
            end
            // display blue bar
            else if (hc >= (hbp+480) && hc < (hbp+560))
            begin
                rgb = 'b000011;
            end
            // display black bar
            else if (hc >= (hbp+560) && hc < (hbp+640))
            begin
                rgb = 'b000000;
            end
            // we're outside active horizontal range so display black
            else
            begin
                rgb = 'b000000;
            end
        end
        // we're outside active vertical range so display black
        else
        begin
            rgb = 'b000000;
        end
    end
endmodule
