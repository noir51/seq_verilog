module decoder (c, s);

// ports
input [3:0] c;
output reg [0:9] s;

always @ (c) begin
    s = 10'd0;
    case (c)
        4'b0000: s[0] = 1'b1;
        4'b0001: s[1] = 1'b1;
        4'b0010: s[2] = 1'b1;
        4'b0011: s[3] = 1'b1;
        4'b0100: s[4] = 1'b1;
        4'b0101: s[5] = 1'b1;
        4'b0110: s[6] = 1'b1;
        4'b0111: s[7] = 1'b1;
        4'b1000: s[8] = 1'b1;
        4'b1001: s[9] = 1'b1;
        default: s    = 10'd0;
    endcase
end

endmodule
