module SevenSegDecoder(
  input        clock,
  input        reset,
  input  [3:0] io_sw,
  output [6:0] io_seg,
  output [3:0] io_an
);
  wire [6:0] _GEN_0 = 4'hf == io_sw ? 7'h71 : 7'h0; // @[SevenSegDecoder.scala 14:17 63:14]
  wire [6:0] _GEN_1 = 4'he == io_sw ? 7'h79 : _GEN_0; // @[SevenSegDecoder.scala 14:17 60:14]
  wire [6:0] _GEN_2 = 4'hd == io_sw ? 7'h5e : _GEN_1; // @[SevenSegDecoder.scala 14:17 57:14]
  wire [6:0] _GEN_3 = 4'hc == io_sw ? 7'h58 : _GEN_2; // @[SevenSegDecoder.scala 14:17 54:14]
  wire [6:0] _GEN_4 = 4'hb == io_sw ? 7'h7c : _GEN_3; // @[SevenSegDecoder.scala 14:17 51:14]
  wire [6:0] _GEN_5 = 4'ha == io_sw ? 7'h77 : _GEN_4; // @[SevenSegDecoder.scala 14:17 48:14]
  wire [6:0] _GEN_6 = 4'h9 == io_sw ? 7'h6f : _GEN_5; // @[SevenSegDecoder.scala 14:17 43:14]
  wire [6:0] _GEN_7 = 4'h8 == io_sw ? 7'h7f : _GEN_6; // @[SevenSegDecoder.scala 14:17 40:14]
  wire [6:0] _GEN_8 = 4'h7 == io_sw ? 7'h7 : _GEN_7; // @[SevenSegDecoder.scala 14:17 37:14]
  wire [6:0] _GEN_9 = 4'h6 == io_sw ? 7'h7d : _GEN_8; // @[SevenSegDecoder.scala 14:17 34:14]
  wire [6:0] _GEN_10 = 4'h5 == io_sw ? 7'h6d : _GEN_9; // @[SevenSegDecoder.scala 14:17 31:14]
  wire [6:0] _GEN_11 = 4'h4 == io_sw ? 7'h66 : _GEN_10; // @[SevenSegDecoder.scala 14:17 28:14]
  wire [6:0] _GEN_12 = 4'h3 == io_sw ? 7'h4f : _GEN_11; // @[SevenSegDecoder.scala 14:17 25:14]
  wire [6:0] _GEN_13 = 4'h2 == io_sw ? 7'h5b : _GEN_12; // @[SevenSegDecoder.scala 14:17 22:14]
  wire [6:0] _GEN_14 = 4'h1 == io_sw ? 7'h6 : _GEN_13; // @[SevenSegDecoder.scala 14:17 19:14]
  wire [6:0] sevSeg = 4'h0 == io_sw ? 7'h3f : _GEN_14; // @[SevenSegDecoder.scala 14:17 16:14]
  assign io_seg = ~sevSeg; // @[SevenSegDecoder.scala 68:13]
  assign io_an = 4'he; // @[SevenSegDecoder.scala 69:9]
endmodule
