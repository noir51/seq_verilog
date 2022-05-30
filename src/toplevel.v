module toplevel (a, b, c, ck, rs, p, c1, c2);

input a, b, c, ck, rs;
output reg c1, c2;
output reg [0:6] p;

wire [3:0] dc;
wire [0:9] ds;

reg cck, cen, crs, cld;
wire [3:0] cd;
wire [3:0] cq;

reg [0:7] mdld, mden;
reg [0:2] msel;
wire mld, men;

assign { dc[3], dc[2:0] } = { 1'b0, cq[2:0] };
assign { cd[3], cd[2], cd[1:0] } = { 1'b0, ds[1], 2'b00 };

always @ (posedge ck) begin
    if (ck) begin
        cen = men;
        cld = ~mld;
    end
end

always @ (ck, rs) begin
    cck = ck;
    crs = rs;
end

always @ (cq) begin
    { msel[2], msel[1], msel[0] } = { cq[0], cq[1], cq[2] };
end

always @ (a, b, c) begin
    mden = 8'd0;
    mdld = 8'd0;
    { mden[0], mden[1], mden[2], mden[4], mden[5] } = { b, a, b, b, c };
    { mdld[1], mdld[3], mdld[6] } = { c, a, a };
end

always @ (ds, p) begin
    p = ds[0:6];
    c1 = p[1] | p[5] | p[6];
    c2 = p[0] | p[2] | p[4];
end

counter _icounter(
    .ck (cck),
    .en (cen),
    .rs (crs),
    .ld (cld),
    .d  (cd),
    .q  (cq)
);

decoder _idecoder(
    .c (dc),
    .s (ds)
);

mux81 _ildmux(
    .d   (mdld),
    .sel (msel),
    .o   (mld)
);

mux81 _ienmux(
    .d   (mden),
    .sel (msel),
    .o   (men)
);

endmodule
