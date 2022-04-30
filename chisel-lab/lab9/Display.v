module Display(
  input         clock,
  input         reset,
  input  [15:0] io_sw,
  output [6:0]  io_seg,
  output [3:0]  io_an
);
  assign io_seg = 7'h0; // @[Display.scala 22:10]
  assign io_an = 4'he; // @[Display.scala 23:9]
endmodule
