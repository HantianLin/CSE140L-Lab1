// Right shift register with an arithmetic or logical shift mode
module right_shift_register #(parameter WIDTH = 16)(
    input                    clk,
    input                    enable,
    input        [WIDTH-1:0] in, // input to shift
    input                    mode, // arithmetic (0) or logical (1) shift
    output logic [WIDTH-1:0] out); // shifted input

	
always @(posedge clk) begin
// fill in the guts	-- holds or shifts by 1 bit position
// this is a sequential operation, requiring nonblocking (<=) assignments
// if(...) out <= ...;
// else if(...) out <= ...;
//  enable   mode      out  
//    0       0        hold (no change in output)
//    0       1	     hold
//    1       1	     load and logical right shift
//    1		0	     load and arithmetic right shift
  if(!enable) begin
   out <= in;
  end
  else if (enable && mode) begin
   out <= in >> 1; // alternative way : {1'b0, in[WIDTH-1:1]};
  end
  else if (enable && !mode) begin
   out <= in >>> 1; // alternative way : {in[WIDTH-1], in[WIDTH-1:1]}
  end
 end
endmodule
