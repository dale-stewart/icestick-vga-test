`define DEFAULT_HBP 144
`define DEFAULT_HFP 784
`define DEFAULT_VBP 31
`define DEFAULT_VFP 511

`define IN_RANGE(x, xmin, xmax) (x >= xmin && x < xmax)
`define SELECT(cond, a, b) cond ? a : b

`define IN_COL(col) `IN_RANGE(hc, col*80+hbp, (col+1)*80+hbp)
`define IN_ROW(row) `IN_RANGE(vc, row*60+vbp, (row+1)*60+vbp)
`define COLOR(row, col) (((row) << 3) | (col))

module colors
   #(
    parameter hbp = `DEFAULT_HBP,
    parameter hfp = `DEFAULT_HFP,
    parameter vbp = `DEFAULT_VBP,
    parameter vfp = `DEFAULT_VFP
    )
    (
    input [9:0] vc,
    input [9:0] hc,
    output [5:0] rgb
    );

    always @(hc,vc)
    begin
        rgb = `SELECT(`IN_ROW(0) && `IN_COL(0), `COLOR(0,0),
              `SELECT(`IN_ROW(0) && `IN_COL(1), `COLOR(0,1),
              `SELECT(`IN_ROW(0) && `IN_COL(2), `COLOR(0,2),
              `SELECT(`IN_ROW(0) && `IN_COL(3), `COLOR(0,3),
              `SELECT(`IN_ROW(0) && `IN_COL(4), `COLOR(0,4),
              `SELECT(`IN_ROW(0) && `IN_COL(5), `COLOR(0,5),
              `SELECT(`IN_ROW(0) && `IN_COL(6), `COLOR(0,6),
              `SELECT(`IN_ROW(0) && `IN_COL(7), `COLOR(0,7),

              `SELECT(`IN_ROW(1) && `IN_COL(0), `COLOR(1,0),
              `SELECT(`IN_ROW(1) && `IN_COL(1), `COLOR(1,1),
              `SELECT(`IN_ROW(1) && `IN_COL(2), `COLOR(1,2),
              `SELECT(`IN_ROW(1) && `IN_COL(3), `COLOR(1,3),
              `SELECT(`IN_ROW(1) && `IN_COL(4), `COLOR(1,4),
              `SELECT(`IN_ROW(1) && `IN_COL(5), `COLOR(1,5),
              `SELECT(`IN_ROW(1) && `IN_COL(6), `COLOR(1,6),
              `SELECT(`IN_ROW(1) && `IN_COL(7), `COLOR(1,7),

              `SELECT(`IN_ROW(2) && `IN_COL(0), `COLOR(2,0),
              `SELECT(`IN_ROW(2) && `IN_COL(1), `COLOR(2,1),
              `SELECT(`IN_ROW(2) && `IN_COL(2), `COLOR(2,2),
              `SELECT(`IN_ROW(2) && `IN_COL(3), `COLOR(2,3),
              `SELECT(`IN_ROW(2) && `IN_COL(4), `COLOR(2,4),
              `SELECT(`IN_ROW(2) && `IN_COL(5), `COLOR(2,5),
              `SELECT(`IN_ROW(2) && `IN_COL(6), `COLOR(2,6),
              `SELECT(`IN_ROW(2) && `IN_COL(7), `COLOR(2,7),

              `SELECT(`IN_ROW(3) && `IN_COL(0), `COLOR(3,0),
              `SELECT(`IN_ROW(3) && `IN_COL(1), `COLOR(3,1),
              `SELECT(`IN_ROW(3) && `IN_COL(2), `COLOR(3,2),
              `SELECT(`IN_ROW(3) && `IN_COL(3), `COLOR(3,3),
              `SELECT(`IN_ROW(3) && `IN_COL(4), `COLOR(3,4),
              `SELECT(`IN_ROW(3) && `IN_COL(5), `COLOR(3,5),
              `SELECT(`IN_ROW(3) && `IN_COL(6), `COLOR(3,6),
              `SELECT(`IN_ROW(3) && `IN_COL(7), `COLOR(3,7),

              `SELECT(`IN_ROW(4) && `IN_COL(0), `COLOR(4,0),
              `SELECT(`IN_ROW(4) && `IN_COL(1), `COLOR(4,1),
              `SELECT(`IN_ROW(4) && `IN_COL(2), `COLOR(4,2),
              `SELECT(`IN_ROW(4) && `IN_COL(3), `COLOR(4,3),
              `SELECT(`IN_ROW(4) && `IN_COL(4), `COLOR(4,4),
              `SELECT(`IN_ROW(4) && `IN_COL(5), `COLOR(4,5),
              `SELECT(`IN_ROW(4) && `IN_COL(6), `COLOR(4,6),
              `SELECT(`IN_ROW(4) && `IN_COL(7), `COLOR(4,7),

              `SELECT(`IN_ROW(5) && `IN_COL(0), `COLOR(5,0),
              `SELECT(`IN_ROW(5) && `IN_COL(1), `COLOR(5,1),
              `SELECT(`IN_ROW(5) && `IN_COL(2), `COLOR(5,2),
              `SELECT(`IN_ROW(5) && `IN_COL(3), `COLOR(5,3),
              `SELECT(`IN_ROW(5) && `IN_COL(4), `COLOR(5,4),
              `SELECT(`IN_ROW(5) && `IN_COL(5), `COLOR(5,5),
              `SELECT(`IN_ROW(5) && `IN_COL(6), `COLOR(5,6),
              `SELECT(`IN_ROW(5) && `IN_COL(7), `COLOR(5,7),

              `SELECT(`IN_ROW(6) && `IN_COL(0), `COLOR(6,0),
              `SELECT(`IN_ROW(6) && `IN_COL(1), `COLOR(6,1),
              `SELECT(`IN_ROW(6) && `IN_COL(2), `COLOR(6,2),
              `SELECT(`IN_ROW(6) && `IN_COL(3), `COLOR(6,3),
              `SELECT(`IN_ROW(6) && `IN_COL(4), `COLOR(6,4),
              `SELECT(`IN_ROW(6) && `IN_COL(5), `COLOR(6,5),
              `SELECT(`IN_ROW(6) && `IN_COL(6), `COLOR(6,6),
              `SELECT(`IN_ROW(6) && `IN_COL(7), `COLOR(6,7),

              `SELECT(`IN_ROW(7) && `IN_COL(0), `COLOR(7,0),
              `SELECT(`IN_ROW(7) && `IN_COL(1), `COLOR(7,1),
              `SELECT(`IN_ROW(7) && `IN_COL(2), `COLOR(7,2),
              `SELECT(`IN_ROW(7) && `IN_COL(3), `COLOR(7,3),
              `SELECT(`IN_ROW(7) && `IN_COL(4), `COLOR(7,4),
              `SELECT(`IN_ROW(7) && `IN_COL(5), `COLOR(7,5),
              `SELECT(`IN_ROW(7) && `IN_COL(6), `COLOR(7,6),
              `SELECT(`IN_ROW(7) && `IN_COL(7), `COLOR(7,7),

              'b000000
              ))))))))
              ))))))))
              ))))))))
              ))))))))
              ))))))))
              ))))))))
              ))))))))
              ))))))))
              ;
    end

endmodule
