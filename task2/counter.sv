module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input logic              clk,
    input logic              rst,
    input logic              en,
    input logic  [7:0]       incr,
    output logic [WIDTH-1:0] count  // count output 
);

always_ff @(posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else     count <= count + {{WIDTH-1{1'b0}},incr};
    
endmodule
