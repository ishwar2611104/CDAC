`timescale 1ns / 1ps

///////////////////////
// 2:1 MUX Module
///////////////////////
module mux(
    input i0,
    input i1,
    input s,
    output y
);
    assign y = (i0 & ~s) | (i1 & s);
endmodule

///////////////////////
// 7:1 MUX Module
///////////////////////
module mux7to1(
    input i0, i1, i2, i3, i4, i5, i6,
    input [2:0] select,
    output y
);
    wire w1, w2, w3, w4, w5;

    // First level
    mux m1(i0, i1, select[0], w1);
    mux m2(i2, i3, select[0], w2);
    mux m3(i4, i5, select[0], w3);

    // Second level
    mux m4(w1, w2, select[1], w4);
    mux m5(w3, i6, select[1], w5);  // i6 stands alone

    // Final level
    mux m6(w4, w5, select[2], y);
endmodule

///////////////////////
// 13:1 MUX Module
///////////////////////
module mux13to1(
    input i0, i1, i2, i3, i4, i5, i6,
    input i7, i8, i9, i10, i11, i12,
    input [3:0] select,
    output y
);
    wire w1, w2, w3, w4, w5, w6, w7;
    wire w8, w9, w10, w11, w12;

    // First level
    mux m0(i0, i1, select[0], w1);
    mux m1(i2, i3, select[0], w2);
    mux m2(i4, i5, select[0], w3);
    mux m3(i6, i7, select[0], w4);
    mux m4(i8, i9, select[0], w5);
    mux m5(i10, i11, select[0], w6);
    mux m6(i12, 1'b0, select[0], w7); // only 1 input, dummy 0 as other

    // Second level
    mux m7(w1, w2, select[1], w8);
    mux m8(w3, w4, select[1], w9);
    mux m9(w5, w6, select[1], w10);
    mux m10(w7, 1'b0, select[1], w11); // padding with dummy again

    // Third level
    mux m11(w8, w9, select[2], w12);
    mux m12(w10, w11, select[2], w5); // reusing w5 as intermediate

    // Final level
    mux m13(w12, w5, select[3], y);
endmodule
