module mux81 (d, sel, o);

// ports
input [0:7] d;
input [0:2] sel;
output reg o;

always @ (d, sel) begin
    case (sel)
        3'b000:  o = d[0];
        3'b001:  o = d[1];
        3'b010:  o = d[2];
        3'b011:  o = d[3];
        3'b100:  o = d[4];
        3'b101:  o = d[5];
        3'b110:  o = d[6];
        3'b111:  o = d[7];
        default: o = 1'b0;
    endcase
end

endmodule
