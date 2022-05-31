module counter(ck, en, rs, ld, d, q);

// ports
input ck, en, rs, ld;
input [3:0] d;
output reg [3:0] q;

always @ (posedge ck, negedge rs, negedge ld) begin
    if (!rs)
        q = 4'b0000; // reset
    else begin
        if (!ld)
            q = d; // asynchronous load
        else if (en)
            q = q + 1; // count
    end
end

endmodule
