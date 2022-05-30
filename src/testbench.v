module testbench;

reg a, b, c, ck, rs;
wire [0:6] p;
wire c1, c2;

localparam period = 20;
localparam inpsize = 11;

reg inp [0:(inpsize - 1)] [0:3];

initial begin
    ck = 1'b0;
    forever #5 ck = ~ck;
end

initial begin
    $dumpfile("sim/testbench.vcd");
    $dumpvars(0, testbench);

    { a, b, c, rs } = { 1'b0, 1'b0, 1'b0, 1'b0 };
    #period;
    rs = 1'b1;

    { inp[0][0], inp[0][1], inp[0][2], inp[0][3] } = { 1'b0, 1'b1, 1'b0, 1'b1 };
    { inp[1][0], inp[1][1], inp[1][2], inp[1][3] } = { 1'b1, 1'b0, 1'b0, 1'b1 };
    { inp[2][0], inp[2][1], inp[2][2], inp[2][3] } = { 1'b0, 1'b1, 1'b0, 1'b1 };
    { inp[3][0], inp[3][1], inp[3][2], inp[3][3] } = { 1'b1, 1'b0, 1'b0, 1'b1 };
    { inp[4][0], inp[4][1], inp[4][2], inp[4][3] } = { 1'b0, 1'b0, 1'b0, 1'b1 };
    { inp[5][0], inp[5][1], inp[5][2], inp[5][3] } = { 1'b0, 1'b1, 1'b0, 1'b1 };
    { inp[6][0], inp[6][1], inp[6][2], inp[6][3] } = { 1'b0, 1'b0, 1'b1, 1'b1 };
    { inp[7][0], inp[7][1], inp[7][2], inp[7][3] } = { 1'b0, 1'b1, 1'b0, 1'b1 };
    { inp[8][0], inp[8][1], inp[8][2], inp[8][3] } = { 1'b0, 1'b0, 1'b1, 1'b1 };
    { inp[9][0], inp[9][1], inp[9][2], inp[9][3] } = { 1'b1, 1'b0, 1'b0, 1'b1 };
    { inp[10][0], inp[10][1], inp[10][2], inp[10][3] } = { 1'b1, 1'b0, 1'b0, 1'b1 };

    for (integer i = 0; i < inpsize; i++) begin
        { a, b, c } = { inp[i][0], inp[i][1], inp[i][2] };
        #period;
    end

    $stop;
end

toplevel uut (
    .a  (a),
    .b  (b),
    .c  (c),
    .ck (ck),
    .rs (rs),
    .p  (p),
    .c1 (c1),
    .c2 (c2)
);

endmodule
