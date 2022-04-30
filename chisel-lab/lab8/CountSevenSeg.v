module SevenSegDec(
  input  [3:0] io_in,
  output [6:0] io_out
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[SevenSegDec.scala 13:17 62:14]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[SevenSegDec.scala 13:17 59:14]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h5e : _GEN_1; // @[SevenSegDec.scala 13:17 56:14]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h58 : _GEN_2; // @[SevenSegDec.scala 13:17 53:14]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h7c : _GEN_3; // @[SevenSegDec.scala 13:17 50:14]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h77 : _GEN_4; // @[SevenSegDec.scala 13:17 47:14]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h6f : _GEN_5; // @[SevenSegDec.scala 13:17 42:14]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h7f : _GEN_6; // @[SevenSegDec.scala 13:17 39:14]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h7 : _GEN_7; // @[SevenSegDec.scala 13:17 36:14]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h7d : _GEN_8; // @[SevenSegDec.scala 13:17 33:14]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h6d : _GEN_9; // @[SevenSegDec.scala 13:17 30:14]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h66 : _GEN_10; // @[SevenSegDec.scala 13:17 27:14]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h4f : _GEN_11; // @[SevenSegDec.scala 13:17 24:14]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h5b : _GEN_12; // @[SevenSegDec.scala 13:17 21:14]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h6 : _GEN_13; // @[SevenSegDec.scala 13:17 18:14]
  assign io_out = 4'h0 == io_in ? 7'h3f : _GEN_14; // @[SevenSegDec.scala 13:17 15:14]
endmodule
module CountSevenSeg(
  input        clock,
  input        reset,
  output [6:0] io_seg,
  output [3:0] io_an
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] segDec_io_in; // @[CountSevenSeg.scala 29:22]
  wire [6:0] segDec_io_out; // @[CountSevenSeg.scala 29:22]
  reg [31:0] cntReg; // @[CountSevenSeg.scala 15:23]
  reg [3:0] segReg; // @[CountSevenSeg.scala 16:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[CountSevenSeg.scala 18:20]
  wire [3:0] _segReg_T_1 = segReg + 4'h1; // @[CountSevenSeg.scala 21:22]
  wire [4:0] _GEN_3 = {{1'd0}, segReg}; // @[CountSevenSeg.scala 24:16]
  wire [6:0] sevSeg = segDec_io_out;
  SevenSegDec segDec ( // @[CountSevenSeg.scala 29:22]
    .io_in(segDec_io_in),
    .io_out(segDec_io_out)
  );
  assign io_seg = ~sevSeg; // @[CountSevenSeg.scala 35:13]
  assign io_an = 4'h0; // @[CountSevenSeg.scala 36:9]
  assign segDec_io_in = segReg; // @[CountSevenSeg.scala 30:16]
  always @(posedge clock) begin
    if (reset) begin // @[CountSevenSeg.scala 15:23]
      cntReg <= 32'h0; // @[CountSevenSeg.scala 15:23]
    end else if (cntReg == 32'h2faf07f) begin // @[CountSevenSeg.scala 19:28]
      cntReg <= 32'h0; // @[CountSevenSeg.scala 20:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[CountSevenSeg.scala 18:10]
    end
    if (reset) begin // @[CountSevenSeg.scala 16:23]
      segReg <= 4'h0; // @[CountSevenSeg.scala 16:23]
    end else if (_GEN_3 == 5'h10) begin // @[CountSevenSeg.scala 24:26]
      segReg <= 4'h0; // @[CountSevenSeg.scala 25:12]
    end else if (cntReg == 32'h2faf07f) begin // @[CountSevenSeg.scala 19:28]
      segReg <= _segReg_T_1; // @[CountSevenSeg.scala 21:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  segReg = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
