// 3:1 mux    
// CSE140L	  
module mux3 #(parameter WIDTH = 8)
  (input       [WIDTH-1:0] d0, d1, d2,
   input       [1:0]       s, 	// s[1] s[0]
   output logic[WIDTH-1:0] y);

// fill in guts (combinational -- assign or always_comb, use =)
//  s[1]  s[0]  y
//  0     0    d0
//  0     1	   d1
//  1     0    d2
//  1     1	   d2

always @* begin
 if (s == 2'b00) begin
  y[7:0] = d0[7:0];
 end
 else if (s == 2'b01) begin
  y[7:0] = d1[7:0];
 end
 else if (s == 2'b10 || s == 2'b11) begin
  y[7:0] = d2[7:0];
 end
end
endmodule
