// load and store register
// sequential NOT combinational
module register # (parameter N = 8)
   (input                clk,   // implied input wire
    input                load,
    input                clear,
    input        [N-1:0] in,
    output logic [N-1:0] out
    );
	 
  always_ff @ (posedge clk, posedge clear)    begin
		if (clear) begin
			// if clear = 1, out is always 0
			out <= 0;
		end
		else if (load) begin
			// if clear != 1 and load = 1, out = in
			out <= in;
		end
		// else out holds
		
// Aside: What would be the impact of leaving posedge clear out of 
//  the sensitivity list? 
end	
		
endmodule
