module counter(ck, en, rs, ld, d, q);

input ck, en, rs, ld;
input [3:0] d;
output reg [3:0] q;

always @ (posedge ck, negedge rs, negedge ld) begin
    if (!rs)
        q = 4'b0000;
    else begin
        if (!ld)
            q = d;
        else if (en)
            q = q + 1;
    end
end

endmodule
