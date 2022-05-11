module IoSync(
  input   clock,
  input   io_buy,
  input   io_coin2,
  input   io_coin5,
  input   io_p1,
  input   io_p2,
  output  io_s_buy,
  output  io_s_coin2,
  output  io_s_coin5,
  output  io_s_p1,
  output  io_s_p2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg  io_s_buy_REG; // @[IoSync.scala 18:30]
  reg  io_s_buy_REG_1; // @[IoSync.scala 18:22]
  reg  io_s_coin2_REG; // @[IoSync.scala 19:32]
  reg  io_s_coin2_REG_1; // @[IoSync.scala 19:24]
  reg  io_s_coin5_REG; // @[IoSync.scala 20:32]
  reg  io_s_coin5_REG_1; // @[IoSync.scala 20:24]
  reg  io_s_p1_REG; // @[IoSync.scala 21:29]
  reg  io_s_p1_REG_1; // @[IoSync.scala 21:21]
  reg  io_s_p2_REG; // @[IoSync.scala 22:29]
  reg  io_s_p2_REG_1; // @[IoSync.scala 22:21]
  assign io_s_buy = io_s_buy_REG_1; // @[IoSync.scala 18:12]
  assign io_s_coin2 = io_s_coin2_REG_1; // @[IoSync.scala 19:14]
  assign io_s_coin5 = io_s_coin5_REG_1; // @[IoSync.scala 20:14]
  assign io_s_p1 = io_s_p1_REG_1; // @[IoSync.scala 21:11]
  assign io_s_p2 = io_s_p2_REG_1; // @[IoSync.scala 22:11]
  always @(posedge clock) begin
    io_s_buy_REG <= io_buy; // @[IoSync.scala 18:30]
    io_s_buy_REG_1 <= io_s_buy_REG; // @[IoSync.scala 18:22]
    io_s_coin2_REG <= io_coin2; // @[IoSync.scala 19:32]
    io_s_coin2_REG_1 <= io_s_coin2_REG; // @[IoSync.scala 19:24]
    io_s_coin5_REG <= io_coin5; // @[IoSync.scala 20:32]
    io_s_coin5_REG_1 <= io_s_coin5_REG; // @[IoSync.scala 20:24]
    io_s_p1_REG <= io_p1; // @[IoSync.scala 21:29]
    io_s_p1_REG_1 <= io_s_p1_REG; // @[IoSync.scala 21:21]
    io_s_p2_REG <= io_p2; // @[IoSync.scala 22:29]
    io_s_p2_REG_1 <= io_s_p2_REG; // @[IoSync.scala 22:21]
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
  io_s_buy_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_s_buy_REG_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_s_coin2_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_s_coin2_REG_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_s_coin5_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_s_coin5_REG_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_s_p1_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_s_p1_REG_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_s_p2_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_s_p2_REG_1 = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FSM(
  input   clock,
  input   reset,
  input   io_buyCheck,
  input   io_buy,
  input   io_coin2,
  input   io_coin5,
  output  io_add2,
  output  io_add5,
  output  io_subPrice,
  output  io_releaseCan,
  output  io_alarm
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[FSM.scala 24:22]
  wire  _T = 3'h0 == state; // @[FSM.scala 28:17]
  wire [2:0] _GEN_0 = io_buy ? 3'h3 : 3'h0; // @[FSM.scala 32:{27,34} 33:34]
  wire  _T_1 = 3'h2 == state; // @[FSM.scala 28:17]
  wire  _T_2 = 3'h1 == state; // @[FSM.scala 28:17]
  wire [2:0] _GEN_3 = io_buyCheck ? 3'h6 : 3'h4; // @[FSM.scala 42:{25,32} 43:32]
  wire  _T_4 = 3'h4 == state; // @[FSM.scala 28:17]
  wire [2:0] _GEN_4 = io_buy ? 3'h4 : 3'h7; // @[FSM.scala 46:{20,27} 47:27]
  wire  _T_5 = 3'h6 == state; // @[FSM.scala 28:17]
  wire  _T_6 = 3'h5 == state; // @[FSM.scala 28:17]
  wire [2:0] _GEN_5 = io_buy ? 3'h5 : 3'h7; // @[FSM.scala 53:{20,27} 54:27]
  wire [2:0] _GEN_6 = ~(io_buy | io_coin2 | io_coin5) ? 3'h0 : 3'h7; // @[FSM.scala 57:{45,52} 58:25]
  wire [2:0] _GEN_7 = 3'h7 == state ? _GEN_6 : state; // @[FSM.scala 28:17 24:22]
  wire [2:0] _GEN_8 = 3'h5 == state ? _GEN_5 : _GEN_7; // @[FSM.scala 28:17]
  wire [2:0] _GEN_9 = 3'h6 == state ? 3'h5 : _GEN_8; // @[FSM.scala 28:17 50:13]
  wire [2:0] _GEN_10 = 3'h4 == state ? _GEN_4 : _GEN_9; // @[FSM.scala 28:17]
  wire [2:0] _GEN_11 = 3'h3 == state ? _GEN_3 : _GEN_10; // @[FSM.scala 28:17]
  wire  _GEN_17 = _T_5 ? 1'h0 : _T_6; // @[FSM.scala 63:16 21:17]
  wire  _GEN_19 = _T_4 ? 1'h0 : _T_5; // @[FSM.scala 20:15 63:16]
  wire  _GEN_20 = _T_4 ? 1'h0 : _GEN_17; // @[FSM.scala 63:16 21:17]
  wire  _GEN_22 = _T_2 ? 1'h0 : _T_4; // @[FSM.scala 19:12 63:16]
  wire  _GEN_23 = _T_2 ? 1'h0 : _GEN_19; // @[FSM.scala 20:15 63:16]
  wire  _GEN_24 = _T_2 ? 1'h0 : _GEN_20; // @[FSM.scala 63:16 21:17]
  wire  _GEN_26 = _T_1 ? 1'h0 : _T_2; // @[FSM.scala 18:11 63:16]
  wire  _GEN_27 = _T_1 ? 1'h0 : _GEN_22; // @[FSM.scala 19:12 63:16]
  wire  _GEN_28 = _T_1 ? 1'h0 : _GEN_23; // @[FSM.scala 20:15 63:16]
  wire  _GEN_29 = _T_1 ? 1'h0 : _GEN_24; // @[FSM.scala 63:16 21:17]
  assign io_add2 = _T ? 1'h0 : _T_1; // @[FSM.scala 63:16 65:15]
  assign io_add5 = _T ? 1'h0 : _GEN_26; // @[FSM.scala 63:16 66:15]
  assign io_subPrice = _T ? 1'h0 : _GEN_28; // @[FSM.scala 20:15 63:16]
  assign io_releaseCan = _T ? 1'h0 : _GEN_29; // @[FSM.scala 63:16 68:21]
  assign io_alarm = _T ? 1'h0 : _GEN_27; // @[FSM.scala 63:16 67:16]
  always @(posedge clock) begin
    if (reset) begin // @[FSM.scala 24:22]
      state <= 3'h0; // @[FSM.scala 24:22]
    end else if (3'h0 == state) begin // @[FSM.scala 28:17]
      if (io_coin2) begin // @[FSM.scala 30:27]
        state <= 3'h2; // @[FSM.scala 30:34]
      end else if (io_coin5) begin // @[FSM.scala 31:27]
        state <= 3'h1; // @[FSM.scala 31:34]
      end else begin
        state <= _GEN_0;
      end
    end else if (3'h2 == state) begin // @[FSM.scala 28:17]
      state <= 3'h7; // @[FSM.scala 36:13]
    end else if (3'h1 == state) begin // @[FSM.scala 28:17]
      state <= 3'h7; // @[FSM.scala 39:13]
    end else begin
      state <= _GEN_11;
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
  state = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Datapath(
  input        clock,
  input        reset,
  input  [7:0] io_price,
  input        io_add2,
  input        io_add5,
  input        io_subPrice,
  output       io_buyCheck,
  output [7:0] io_sum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] sumReg; // @[Datapath.scala 15:23]
  wire [7:0] _sumReg_T_1 = sumReg + 8'h2; // @[Datapath.scala 18:22]
  wire [7:0] _sumReg_T_3 = sumReg + 8'h5; // @[Datapath.scala 22:22]
  wire [7:0] _sumReg_T_5 = sumReg - io_price; // @[Datapath.scala 26:22]
  assign io_buyCheck = sumReg >= io_price; // @[Datapath.scala 29:15]
  assign io_sum = sumReg; // @[Datapath.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[Datapath.scala 15:23]
      sumReg <= 8'h0; // @[Datapath.scala 15:23]
    end else if (io_subPrice) begin // @[Datapath.scala 25:21]
      sumReg <= _sumReg_T_5; // @[Datapath.scala 26:12]
    end else if (io_add5) begin // @[Datapath.scala 21:17]
      sumReg <= _sumReg_T_3; // @[Datapath.scala 22:12]
    end else if (io_add2) begin // @[Datapath.scala 17:17]
      sumReg <= _sumReg_T_1; // @[Datapath.scala 18:12]
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
  sumReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SevenSegDec(
  input  [4:0] io_in,
  output [6:0] io_out
);
  wire [6:0] _GEN_0 = 5'h1f == io_in ? 7'h5c : 7'h0; // @[SevenSegDec.scala 14:17 46:23]
  wire [6:0] _GEN_1 = 5'h1e == io_in ? 7'h1c : _GEN_0; // @[SevenSegDec.scala 14:17 45:23]
  wire [6:0] _GEN_2 = 5'h1d == io_in ? 7'h3e : _GEN_1; // @[SevenSegDec.scala 14:17 44:23]
  wire [6:0] _GEN_3 = 5'h1c == io_in ? 7'h78 : _GEN_2; // @[SevenSegDec.scala 14:17 43:23]
  wire [6:0] _GEN_4 = 5'h1b == io_in ? 7'h33 : _GEN_3; // @[SevenSegDec.scala 14:17 42:23]
  wire [6:0] _GEN_5 = 5'h1a == io_in ? 7'h67 : _GEN_4; // @[SevenSegDec.scala 14:17 41:23]
  wire [6:0] _GEN_6 = 5'h19 == io_in ? 7'h73 : _GEN_5; // @[SevenSegDec.scala 14:17 40:23]
  wire [6:0] _GEN_7 = 5'h18 == io_in ? 7'h37 : _GEN_6; // @[SevenSegDec.scala 14:17 39:23]
  wire [6:0] _GEN_8 = 5'h17 == io_in ? 7'h15 : _GEN_7; // @[SevenSegDec.scala 14:17 38:23]
  wire [6:0] _GEN_9 = 5'h16 == io_in ? 7'h38 : _GEN_8; // @[SevenSegDec.scala 14:17 37:23]
  wire [6:0] _GEN_10 = 5'h15 == io_in ? 7'h75 : _GEN_9; // @[SevenSegDec.scala 14:17 36:23]
  wire [6:0] _GEN_11 = 5'h14 == io_in ? 7'h1e : _GEN_10; // @[SevenSegDec.scala 14:17 35:23]
  wire [6:0] _GEN_12 = 5'h13 == io_in ? 7'h3d : _GEN_11; // @[SevenSegDec.scala 14:17 34:23]
  wire [6:0] _GEN_13 = 5'h12 == io_in ? 7'hf : _GEN_12; // @[SevenSegDec.scala 14:17 33:23]
  wire [6:0] _GEN_14 = 5'h11 == io_in ? 7'h39 : _GEN_13; // @[SevenSegDec.scala 14:17 32:23]
  wire [6:0] _GEN_15 = 5'h10 == io_in ? 7'h76 : _GEN_14; // @[SevenSegDec.scala 14:17 31:23]
  wire [6:0] _GEN_16 = 5'hf == io_in ? 7'h71 : _GEN_15; // @[SevenSegDec.scala 14:17 30:23]
  wire [6:0] _GEN_17 = 5'he == io_in ? 7'h79 : _GEN_16; // @[SevenSegDec.scala 14:17 29:23]
  wire [6:0] _GEN_18 = 5'hd == io_in ? 7'h5e : _GEN_17; // @[SevenSegDec.scala 14:17 28:23]
  wire [6:0] _GEN_19 = 5'hc == io_in ? 7'h58 : _GEN_18; // @[SevenSegDec.scala 14:17 27:23]
  wire [6:0] _GEN_20 = 5'hb == io_in ? 7'h7c : _GEN_19; // @[SevenSegDec.scala 14:17 26:23]
  wire [6:0] _GEN_21 = 5'ha == io_in ? 7'h77 : _GEN_20; // @[SevenSegDec.scala 14:17 25:23]
  wire [6:0] _GEN_22 = 5'h9 == io_in ? 7'h6f : _GEN_21; // @[SevenSegDec.scala 14:17 24:23]
  wire [6:0] _GEN_23 = 5'h8 == io_in ? 7'h7f : _GEN_22; // @[SevenSegDec.scala 14:17 23:23]
  wire [6:0] _GEN_24 = 5'h7 == io_in ? 7'h7 : _GEN_23; // @[SevenSegDec.scala 14:17 22:23]
  wire [6:0] _GEN_25 = 5'h6 == io_in ? 7'h7d : _GEN_24; // @[SevenSegDec.scala 14:17 21:23]
  wire [6:0] _GEN_26 = 5'h5 == io_in ? 7'h6d : _GEN_25; // @[SevenSegDec.scala 14:17 20:23]
  wire [6:0] _GEN_27 = 5'h4 == io_in ? 7'h66 : _GEN_26; // @[SevenSegDec.scala 14:17 19:23]
  wire [6:0] _GEN_28 = 5'h3 == io_in ? 7'h4f : _GEN_27; // @[SevenSegDec.scala 14:17 18:23]
  wire [6:0] _GEN_29 = 5'h2 == io_in ? 7'h5b : _GEN_28; // @[SevenSegDec.scala 14:17 17:23]
  wire [6:0] _GEN_30 = 5'h1 == io_in ? 7'h6 : _GEN_29; // @[SevenSegDec.scala 14:17 16:23]
  assign io_out = 5'h0 == io_in ? 7'h3f : _GEN_30; // @[SevenSegDec.scala 14:17 15:23]
endmodule
module DisplayMultiplexer5bit(
  input         clock,
  input         reset,
  input         io_rawEnable,
  input  [27:0] io_raw,
  input  [9:0]  io_sum,
  input  [9:0]  io_price,
  output [6:0]  io_seg,
  output [3:0]  io_an
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] decoder_io_in; // @[DisplayMultiplexer5bit.scala 27:23]
  wire [6:0] decoder_io_out; // @[DisplayMultiplexer5bit.scala 27:23]
  reg [31:0] tcReg; // @[DisplayMultiplexer5bit.scala 15:22]
  reg [1:0] anReg; // @[DisplayMultiplexer5bit.scala 16:22]
  wire [31:0] _tcReg_T_1 = tcReg + 32'h1; // @[DisplayMultiplexer5bit.scala 19:20]
  wire [1:0] _anReg_T_1 = anReg + 2'h1; // @[DisplayMultiplexer5bit.scala 22:20]
  wire  _T_1 = 2'h0 == anReg; // @[DisplayMultiplexer5bit.scala 32:19]
  wire  _T_2 = 2'h1 == anReg; // @[DisplayMultiplexer5bit.scala 32:19]
  wire  _T_3 = 2'h2 == anReg; // @[DisplayMultiplexer5bit.scala 32:19]
  wire  _T_4 = 2'h3 == anReg; // @[DisplayMultiplexer5bit.scala 32:19]
  wire [6:0] _GEN_3 = 2'h3 == anReg ? io_raw[6:0] : decoder_io_out; // @[DisplayMultiplexer5bit.scala 29:10 32:19 47:16]
  wire [3:0] _GEN_4 = 2'h2 == anReg ? 4'h2 : 4'h1; // @[DisplayMultiplexer5bit.scala 32:19 42:16]
  wire [6:0] _GEN_5 = 2'h2 == anReg ? io_raw[13:7] : _GEN_3; // @[DisplayMultiplexer5bit.scala 32:19 43:16]
  wire [3:0] _GEN_6 = 2'h1 == anReg ? 4'h4 : _GEN_4; // @[DisplayMultiplexer5bit.scala 32:19 38:16]
  wire [6:0] _GEN_7 = 2'h1 == anReg ? io_raw[20:14] : _GEN_5; // @[DisplayMultiplexer5bit.scala 32:19 39:16]
  wire [3:0] _GEN_8 = 2'h0 == anReg ? 4'h8 : _GEN_6; // @[DisplayMultiplexer5bit.scala 32:19 34:16]
  wire [6:0] _GEN_9 = 2'h0 == anReg ? io_raw[27:21] : _GEN_7; // @[DisplayMultiplexer5bit.scala 32:19 35:16]
  wire [4:0] _GEN_11 = _T_4 ? io_price[4:0] : 5'h0; // @[DisplayMultiplexer5bit.scala 28:17 52:19 67:23]
  wire [4:0] _GEN_13 = _T_3 ? io_price[9:5] : _GEN_11; // @[DisplayMultiplexer5bit.scala 52:19 63:23]
  wire [4:0] _GEN_15 = _T_2 ? io_sum[4:0] : _GEN_13; // @[DisplayMultiplexer5bit.scala 52:19 59:23]
  wire [4:0] _GEN_17 = _T_1 ? io_sum[9:5] : _GEN_15; // @[DisplayMultiplexer5bit.scala 52:19 55:23]
  wire [3:0] select = io_rawEnable ? _GEN_8 : _GEN_8; // @[DisplayMultiplexer5bit.scala 31:22]
  wire [6:0] sevSeg = io_rawEnable ? _GEN_9 : decoder_io_out; // @[DisplayMultiplexer5bit.scala 31:22 51:12]
  SevenSegDec decoder ( // @[DisplayMultiplexer5bit.scala 27:23]
    .io_in(decoder_io_in),
    .io_out(decoder_io_out)
  );
  assign io_seg = ~sevSeg; // @[DisplayMultiplexer5bit.scala 72:13]
  assign io_an = ~select; // @[DisplayMultiplexer5bit.scala 73:12]
  assign decoder_io_in = io_rawEnable ? 5'h0 : _GEN_17; // @[DisplayMultiplexer5bit.scala 28:17 31:22]
  always @(posedge clock) begin
    if (reset) begin // @[DisplayMultiplexer5bit.scala 15:22]
      tcReg <= 32'h0; // @[DisplayMultiplexer5bit.scala 15:22]
    end else if (tcReg < 32'h186a0) begin // @[DisplayMultiplexer5bit.scala 18:29]
      tcReg <= _tcReg_T_1; // @[DisplayMultiplexer5bit.scala 19:11]
    end else begin
      tcReg <= 32'h0; // @[DisplayMultiplexer5bit.scala 21:11]
    end
    if (reset) begin // @[DisplayMultiplexer5bit.scala 16:22]
      anReg <= 2'h0; // @[DisplayMultiplexer5bit.scala 16:22]
    end else if (!(tcReg < 32'h186a0)) begin // @[DisplayMultiplexer5bit.scala 18:29]
      anReg <= _anReg_T_1; // @[DisplayMultiplexer5bit.scala 22:11]
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
  tcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  anReg = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DecimalSeperator(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [7:0] _left_T = io_in / 10'ha; // @[DecimalSeperator.scala 28:22]
  wire [12:0] left = {_left_T, 5'h0}; // @[DecimalSeperator.scala 28:36]
  wire [9:0] _GEN_1 = {{2'd0}, io_in}; // @[DecimalSeperator.scala 29:22]
  wire [9:0] _GEN_2 = _GEN_1 % 10'ha; // @[DecimalSeperator.scala 29:22]
  wire [7:0] right = _GEN_2[7:0]; // @[DecimalSeperator.scala 29:22]
  wire [12:0] _GEN_0 = {{5'd0}, right}; // @[DecimalSeperator.scala 31:18]
  wire [12:0] _io_out_T = left | _GEN_0; // @[DecimalSeperator.scala 31:18]
  assign io_out = _io_out_T[7:0]; // @[DecimalSeperator.scala 31:10]
endmodule
module RNG(
  input        clock,
  input        reset,
  output [3:0] io_random
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] cnt; // @[RNGsimple.scala 19:20]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[RNGsimple.scala 20:14]
  assign io_random = cnt; // @[RNGsimple.scala 23:13]
  always @(posedge clock) begin
    if (reset) begin // @[RNGsimple.scala 19:20]
      cnt <= 4'h0; // @[RNGsimple.scala 19:20]
    end else if (cnt == 4'hf) begin // @[RNGsimple.scala 21:22]
      cnt <= 4'h0; // @[RNGsimple.scala 21:28]
    end else begin
      cnt <= _cnt_T_1; // @[RNGsimple.scala 20:7]
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
  cnt = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Win(
  input         clock,
  input         reset,
  input         io_enable,
  output [3:0]  io_visualPoints,
  output [13:0] io_visualBuffer
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] cnt; // @[Win.scala 24:20]
  reg [31:0] clk; // @[Win.scala 25:20]
  wire [31:0] _clk_T_1 = clk + 32'h1; // @[Win.scala 27:16]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[Win.scala 30:18]
  wire  _T_2 = 4'h0 == cnt; // @[Win.scala 36:15]
  wire  _T_3 = 4'h1 == cnt; // @[Win.scala 36:15]
  wire  _T_4 = 4'h2 == cnt; // @[Win.scala 36:15]
  wire  _T_5 = 4'h3 == cnt; // @[Win.scala 36:15]
  wire  _T_6 = 4'h4 == cnt; // @[Win.scala 36:15]
  wire  _T_7 = 4'h5 == cnt; // @[Win.scala 36:15]
  wire  _T_8 = 4'h6 == cnt; // @[Win.scala 36:15]
  wire  _T_9 = 4'h7 == cnt; // @[Win.scala 36:15]
  wire  _T_10 = 4'h8 == cnt; // @[Win.scala 36:15]
  wire  _T_11 = 4'h9 == cnt; // @[Win.scala 36:15]
  wire  _T_12 = 4'ha == cnt; // @[Win.scala 36:15]
  wire  _T_13 = 4'hb == cnt; // @[Win.scala 36:15]
  wire  _T_14 = 4'hc == cnt; // @[Win.scala 36:15]
  wire  _T_15 = 4'hd == cnt; // @[Win.scala 36:15]
  wire  _T_16 = 4'he == cnt; // @[Win.scala 36:15]
  wire [2:0] _GEN_5 = 4'he == cnt ? 3'h7 : 3'h0; // @[Win.scala 36:15 21:19 51:33]
  wire [2:0] _GEN_6 = 4'hd == cnt ? 3'h0 : _GEN_5; // @[Win.scala 36:15 50:33]
  wire [2:0] _GEN_7 = 4'hc == cnt ? 3'h7 : _GEN_6; // @[Win.scala 36:15 49:33]
  wire [2:0] _GEN_8 = 4'hb == cnt ? 3'h0 : _GEN_7; // @[Win.scala 36:15 48:33]
  wire [2:0] _GEN_9 = 4'ha == cnt ? 3'h7 : _GEN_8; // @[Win.scala 36:15 47:33]
  wire [2:0] _GEN_10 = 4'h9 == cnt ? 3'h0 : _GEN_9; // @[Win.scala 36:15 46:33]
  wire [2:0] _GEN_11 = 4'h8 == cnt ? 3'h7 : _GEN_10; // @[Win.scala 36:15 45:33]
  wire [2:0] _GEN_12 = 4'h7 == cnt ? 3'h7 : _GEN_11; // @[Win.scala 36:15 44:33]
  wire [2:0] _GEN_13 = 4'h6 == cnt ? 3'h6 : _GEN_12; // @[Win.scala 36:15 43:33]
  wire [2:0] _GEN_14 = 4'h5 == cnt ? 3'h5 : _GEN_13; // @[Win.scala 36:15 42:33]
  wire [2:0] _GEN_15 = 4'h4 == cnt ? 3'h4 : _GEN_14; // @[Win.scala 36:15 41:33]
  wire [2:0] _GEN_16 = 4'h3 == cnt ? 3'h3 : _GEN_15; // @[Win.scala 36:15 40:33]
  wire [2:0] _GEN_17 = 4'h2 == cnt ? 3'h2 : _GEN_16; // @[Win.scala 36:15 39:33]
  wire [2:0] _GEN_18 = 4'h1 == cnt ? 3'h1 : _GEN_17; // @[Win.scala 36:15 38:33]
  wire [2:0] _GEN_19 = 4'h0 == cnt ? 3'h0 : _GEN_18; // @[Win.scala 36:15 37:33]
  wire [7:0] _GEN_20 = _T_16 ? 8'h81 : 8'h0; // @[Win.scala 55:15 22:19 70:33]
  wire [13:0] _GEN_21 = _T_15 ? 14'h2040 : {{6'd0}, _GEN_20}; // @[Win.scala 55:15 69:33]
  wire [13:0] _GEN_22 = _T_14 ? 14'h408 : _GEN_21; // @[Win.scala 55:15 68:33]
  wire [13:0] _GEN_23 = _T_13 ? 14'h81 : _GEN_22; // @[Win.scala 55:15 67:33]
  wire [13:0] _GEN_24 = _T_12 ? 14'h2040 : _GEN_23; // @[Win.scala 55:15 66:33]
  wire [13:0] _GEN_25 = _T_11 ? 14'h408 : _GEN_24; // @[Win.scala 55:15 65:33]
  wire [13:0] _GEN_26 = _T_10 ? 14'h0 : _GEN_25; // @[Win.scala 55:15 64:33]
  wire [13:0] _GEN_27 = _T_9 ? 14'h2040 : _GEN_26; // @[Win.scala 55:15 63:33]
  wire [13:0] _GEN_28 = _T_8 ? 14'h2040 : _GEN_27; // @[Win.scala 55:15 62:33]
  wire [13:0] _GEN_29 = _T_7 ? 14'h81 : _GEN_28; // @[Win.scala 55:15 61:33]
  wire [13:0] _GEN_30 = _T_6 ? 14'h81 : _GEN_29; // @[Win.scala 55:15 60:33]
  wire [13:0] _GEN_31 = _T_5 ? 14'h2040 : _GEN_30; // @[Win.scala 55:15 59:33]
  wire [13:0] _GEN_32 = _T_4 ? 14'h2040 : _GEN_31; // @[Win.scala 55:15 58:33]
  wire [13:0] _GEN_33 = _T_3 ? 14'h408 : _GEN_32; // @[Win.scala 55:15 57:33]
  assign io_visualPoints = {{1'd0}, _GEN_19};
  assign io_visualBuffer = _T_2 ? 14'h408 : _GEN_33; // @[Win.scala 55:15 56:33]
  always @(posedge clock) begin
    if (reset) begin // @[Win.scala 24:20]
      cnt <= 4'h0; // @[Win.scala 24:20]
    end else if (io_enable) begin // @[Win.scala 26:19]
      if (cnt == 4'hf) begin // @[Win.scala 32:24]
        cnt <= 4'h0; // @[Win.scala 32:30]
      end else if (clk == 32'h3f940a) begin // @[Win.scala 28:27]
        cnt <= _cnt_T_1; // @[Win.scala 30:11]
      end
    end
    if (reset) begin // @[Win.scala 25:20]
      clk <= 32'h0; // @[Win.scala 25:20]
    end else if (io_enable) begin // @[Win.scala 26:19]
      if (clk == 32'h3f940a) begin // @[Win.scala 28:27]
        clk <= 32'h0; // @[Win.scala 29:11]
      end else begin
        clk <= _clk_T_1; // @[Win.scala 27:9]
      end
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
  cnt = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  clk = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SpeedupTable(
  input  [3:0] io_idx,
  output [4:0] io_out
);
  wire [3:0] _GEN_0 = 4'hf == io_idx ? 4'hc : 4'h0; // @[SpeedupTable.scala 15:10 17:18 33:23]
  wire [3:0] _GEN_1 = 4'he == io_idx ? 4'ha : _GEN_0; // @[SpeedupTable.scala 17:18 32:23]
  wire [3:0] _GEN_2 = 4'hd == io_idx ? 4'h8 : _GEN_1; // @[SpeedupTable.scala 17:18 31:23]
  wire [3:0] _GEN_3 = 4'hc == io_idx ? 4'h7 : _GEN_2; // @[SpeedupTable.scala 17:18 30:23]
  wire [3:0] _GEN_4 = 4'hb == io_idx ? 4'h6 : _GEN_3; // @[SpeedupTable.scala 17:18 29:23]
  wire [3:0] _GEN_5 = 4'ha == io_idx ? 4'h5 : _GEN_4; // @[SpeedupTable.scala 17:18 28:23]
  wire [3:0] _GEN_6 = 4'h9 == io_idx ? 4'h4 : _GEN_5; // @[SpeedupTable.scala 17:18 27:23]
  wire [3:0] _GEN_7 = 4'h8 == io_idx ? 4'h3 : _GEN_6; // @[SpeedupTable.scala 17:18 26:23]
  wire [3:0] _GEN_8 = 4'h7 == io_idx ? 4'h2 : _GEN_7; // @[SpeedupTable.scala 17:18 25:23]
  wire [3:0] _GEN_9 = 4'h6 == io_idx ? 4'h2 : _GEN_8; // @[SpeedupTable.scala 17:18 24:23]
  wire [3:0] _GEN_10 = 4'h5 == io_idx ? 4'h2 : _GEN_9; // @[SpeedupTable.scala 17:18 23:23]
  wire [3:0] _GEN_11 = 4'h4 == io_idx ? 4'h1 : _GEN_10; // @[SpeedupTable.scala 17:18 22:23]
  wire [3:0] _GEN_12 = 4'h3 == io_idx ? 4'h1 : _GEN_11; // @[SpeedupTable.scala 17:18 21:23]
  wire [3:0] _GEN_13 = 4'h2 == io_idx ? 4'h1 : _GEN_12; // @[SpeedupTable.scala 17:18 20:23]
  wire [3:0] _GEN_14 = 4'h1 == io_idx ? 4'h1 : _GEN_13; // @[SpeedupTable.scala 17:18 19:23]
  wire [3:0] _GEN_15 = 4'h0 == io_idx ? 4'h0 : _GEN_14; // @[SpeedupTable.scala 17:18 18:23]
  assign io_out = {{1'd0}, _GEN_15};
endmodule
module Pong(
  input         clock,
  input         reset,
  input         io_p1,
  input         io_p2,
  input         io_restart,
  output [6:0]  io_p1points,
  output [6:0]  io_p2points,
  output        io_renderMode,
  output [27:0] io_renderOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire  RNG_clock; // @[Pong.scala 61:19]
  wire  RNG_reset; // @[Pong.scala 61:19]
  wire [3:0] RNG_io_random; // @[Pong.scala 61:19]
  wire  win_clock; // @[Pong.scala 62:19]
  wire  win_reset; // @[Pong.scala 62:19]
  wire  win_io_enable; // @[Pong.scala 62:19]
  wire [3:0] win_io_visualPoints; // @[Pong.scala 62:19]
  wire [13:0] win_io_visualBuffer; // @[Pong.scala 62:19]
  wire [3:0] speedupTable_io_idx; // @[Pong.scala 92:28]
  wire [4:0] speedupTable_io_out; // @[Pong.scala 92:28]
  reg [3:0] p1pointsPersist; // @[Pong.scala 33:32]
  reg [3:0] p2pointsPersist; // @[Pong.scala 34:32]
  reg [3:0] p1pointsTable; // @[Pong.scala 35:30]
  reg [3:0] p2pointsTable; // @[Pong.scala 36:30]
  wire [6:0] _GEN_0 = 4'h8 == p1pointsTable ? 7'h7f : 7'h0; // @[Pong.scala 31:15 37:25 46:27]
  wire [6:0] _GEN_1 = 4'h7 == p1pointsTable ? 7'h7f : _GEN_0; // @[Pong.scala 37:25 45:27]
  wire [6:0] _GEN_2 = 4'h6 == p1pointsTable ? 7'h7e : _GEN_1; // @[Pong.scala 37:25 44:27]
  wire [6:0] _GEN_3 = 4'h5 == p1pointsTable ? 7'h7c : _GEN_2; // @[Pong.scala 37:25 43:27]
  wire [6:0] _GEN_4 = 4'h4 == p1pointsTable ? 7'h78 : _GEN_3; // @[Pong.scala 37:25 42:27]
  wire [6:0] _GEN_5 = 4'h3 == p1pointsTable ? 7'h70 : _GEN_4; // @[Pong.scala 37:25 41:27]
  wire [6:0] _GEN_6 = 4'h2 == p1pointsTable ? 7'h60 : _GEN_5; // @[Pong.scala 37:25 40:27]
  wire [6:0] _GEN_7 = 4'h1 == p1pointsTable ? 7'h40 : _GEN_6; // @[Pong.scala 37:25 39:27]
  wire [6:0] _GEN_9 = 4'h8 == p2pointsTable ? 7'h7f : 7'h0; // @[Pong.scala 32:15 48:25 57:27]
  wire [6:0] _GEN_10 = 4'h7 == p2pointsTable ? 7'h7f : _GEN_9; // @[Pong.scala 48:25 56:27]
  wire [6:0] _GEN_11 = 4'h6 == p2pointsTable ? 7'h7e : _GEN_10; // @[Pong.scala 48:25 55:27]
  wire [6:0] _GEN_12 = 4'h5 == p2pointsTable ? 7'h7c : _GEN_11; // @[Pong.scala 48:25 54:27]
  wire [6:0] _GEN_13 = 4'h4 == p2pointsTable ? 7'h78 : _GEN_12; // @[Pong.scala 48:25 53:27]
  wire [6:0] _GEN_14 = 4'h3 == p2pointsTable ? 7'h70 : _GEN_13; // @[Pong.scala 48:25 52:27]
  wire [6:0] _GEN_15 = 4'h2 == p2pointsTable ? 7'h60 : _GEN_14; // @[Pong.scala 48:25 51:27]
  wire [6:0] _GEN_16 = 4'h1 == p2pointsTable ? 7'h40 : _GEN_15; // @[Pong.scala 48:25 50:27]
  reg  blk; // @[Pong.scala 65:20]
  reg [31:0] blkCnt; // @[Pong.scala 67:23]
  wire [31:0] _blkCnt_T_1 = blkCnt + 32'h1; // @[Pong.scala 68:20]
  wire  _GEN_19 = blkCnt == 32'h17d7840 ? 1'h0 : blk; // @[Pong.scala 65:20 69:31 71:9]
  wire  _GEN_20 = blkCnt == 32'hbebc20 | _GEN_19; // @[Pong.scala 73:35 74:9]
  reg [27:0] buffer; // @[Pong.scala 79:23]
  reg [31:0] bufCnt; // @[Pong.scala 80:23]
  wire [31:0] _bufCnt_T_1 = bufCnt + 32'h1; // @[Pong.scala 81:20]
  reg [3:0] hitCnt; // @[Pong.scala 84:23]
  reg [31:0] bulletCnt; // @[Pong.scala 85:26]
  wire [31:0] _bulletCnt_T_1 = bulletCnt + 32'h1; // @[Pong.scala 86:26]
  wire [23:0] _T_21 = 19'h7f281 * speedupTable_io_out; // @[Pong.scala 94:52]
  wire [23:0] _T_23 = 24'hbebc20 - _T_21; // @[Pong.scala 94:34]
  wire [31:0] _GEN_168 = {{8'd0}, _T_23}; // @[Pong.scala 94:18]
  reg  bulletY; // @[Pong.scala 98:24]
  reg [2:0] bullet; // @[Pong.scala 99:24]
  reg  p1pos; // @[Pong.scala 100:24]
  reg  p2pos; // @[Pong.scala 101:24]
  reg  p1Trigger_REG; // @[Pong.scala 103:36]
  wire  p1Trigger = io_p1 & ~p1Trigger_REG; // @[Pong.scala 103:25]
  reg  p2Trigger_REG; // @[Pong.scala 104:36]
  wire  p2Trigger = io_p2 & ~p2Trigger_REG; // @[Pong.scala 104:25]
  reg [3:0] state; // @[Pong.scala 107:22]
  wire  _GEN_24 = io_p2 ? 1'h0 : bulletY; // @[Pong.scala 128:24 130:17 98:24]
  wire [3:0] _GEN_25 = io_p2 ? 4'h4 : state; // @[Pong.scala 128:24 131:15 107:22]
  wire  _GEN_27 = io_p1 | _GEN_24; // @[Pong.scala 123:18 125:17]
  wire [3:0] _GEN_28 = io_p1 ? 4'h3 : _GEN_25; // @[Pong.scala 123:18 126:15]
  wire [3:0] _hitCnt_T_1 = hitCnt + 4'h1; // @[Pong.scala 136:48]
  wire [3:0] _GEN_29 = hitCnt < 4'hf ? _hitCnt_T_1 : hitCnt; // @[Pong.scala 136:{29,38} 84:23]
  wire  rnd = RNG_io_random < 4'h8; // @[Pong.scala 137:33]
  wire [2:0] _bullet_T_1 = bullet + 3'h1; // @[Pong.scala 138:50]
  wire [2:0] _GEN_30 = rnd == bulletY ? _bullet_T_1 : bullet; // @[Pong.scala 138:{31,40} 99:24]
  wire [3:0] _GEN_34 = p1pos == bulletY ? 4'h3 : 4'h6; // @[Pong.scala 135:31 140:15 142:15]
  wire  rnd_1 = RNG_io_random > 4'h7; // @[Pong.scala 148:33]
  wire [2:0] _bullet_T_3 = bullet - 3'h1; // @[Pong.scala 149:50]
  wire [2:0] _GEN_36 = rnd_1 == bulletY ? _bullet_T_3 : bullet; // @[Pong.scala 149:{31,40} 99:24]
  wire [3:0] _GEN_37 = p2pos == bulletY ? _GEN_29 : hitCnt; // @[Pong.scala 146:31 84:23]
  wire [2:0] _GEN_38 = p2pos == bulletY ? _GEN_36 : bullet; // @[Pong.scala 146:31 99:24]
  wire  _GEN_39 = p2pos == bulletY ? rnd_1 : bulletY; // @[Pong.scala 146:31 150:17 98:24]
  wire [3:0] _GEN_40 = p2pos == bulletY ? 4'h4 : 4'h5; // @[Pong.scala 146:31 151:15 153:15]
  wire [3:0] _p1pointsPersist_T_1 = p1pointsPersist + 4'h1; // @[Pong.scala 158:42]
  wire [3:0] _p1pointsTable_T_1 = p1pointsTable + 4'h1; // @[Pong.scala 159:38]
  wire [3:0] _GEN_41 = p1pointsPersist == 4'h6 ? 4'h9 : 4'h8; // @[Pong.scala 160:36 161:15 162:27]
  wire [3:0] _p2pointsPersist_T_1 = p2pointsPersist + 4'h1; // @[Pong.scala 166:42]
  wire [3:0] _p2pointsTable_T_1 = p2pointsTable + 4'h1; // @[Pong.scala 167:38]
  wire [3:0] _GEN_42 = p2pointsPersist == 4'h6 ? 4'ha : 4'h7; // @[Pong.scala 168:36 169:15 170:27]
  wire [3:0] _GEN_43 = p1Trigger ? 4'h3 : state; // @[Pong.scala 107:22 172:{35,43}]
  wire [3:0] _GEN_44 = p2Trigger ? 4'h4 : state; // @[Pong.scala 107:22 173:{35,43}]
  wire  _T_42 = bulletCnt == 32'h0; // @[Pong.scala 176:24]
  wire [2:0] _GEN_45 = bulletCnt == 32'h0 ? _bullet_T_1 : bullet; // @[Pong.scala 176:33 177:18 99:24]
  wire [2:0] _GEN_46 = bullet < 3'h7 ? _GEN_45 : bullet; // @[Pong.scala 175:26 99:24]
  wire [3:0] _GEN_47 = bullet < 3'h7 ? state : 4'h2; // @[Pong.scala 107:22 175:26 179:28]
  wire [2:0] _GEN_48 = _T_42 ? _bullet_T_3 : bullet; // @[Pong.scala 183:33 184:18 99:24]
  wire [2:0] _GEN_49 = bullet > 3'h0 ? _GEN_48 : bullet; // @[Pong.scala 182:26 99:24]
  wire [3:0] _GEN_50 = bullet > 3'h0 ? state : 4'h1; // @[Pong.scala 107:22 182:26 186:28]
  wire [3:0] _GEN_51 = p1Trigger ? 4'h0 : state; // @[Pong.scala 107:22 189:{23,31}]
  wire [27:0] _buffer_T = {win_io_visualBuffer, 14'h0}; // @[Pong.scala 192:44]
  wire [3:0] _GEN_52 = p2Trigger ? 4'h0 : state; // @[Pong.scala 107:22 195:{23,31}]
  wire [3:0] _GEN_53 = 4'ha == state ? _GEN_52 : state; // @[Pong.scala 110:17 107:22]
  wire [3:0] _GEN_55 = 4'ha == state ? win_io_visualPoints : p2pointsTable; // @[Pong.scala 110:17 197:21 36:30]
  wire [27:0] _GEN_56 = 4'ha == state ? {{14'd0}, win_io_visualBuffer} : buffer; // @[Pong.scala 110:17 198:21 79:23]
  wire [3:0] _GEN_57 = 4'h9 == state ? _GEN_51 : _GEN_53; // @[Pong.scala 110:17]
  wire  _GEN_58 = 4'h9 == state | 4'ha == state; // @[Pong.scala 110:17 190:21]
  wire [3:0] _GEN_59 = 4'h9 == state ? win_io_visualPoints : p1pointsTable; // @[Pong.scala 110:17 191:21 35:30]
  wire [27:0] _GEN_60 = 4'h9 == state ? _buffer_T : _GEN_56; // @[Pong.scala 110:17 192:21]
  wire [3:0] _GEN_61 = 4'h9 == state ? p2pointsTable : _GEN_55; // @[Pong.scala 110:17 36:30]
  wire [2:0] _GEN_62 = 4'h4 == state ? _GEN_49 : bullet; // @[Pong.scala 110:17 99:24]
  wire [3:0] _GEN_63 = 4'h4 == state ? _GEN_50 : _GEN_57; // @[Pong.scala 110:17]
  wire  _GEN_64 = 4'h4 == state ? 1'h0 : _GEN_58; // @[Pong.scala 110:17 63:17]
  wire [3:0] _GEN_65 = 4'h4 == state ? p1pointsTable : _GEN_59; // @[Pong.scala 110:17 35:30]
  wire [27:0] _GEN_66 = 4'h4 == state ? buffer : _GEN_60; // @[Pong.scala 110:17 79:23]
  wire [3:0] _GEN_67 = 4'h4 == state ? p2pointsTable : _GEN_61; // @[Pong.scala 110:17 36:30]
  wire [2:0] _GEN_68 = 4'h3 == state ? _GEN_46 : _GEN_62; // @[Pong.scala 110:17]
  wire [3:0] _GEN_69 = 4'h3 == state ? _GEN_47 : _GEN_63; // @[Pong.scala 110:17]
  wire  _GEN_70 = 4'h3 == state ? 1'h0 : _GEN_64; // @[Pong.scala 110:17 63:17]
  wire [3:0] _GEN_71 = 4'h3 == state ? p1pointsTable : _GEN_65; // @[Pong.scala 110:17 35:30]
  wire [27:0] _GEN_72 = 4'h3 == state ? buffer : _GEN_66; // @[Pong.scala 110:17 79:23]
  wire [3:0] _GEN_73 = 4'h3 == state ? p2pointsTable : _GEN_67; // @[Pong.scala 110:17 36:30]
  wire [3:0] _GEN_74 = 4'h8 == state ? _GEN_44 : _GEN_69; // @[Pong.scala 110:17]
  wire [2:0] _GEN_75 = 4'h8 == state ? bullet : _GEN_68; // @[Pong.scala 110:17 99:24]
  wire  _GEN_76 = 4'h8 == state ? 1'h0 : _GEN_70; // @[Pong.scala 110:17 63:17]
  wire [3:0] _GEN_77 = 4'h8 == state ? p1pointsTable : _GEN_71; // @[Pong.scala 110:17 35:30]
  wire [27:0] _GEN_78 = 4'h8 == state ? buffer : _GEN_72; // @[Pong.scala 110:17 79:23]
  wire [3:0] _GEN_79 = 4'h8 == state ? p2pointsTable : _GEN_73; // @[Pong.scala 110:17 36:30]
  wire [3:0] _GEN_80 = 4'h7 == state ? _GEN_43 : _GEN_74; // @[Pong.scala 110:17]
  wire [2:0] _GEN_81 = 4'h7 == state ? bullet : _GEN_75; // @[Pong.scala 110:17 99:24]
  wire  _GEN_82 = 4'h7 == state ? 1'h0 : _GEN_76; // @[Pong.scala 110:17 63:17]
  wire [3:0] _GEN_83 = 4'h7 == state ? p1pointsTable : _GEN_77; // @[Pong.scala 110:17 35:30]
  wire [27:0] _GEN_84 = 4'h7 == state ? buffer : _GEN_78; // @[Pong.scala 110:17 79:23]
  wire [3:0] _GEN_85 = 4'h7 == state ? p2pointsTable : _GEN_79; // @[Pong.scala 110:17 36:30]
  wire [3:0] _GEN_86 = 4'h6 == state ? 4'h0 : hitCnt; // @[Pong.scala 110:17 165:14 84:23]
  wire [3:0] _GEN_87 = 4'h6 == state ? _p2pointsPersist_T_1 : p2pointsPersist; // @[Pong.scala 110:17 166:23 34:32]
  wire [3:0] _GEN_88 = 4'h6 == state ? _p2pointsTable_T_1 : _GEN_85; // @[Pong.scala 110:17 167:21]
  wire [3:0] _GEN_89 = 4'h6 == state ? _GEN_42 : _GEN_80; // @[Pong.scala 110:17]
  wire [2:0] _GEN_90 = 4'h6 == state ? bullet : _GEN_81; // @[Pong.scala 110:17 99:24]
  wire  _GEN_91 = 4'h6 == state ? 1'h0 : _GEN_82; // @[Pong.scala 110:17 63:17]
  wire [3:0] _GEN_92 = 4'h6 == state ? p1pointsTable : _GEN_83; // @[Pong.scala 110:17 35:30]
  wire [27:0] _GEN_93 = 4'h6 == state ? buffer : _GEN_84; // @[Pong.scala 110:17 79:23]
  wire [3:0] _GEN_94 = 4'h5 == state ? 4'h0 : _GEN_86; // @[Pong.scala 110:17 157:14]
  wire [3:0] _GEN_95 = 4'h5 == state ? _p1pointsPersist_T_1 : p1pointsPersist; // @[Pong.scala 110:17 158:23 33:32]
  wire [3:0] _GEN_96 = 4'h5 == state ? _p1pointsTable_T_1 : _GEN_92; // @[Pong.scala 110:17 159:21]
  wire [3:0] _GEN_97 = 4'h5 == state ? _GEN_41 : _GEN_89; // @[Pong.scala 110:17]
  wire [3:0] _GEN_98 = 4'h5 == state ? p2pointsPersist : _GEN_87; // @[Pong.scala 110:17 34:32]
  wire [3:0] _GEN_99 = 4'h5 == state ? p2pointsTable : _GEN_88; // @[Pong.scala 110:17 36:30]
  wire [2:0] _GEN_100 = 4'h5 == state ? bullet : _GEN_90; // @[Pong.scala 110:17 99:24]
  wire  _GEN_101 = 4'h5 == state ? 1'h0 : _GEN_91; // @[Pong.scala 110:17 63:17]
  wire [27:0] _GEN_102 = 4'h5 == state ? buffer : _GEN_93; // @[Pong.scala 110:17 79:23]
  wire [3:0] _GEN_106 = 4'h2 == state ? _GEN_40 : _GEN_97; // @[Pong.scala 110:17]
  wire  _GEN_111 = 4'h2 == state ? 1'h0 : _GEN_101; // @[Pong.scala 110:17 63:17]
  wire [27:0] _GEN_112 = 4'h2 == state ? buffer : _GEN_102; // @[Pong.scala 110:17 79:23]
  wire [3:0] _GEN_116 = 4'h1 == state ? _GEN_34 : _GEN_106; // @[Pong.scala 110:17]
  wire  _GEN_121 = 4'h1 == state ? 1'h0 : _GEN_111; // @[Pong.scala 110:17 63:17]
  wire [27:0] _GEN_122 = 4'h1 == state ? buffer : _GEN_112; // @[Pong.scala 110:17 79:23]
  wire [27:0] _GEN_123 = 4'h0 == state ? 28'h0 : _GEN_122; // @[Pong.scala 110:17 112:14]
  wire  _GEN_125 = 4'h0 == state ? 1'h0 : p1pos; // @[Pong.scala 110:17 114:15 100:24]
  wire  _GEN_126 = 4'h0 == state | p2pos; // @[Pong.scala 110:17 115:15 101:24]
  wire [3:0] _GEN_135 = 4'h0 == state ? _GEN_28 : _GEN_116; // @[Pong.scala 110:17]
  wire  _p1pos_T = ~p1pos; // @[Pong.scala 206:32]
  wire  _p2pos_T = ~p2pos; // @[Pong.scala 207:32]
  wire [16:0] _T_49 = 17'h186a0 / 3'h4; // @[Pong.scala 210:32]
  wire [31:0] _GEN_169 = {{15'd0}, _T_49}; // @[Pong.scala 210:17]
  wire  _T_52 = 3'h0 == bullet; // @[Pong.scala 212:24]
  wire  _T_53 = 3'h1 == bullet; // @[Pong.scala 212:24]
  wire  _T_54 = 3'h2 == bullet; // @[Pong.scala 212:24]
  wire  _T_55 = 3'h3 == bullet; // @[Pong.scala 212:24]
  wire  _T_56 = 3'h4 == bullet; // @[Pong.scala 212:24]
  wire  _T_57 = 3'h5 == bullet; // @[Pong.scala 212:24]
  wire  _T_58 = 3'h6 == bullet; // @[Pong.scala 212:24]
  wire  _T_59 = 3'h7 == bullet; // @[Pong.scala 212:24]
  wire [27:0] _GEN_139 = 3'h7 == bullet ? 28'h8 : _GEN_123; // @[Pong.scala 212:24 220:28]
  wire [27:0] _GEN_140 = 3'h6 == bullet ? 28'h8 : _GEN_139; // @[Pong.scala 212:24 219:28]
  wire [34:0] _GEN_141 = 3'h5 == bullet ? 35'h400 : {{7'd0}, _GEN_140}; // @[Pong.scala 212:24 218:28]
  wire [34:0] _GEN_142 = 3'h4 == bullet ? 35'h400 : _GEN_141; // @[Pong.scala 212:24 217:28]
  wire [41:0] _GEN_143 = 3'h3 == bullet ? 42'h20000 : {{7'd0}, _GEN_142}; // @[Pong.scala 212:24 216:28]
  wire [41:0] _GEN_144 = 3'h2 == bullet ? 42'h20000 : _GEN_143; // @[Pong.scala 212:24 215:28]
  wire [48:0] _GEN_145 = 3'h1 == bullet ? 49'h1000000 : {{7'd0}, _GEN_144}; // @[Pong.scala 212:24 214:28]
  wire [48:0] _GEN_146 = 3'h0 == bullet ? 49'h1000000 : _GEN_145; // @[Pong.scala 212:24 213:28]
  wire [48:0] _GEN_147 = ~bulletY ? _GEN_146 : {{21'd0}, _GEN_123}; // @[Pong.scala 211:29]
  wire [48:0] _GEN_148 = _T_59 ? 49'h1 : _GEN_147; // @[Pong.scala 224:24 232:28]
  wire [48:0] _GEN_149 = _T_58 ? 49'h1 : _GEN_148; // @[Pong.scala 224:24 231:28]
  wire [48:0] _GEN_150 = _T_57 ? 49'h80 : _GEN_149; // @[Pong.scala 224:24 230:28]
  wire [48:0] _GEN_151 = _T_56 ? 49'h80 : _GEN_150; // @[Pong.scala 224:24 229:28]
  wire [48:0] _GEN_152 = _T_55 ? 49'h4000 : _GEN_151; // @[Pong.scala 224:24 228:28]
  wire [48:0] _GEN_153 = _T_54 ? 49'h4000 : _GEN_152; // @[Pong.scala 224:24 227:28]
  wire [48:0] _GEN_154 = _T_53 ? 49'h200000 : _GEN_153; // @[Pong.scala 224:24 226:28]
  wire [48:0] _GEN_155 = _T_52 ? 49'h200000 : _GEN_154; // @[Pong.scala 224:24 225:28]
  wire [48:0] _GEN_156 = bulletY ? _GEN_155 : _GEN_147; // @[Pong.scala 223:29]
  wire [48:0] _GEN_157 = bufCnt == _GEN_169 ? _GEN_156 : {{21'd0}, _GEN_123}; // @[Pong.scala 210:39]
  wire [18:0] _T_70 = _T_49 * 2'h2; // @[Pong.scala 236:40]
  wire [31:0] _GEN_170 = {{13'd0}, _T_70}; // @[Pong.scala 236:17]
  wire [27:0] _buffer_T_26 = buffer | 28'h2000000; // @[Pong.scala 238:36]
  wire [27:0] _buffer_T_29 = buffer | 28'h4000000; // @[Pong.scala 239:36]
  wire [48:0] _GEN_158 = p1pos ? {{21'd0}, _buffer_T_29} : _GEN_157; // @[Pong.scala 237:21 239:26]
  wire [48:0] _GEN_159 = _p1pos_T ? {{21'd0}, _buffer_T_26} : _GEN_158; // @[Pong.scala 237:21 238:26]
  wire [48:0] _GEN_160 = bufCnt == _GEN_170 ? _GEN_159 : _GEN_157; // @[Pong.scala 236:47]
  wire [18:0] _T_75 = _T_49 * 2'h3; // @[Pong.scala 242:40]
  wire [31:0] _GEN_171 = {{13'd0}, _T_75}; // @[Pong.scala 242:17]
  wire [27:0] _buffer_T_31 = buffer | 28'h4; // @[Pong.scala 244:36]
  wire [27:0] _buffer_T_33 = buffer | 28'h2; // @[Pong.scala 245:36]
  wire [48:0] _GEN_161 = p2pos ? {{21'd0}, _buffer_T_33} : _GEN_160; // @[Pong.scala 243:21 245:26]
  wire [48:0] _GEN_162 = _p2pos_T ? {{21'd0}, _buffer_T_31} : _GEN_161; // @[Pong.scala 243:21 244:26]
  wire [48:0] _GEN_163 = bufCnt == _GEN_171 ? _GEN_162 : _GEN_160; // @[Pong.scala 242:47]
  wire [48:0] _GEN_167 = state != 4'h0 ? _GEN_163 : {{21'd0}, _GEN_123}; // @[Pong.scala 202:24]
  wire [48:0] _GEN_172 = reset ? 49'h0 : _GEN_167; // @[Pong.scala 79:{23,23}]
  RNG RNG ( // @[Pong.scala 61:19]
    .clock(RNG_clock),
    .reset(RNG_reset),
    .io_random(RNG_io_random)
  );
  Win win ( // @[Pong.scala 62:19]
    .clock(win_clock),
    .reset(win_reset),
    .io_enable(win_io_enable),
    .io_visualPoints(win_io_visualPoints),
    .io_visualBuffer(win_io_visualBuffer)
  );
  SpeedupTable speedupTable ( // @[Pong.scala 92:28]
    .io_idx(speedupTable_io_idx),
    .io_out(speedupTable_io_out)
  );
  assign io_p1points = 4'h0 == p1pointsTable ? 7'h0 : _GEN_7; // @[Pong.scala 37:25 38:27]
  assign io_p2points = 4'h0 == p2pointsTable ? 7'h0 : _GEN_16; // @[Pong.scala 48:25 49:27]
  assign io_renderMode = 4'h0 == state ? blk : 1'h1; // @[Pong.scala 110:17 113:21 77:17]
  assign io_renderOut = buffer; // @[Pong.scala 250:16]
  assign RNG_clock = clock;
  assign RNG_reset = reset;
  assign win_clock = clock;
  assign win_reset = reset;
  assign win_io_enable = 4'h0 == state ? 1'h0 : _GEN_121; // @[Pong.scala 110:17 120:21]
  assign speedupTable_io_idx = hitCnt; // @[Pong.scala 93:23]
  always @(posedge clock) begin
    if (reset) begin // @[Pong.scala 33:32]
      p1pointsPersist <= 4'h0; // @[Pong.scala 33:32]
    end else if (4'h0 == state) begin // @[Pong.scala 110:17]
      p1pointsPersist <= 4'h0; // @[Pong.scala 118:23]
    end else if (!(4'h1 == state)) begin // @[Pong.scala 110:17]
      if (!(4'h2 == state)) begin // @[Pong.scala 110:17]
        p1pointsPersist <= _GEN_95;
      end
    end
    if (reset) begin // @[Pong.scala 34:32]
      p2pointsPersist <= 4'h0; // @[Pong.scala 34:32]
    end else if (4'h0 == state) begin // @[Pong.scala 110:17]
      p2pointsPersist <= 4'h0; // @[Pong.scala 119:23]
    end else if (!(4'h1 == state)) begin // @[Pong.scala 110:17]
      if (!(4'h2 == state)) begin // @[Pong.scala 110:17]
        p2pointsPersist <= _GEN_98;
      end
    end
    if (reset) begin // @[Pong.scala 35:30]
      p1pointsTable <= 4'h0; // @[Pong.scala 35:30]
    end else if (4'h0 == state) begin // @[Pong.scala 110:17]
      p1pointsTable <= 4'h0; // @[Pong.scala 116:21]
    end else if (!(4'h1 == state)) begin // @[Pong.scala 110:17]
      if (!(4'h2 == state)) begin // @[Pong.scala 110:17]
        p1pointsTable <= _GEN_96;
      end
    end
    if (reset) begin // @[Pong.scala 36:30]
      p2pointsTable <= 4'h0; // @[Pong.scala 36:30]
    end else if (4'h0 == state) begin // @[Pong.scala 110:17]
      p2pointsTable <= 4'h0; // @[Pong.scala 117:21]
    end else if (!(4'h1 == state)) begin // @[Pong.scala 110:17]
      if (!(4'h2 == state)) begin // @[Pong.scala 110:17]
        p2pointsTable <= _GEN_99;
      end
    end
    if (reset) begin // @[Pong.scala 65:20]
      blk <= 1'h0; // @[Pong.scala 65:20]
    end else begin
      blk <= _GEN_20;
    end
    if (reset) begin // @[Pong.scala 67:23]
      blkCnt <= 32'h0; // @[Pong.scala 67:23]
    end else if (blkCnt == 32'h17d7840) begin // @[Pong.scala 69:31]
      blkCnt <= 32'h0; // @[Pong.scala 70:12]
    end else begin
      blkCnt <= _blkCnt_T_1; // @[Pong.scala 68:10]
    end
    buffer <= _GEN_172[27:0]; // @[Pong.scala 79:{23,23}]
    if (reset) begin // @[Pong.scala 80:23]
      bufCnt <= 32'h0; // @[Pong.scala 80:23]
    end else if (bufCnt == 32'h186a0) begin // @[Pong.scala 82:31]
      bufCnt <= 32'h0; // @[Pong.scala 82:40]
    end else begin
      bufCnt <= _bufCnt_T_1; // @[Pong.scala 81:10]
    end
    if (reset) begin // @[Pong.scala 84:23]
      hitCnt <= 4'h0; // @[Pong.scala 84:23]
    end else if (4'h0 == state) begin // @[Pong.scala 110:17]
      hitCnt <= 4'h0; // @[Pong.scala 121:14]
    end else if (4'h1 == state) begin // @[Pong.scala 110:17]
      if (p1pos == bulletY) begin // @[Pong.scala 135:31]
        hitCnt <= _GEN_29;
      end
    end else if (4'h2 == state) begin // @[Pong.scala 110:17]
      hitCnt <= _GEN_37;
    end else begin
      hitCnt <= _GEN_94;
    end
    if (reset) begin // @[Pong.scala 85:26]
      bulletCnt <= 32'h0; // @[Pong.scala 85:26]
    end else if (bulletCnt == _GEN_168) begin // @[Pong.scala 94:75]
      bulletCnt <= 32'h0; // @[Pong.scala 95:15]
    end else begin
      bulletCnt <= _bulletCnt_T_1; // @[Pong.scala 86:13]
    end
    if (reset) begin // @[Pong.scala 98:24]
      bulletY <= 1'h0; // @[Pong.scala 98:24]
    end else if (4'h0 == state) begin // @[Pong.scala 110:17]
      bulletY <= _GEN_27;
    end else if (4'h1 == state) begin // @[Pong.scala 110:17]
      if (p1pos == bulletY) begin // @[Pong.scala 135:31]
        bulletY <= rnd; // @[Pong.scala 139:17]
      end
    end else if (4'h2 == state) begin // @[Pong.scala 110:17]
      bulletY <= _GEN_39;
    end
    if (reset) begin // @[Pong.scala 99:24]
      bullet <= 3'h0; // @[Pong.scala 99:24]
    end else if (4'h0 == state) begin // @[Pong.scala 110:17]
      if (io_p1) begin // @[Pong.scala 123:18]
        bullet <= 3'h0; // @[Pong.scala 124:17]
      end else if (io_p2) begin // @[Pong.scala 128:24]
        bullet <= 3'h7; // @[Pong.scala 129:17]
      end
    end else if (4'h1 == state) begin // @[Pong.scala 110:17]
      if (p1pos == bulletY) begin // @[Pong.scala 135:31]
        bullet <= _GEN_30;
      end
    end else if (4'h2 == state) begin // @[Pong.scala 110:17]
      bullet <= _GEN_38;
    end else begin
      bullet <= _GEN_100;
    end
    if (reset) begin // @[Pong.scala 100:24]
      p1pos <= 1'h0; // @[Pong.scala 100:24]
    end else if (state != 4'h0) begin // @[Pong.scala 202:24]
      if (p1Trigger) begin // @[Pong.scala 206:21]
        p1pos <= ~p1pos; // @[Pong.scala 206:29]
      end else begin
        p1pos <= _GEN_125;
      end
    end else begin
      p1pos <= _GEN_125;
    end
    if (reset) begin // @[Pong.scala 101:24]
      p2pos <= 1'h0; // @[Pong.scala 101:24]
    end else if (state != 4'h0) begin // @[Pong.scala 202:24]
      if (p2Trigger) begin // @[Pong.scala 207:21]
        p2pos <= ~p2pos; // @[Pong.scala 207:29]
      end else begin
        p2pos <= _GEN_126;
      end
    end else begin
      p2pos <= _GEN_126;
    end
    p1Trigger_REG <= io_p1; // @[Pong.scala 103:36]
    p2Trigger_REG <= io_p2; // @[Pong.scala 104:36]
    if (reset) begin // @[Pong.scala 107:22]
      state <= 4'h0; // @[Pong.scala 107:22]
    end else if (state != 4'h0) begin // @[Pong.scala 202:24]
      if (io_restart) begin // @[Pong.scala 203:22]
        state <= 4'h0; // @[Pong.scala 203:30]
      end else begin
        state <= _GEN_135;
      end
    end else begin
      state <= _GEN_135;
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
  p1pointsPersist = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  p2pointsPersist = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  p1pointsTable = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  p2pointsTable = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  blk = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  blkCnt = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  buffer = _RAND_6[27:0];
  _RAND_7 = {1{`RANDOM}};
  bufCnt = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  hitCnt = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  bulletCnt = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  bulletY = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  bullet = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  p1pos = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  p2pos = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  p1Trigger_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  p2Trigger_REG = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  state = _RAND_16[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VendingMachine(
  input        clock,
  input        reset,
  input        io_pongMode,
  input  [4:0] io_price,
  input        io_coin2,
  input        io_coin5,
  input        io_buy,
  input        io_p1,
  input        io_p2,
  output       io_releaseCan,
  output       io_alarm,
  output [6:0] io_seg,
  output [3:0] io_an,
  output       io_p2LED1,
  output       io_p2LED2,
  output       io_p2LED3,
  output       io_p2LED4,
  output       io_p2LED5,
  output       io_p2LED6,
  output       io_p2LED7,
  output       io_p1LED1,
  output       io_p1LED2,
  output       io_p1LED3,
  output       io_p1LED4,
  output       io_p1LED5,
  output       io_p1LED6,
  output       io_p1LED7
);
  wire  IoSync_clock; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_buy; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_coin2; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_coin5; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_p1; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_p2; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_s_buy; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_s_coin2; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_s_coin5; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_s_p1; // @[VendingMachine.scala 42:22]
  wire  IoSync_io_s_p2; // @[VendingMachine.scala 42:22]
  wire  FSM_clock; // @[VendingMachine.scala 49:19]
  wire  FSM_reset; // @[VendingMachine.scala 49:19]
  wire  FSM_io_buyCheck; // @[VendingMachine.scala 49:19]
  wire  FSM_io_buy; // @[VendingMachine.scala 49:19]
  wire  FSM_io_coin2; // @[VendingMachine.scala 49:19]
  wire  FSM_io_coin5; // @[VendingMachine.scala 49:19]
  wire  FSM_io_add2; // @[VendingMachine.scala 49:19]
  wire  FSM_io_add5; // @[VendingMachine.scala 49:19]
  wire  FSM_io_subPrice; // @[VendingMachine.scala 49:19]
  wire  FSM_io_releaseCan; // @[VendingMachine.scala 49:19]
  wire  FSM_io_alarm; // @[VendingMachine.scala 49:19]
  wire  DP_clock; // @[VendingMachine.scala 56:18]
  wire  DP_reset; // @[VendingMachine.scala 56:18]
  wire [7:0] DP_io_price; // @[VendingMachine.scala 56:18]
  wire  DP_io_add2; // @[VendingMachine.scala 56:18]
  wire  DP_io_add5; // @[VendingMachine.scala 56:18]
  wire  DP_io_subPrice; // @[VendingMachine.scala 56:18]
  wire  DP_io_buyCheck; // @[VendingMachine.scala 56:18]
  wire [7:0] DP_io_sum; // @[VendingMachine.scala 56:18]
  wire  display_clock; // @[VendingMachine.scala 65:23]
  wire  display_reset; // @[VendingMachine.scala 65:23]
  wire  display_io_rawEnable; // @[VendingMachine.scala 65:23]
  wire [27:0] display_io_raw; // @[VendingMachine.scala 65:23]
  wire [9:0] display_io_sum; // @[VendingMachine.scala 65:23]
  wire [9:0] display_io_price; // @[VendingMachine.scala 65:23]
  wire [6:0] display_io_seg; // @[VendingMachine.scala 65:23]
  wire [3:0] display_io_an; // @[VendingMachine.scala 65:23]
  wire [7:0] seperator1_io_in; // @[VendingMachine.scala 66:26]
  wire [7:0] seperator1_io_out; // @[VendingMachine.scala 66:26]
  wire [7:0] seperator2_io_in; // @[VendingMachine.scala 67:26]
  wire [7:0] seperator2_io_out; // @[VendingMachine.scala 67:26]
  wire  pong_clock; // @[VendingMachine.scala 71:20]
  wire  pong_reset; // @[VendingMachine.scala 71:20]
  wire  pong_io_p1; // @[VendingMachine.scala 71:20]
  wire  pong_io_p2; // @[VendingMachine.scala 71:20]
  wire  pong_io_restart; // @[VendingMachine.scala 71:20]
  wire [6:0] pong_io_p1points; // @[VendingMachine.scala 71:20]
  wire [6:0] pong_io_p2points; // @[VendingMachine.scala 71:20]
  wire  pong_io_renderMode; // @[VendingMachine.scala 71:20]
  wire [27:0] pong_io_renderOut; // @[VendingMachine.scala 71:20]
  IoSync IoSync ( // @[VendingMachine.scala 42:22]
    .clock(IoSync_clock),
    .io_buy(IoSync_io_buy),
    .io_coin2(IoSync_io_coin2),
    .io_coin5(IoSync_io_coin5),
    .io_p1(IoSync_io_p1),
    .io_p2(IoSync_io_p2),
    .io_s_buy(IoSync_io_s_buy),
    .io_s_coin2(IoSync_io_s_coin2),
    .io_s_coin5(IoSync_io_s_coin5),
    .io_s_p1(IoSync_io_s_p1),
    .io_s_p2(IoSync_io_s_p2)
  );
  FSM FSM ( // @[VendingMachine.scala 49:19]
    .clock(FSM_clock),
    .reset(FSM_reset),
    .io_buyCheck(FSM_io_buyCheck),
    .io_buy(FSM_io_buy),
    .io_coin2(FSM_io_coin2),
    .io_coin5(FSM_io_coin5),
    .io_add2(FSM_io_add2),
    .io_add5(FSM_io_add5),
    .io_subPrice(FSM_io_subPrice),
    .io_releaseCan(FSM_io_releaseCan),
    .io_alarm(FSM_io_alarm)
  );
  Datapath DP ( // @[VendingMachine.scala 56:18]
    .clock(DP_clock),
    .reset(DP_reset),
    .io_price(DP_io_price),
    .io_add2(DP_io_add2),
    .io_add5(DP_io_add5),
    .io_subPrice(DP_io_subPrice),
    .io_buyCheck(DP_io_buyCheck),
    .io_sum(DP_io_sum)
  );
  DisplayMultiplexer5bit display ( // @[VendingMachine.scala 65:23]
    .clock(display_clock),
    .reset(display_reset),
    .io_rawEnable(display_io_rawEnable),
    .io_raw(display_io_raw),
    .io_sum(display_io_sum),
    .io_price(display_io_price),
    .io_seg(display_io_seg),
    .io_an(display_io_an)
  );
  DecimalSeperator seperator1 ( // @[VendingMachine.scala 66:26]
    .io_in(seperator1_io_in),
    .io_out(seperator1_io_out)
  );
  DecimalSeperator seperator2 ( // @[VendingMachine.scala 67:26]
    .io_in(seperator2_io_in),
    .io_out(seperator2_io_out)
  );
  Pong pong ( // @[VendingMachine.scala 71:20]
    .clock(pong_clock),
    .reset(pong_reset),
    .io_p1(pong_io_p1),
    .io_p2(pong_io_p2),
    .io_restart(pong_io_restart),
    .io_p1points(pong_io_p1points),
    .io_p2points(pong_io_p2points),
    .io_renderMode(pong_io_renderMode),
    .io_renderOut(pong_io_renderOut)
  );
  assign io_releaseCan = FSM_io_releaseCan; // @[VendingMachine.scala 53:17]
  assign io_alarm = FSM_io_alarm; // @[VendingMachine.scala 54:12]
  assign io_seg = display_io_seg; // @[VendingMachine.scala 103:10]
  assign io_an = display_io_an; // @[VendingMachine.scala 104:9]
  assign io_p2LED1 = pong_io_p2points[6]; // @[VendingMachine.scala 87:32]
  assign io_p2LED2 = pong_io_p2points[5]; // @[VendingMachine.scala 88:32]
  assign io_p2LED3 = pong_io_p2points[4]; // @[VendingMachine.scala 89:32]
  assign io_p2LED4 = pong_io_p2points[3]; // @[VendingMachine.scala 90:32]
  assign io_p2LED5 = pong_io_p2points[2]; // @[VendingMachine.scala 91:32]
  assign io_p2LED6 = pong_io_p2points[1]; // @[VendingMachine.scala 92:32]
  assign io_p2LED7 = pong_io_p2points[0]; // @[VendingMachine.scala 93:32]
  assign io_p1LED1 = pong_io_p1points[6]; // @[VendingMachine.scala 94:32]
  assign io_p1LED2 = pong_io_p1points[5]; // @[VendingMachine.scala 95:32]
  assign io_p1LED3 = pong_io_p1points[4]; // @[VendingMachine.scala 96:32]
  assign io_p1LED4 = pong_io_p1points[3]; // @[VendingMachine.scala 97:32]
  assign io_p1LED5 = pong_io_p1points[2]; // @[VendingMachine.scala 98:32]
  assign io_p1LED6 = pong_io_p1points[1]; // @[VendingMachine.scala 99:32]
  assign io_p1LED7 = pong_io_p1points[0]; // @[VendingMachine.scala 100:32]
  assign IoSync_clock = clock;
  assign IoSync_io_buy = io_buy; // @[VendingMachine.scala 43:17]
  assign IoSync_io_coin2 = io_coin2; // @[VendingMachine.scala 44:19]
  assign IoSync_io_coin5 = io_coin5; // @[VendingMachine.scala 45:19]
  assign IoSync_io_p1 = io_p1; // @[VendingMachine.scala 46:16]
  assign IoSync_io_p2 = io_p2; // @[VendingMachine.scala 47:16]
  assign FSM_clock = clock;
  assign FSM_reset = reset;
  assign FSM_io_buyCheck = DP_io_buyCheck; // @[VendingMachine.scala 63:19]
  assign FSM_io_buy = IoSync_io_s_buy; // @[VendingMachine.scala 50:14]
  assign FSM_io_coin2 = IoSync_io_s_coin2; // @[VendingMachine.scala 51:16]
  assign FSM_io_coin5 = IoSync_io_s_coin5; // @[VendingMachine.scala 52:16]
  assign DP_clock = clock;
  assign DP_reset = reset;
  assign DP_io_price = {{3'd0}, io_price}; // @[VendingMachine.scala 57:15]
  assign DP_io_add2 = FSM_io_add2; // @[VendingMachine.scala 58:14]
  assign DP_io_add5 = FSM_io_add5; // @[VendingMachine.scala 59:14]
  assign DP_io_subPrice = FSM_io_subPrice; // @[VendingMachine.scala 61:18]
  assign display_clock = clock;
  assign display_reset = reset;
  assign display_io_rawEnable = io_pongMode & pong_io_renderMode; // @[VendingMachine.scala 75:39]
  assign display_io_raw = pong_io_renderOut; // @[VendingMachine.scala 76:18]
  assign display_io_sum = io_pongMode ? 10'h320 : {{2'd0}, seperator1_io_out}; // @[VendingMachine.scala 78:21 79:22 82:22]
  assign display_io_price = io_pongMode ? 10'h313 : {{2'd0}, seperator2_io_out}; // @[VendingMachine.scala 78:21 80:22 83:22]
  assign seperator1_io_in = DP_io_sum; // @[VendingMachine.scala 68:20]
  assign seperator2_io_in = {{3'd0}, io_price}; // @[VendingMachine.scala 69:20]
  assign pong_clock = clock;
  assign pong_reset = reset;
  assign pong_io_p1 = IoSync_io_s_p1; // @[VendingMachine.scala 72:14]
  assign pong_io_p2 = IoSync_io_s_p2; // @[VendingMachine.scala 73:14]
  assign pong_io_restart = ~io_pongMode; // @[VendingMachine.scala 74:22]
endmodule
