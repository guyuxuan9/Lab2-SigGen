module sinegen #(
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    // interface signals
    input logic                clk,
    input logic                rst,
    input logic                en,
    input logic [D_WIDTH-1:0]  incr, // increment for addr counter
    input logic [A_WIDTH-1:0]  offset,
    output logic [D_WIDTH-1:0] dout1,
    output logic [D_WIDTH-1:0] dout2
);

logic [A_WIDTH-1:0]         address; // interconnect wire

counter addrCounter(
    .clk(clk),
    .rst(rst),
    .en(en),
    .incr(incr),
    .count(address)
);

rom sinRom(
    .clk(clk),
    .addr1(address),
    .addr2(address + offset),
    .dout1(dout1),
    .dout2(dout2)
);

endmodule
