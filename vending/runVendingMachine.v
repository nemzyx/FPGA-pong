module IoSync(
  input   clock,
  input   io_buy,
  input   io_coin2,
  input   io_coin5,
  output  io_s_buy,
  output  io_s_coin2,
  output  io_s_coin5
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  io_s_buy_REG; // @[IoSync.scala 22:30]
  reg  io_s_buy_REG_1; // @[IoSync.scala 22:22]
  reg  io_s_coin2_REG; // @[IoSync.scala 23:32]
  reg  io_s_coin2_REG_1; // @[IoSync.scala 23:24]
  reg  io_s_coin5_REG; // @[IoSync.scala 24:32]
  reg  io_s_coin5_REG_1; // @[IoSync.scala 24:24]
  assign io_s_buy = io_s_buy_REG_1; // @[IoSync.scala 22:12]
  assign io_s_coin2 = io_s_coin2_REG_1; // @[IoSync.scala 23:14]
  assign io_s_coin5 = io_s_coin5_REG_1; // @[IoSync.scala 24:14]
  always @(posedge clock) begin
    io_s_buy_REG <= io_buy; // @[IoSync.scala 22:30]
    io_s_buy_REG_1 <= io_s_buy_REG; // @[IoSync.scala 22:22]
    io_s_coin2_REG <= io_coin2; // @[IoSync.scala 23:32]
    io_s_coin2_REG_1 <= io_s_coin2_REG; // @[IoSync.scala 23:24]
    io_s_coin5_REG <= io_coin5; // @[IoSync.scala 24:32]
    io_s_coin5_REG_1 <= io_s_coin5_REG; // @[IoSync.scala 24:24]
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
  input   io_buyCheck,
  input   io_buy,
  input   io_coin2,
  input   io_coin5,
  output  io_add2,
  output  io_add5,
  output  io_releaseCan,
  output  io_subPrice,
  output  io_alarm
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  anyBtn = io_buy | io_coin2 | io_coin5; // @[FSM.scala 26:35]
  reg  ready_REG; // @[FSM.scala 28:30]
  wire  ready = anyBtn & ~ready_REG; // @[FSM.scala 28:19]
  wire  _T = io_buy & io_buyCheck; // @[FSM.scala 38:17]
  wire  _T_2 = io_buy & ~io_buyCheck; // @[FSM.scala 42:24]
  wire  _GEN_4 = io_buy & io_buyCheck ? 1'h0 : _T_2; // @[FSM.scala 38:33 39:16]
  assign io_add2 = ready & io_coin2; // @[FSM.scala 22:11 30:15]
  assign io_add5 = ready & io_coin5; // @[FSM.scala 23:11 30:15]
  assign io_releaseCan = ready & _T; // @[FSM.scala 30:15 20:17]
  assign io_subPrice = ready & _T; // @[FSM.scala 30:15 20:17]
  assign io_alarm = ready & _GEN_4; // @[FSM.scala 19:12 30:15]
  always @(posedge clock) begin
    ready_REG <= io_buy | io_coin2 | io_coin5; // @[FSM.scala 26:35]
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
  ready_REG = _RAND_0[0:0];
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
  assign io_sum = sumReg; // @[Datapath.scala 39:10]
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
module DisplayMultiplexer(
  input        clock,
  input        reset,
  input  [7:0] io_sum,
  input  [7:0] io_price,
  output [6:0] io_seg,
  output [3:0] io_an
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] decoder_io_in; // @[DisplayMultiplexer.scala 24:23]
  wire [6:0] decoder_io_out; // @[DisplayMultiplexer.scala 24:23]
  reg [31:0] tcReg; // @[DisplayMultiplexer.scala 12:22]
  reg [1:0] anReg; // @[DisplayMultiplexer.scala 13:22]
  wire [31:0] _tcReg_T_1 = tcReg + 32'h1; // @[DisplayMultiplexer.scala 16:20]
  wire [1:0] _anReg_T_1 = anReg + 2'h1; // @[DisplayMultiplexer.scala 19:20]
  wire [3:0] _GEN_3 = 2'h3 == anReg ? io_price[3:0] : 4'h0; // @[DisplayMultiplexer.scala 25:17 28:17 43:21]
  wire [3:0] _GEN_4 = 2'h2 == anReg ? 4'h2 : 4'h1; // @[DisplayMultiplexer.scala 28:17 38:14]
  wire [3:0] _GEN_5 = 2'h2 == anReg ? io_price[7:4] : _GEN_3; // @[DisplayMultiplexer.scala 28:17 39:21]
  wire [3:0] _GEN_6 = 2'h1 == anReg ? 4'h4 : _GEN_4; // @[DisplayMultiplexer.scala 28:17 34:14]
  wire [3:0] _GEN_7 = 2'h1 == anReg ? io_sum[3:0] : _GEN_5; // @[DisplayMultiplexer.scala 28:17 35:21]
  wire [3:0] select = 2'h0 == anReg ? 4'h8 : _GEN_6; // @[DisplayMultiplexer.scala 28:17 30:14]
  wire [3:0] _GEN_9 = 2'h0 == anReg ? io_sum[7:4] : _GEN_7; // @[DisplayMultiplexer.scala 28:17 31:21]
  wire [6:0] sevSeg = decoder_io_out;
  SevenSegDec decoder ( // @[DisplayMultiplexer.scala 24:23]
    .io_in(decoder_io_in),
    .io_out(decoder_io_out)
  );
  assign io_seg = ~sevSeg; // @[DisplayMultiplexer.scala 47:13]
  assign io_an = ~select; // @[DisplayMultiplexer.scala 48:12]
  assign decoder_io_in = {{1'd0}, _GEN_9};
  always @(posedge clock) begin
    if (reset) begin // @[DisplayMultiplexer.scala 12:22]
      tcReg <= 32'h0; // @[DisplayMultiplexer.scala 12:22]
    end else if (tcReg < 32'h186a0) begin // @[DisplayMultiplexer.scala 15:29]
      tcReg <= _tcReg_T_1; // @[DisplayMultiplexer.scala 16:11]
    end else begin
      tcReg <= 32'h0; // @[DisplayMultiplexer.scala 18:11]
    end
    if (reset) begin // @[DisplayMultiplexer.scala 13:22]
      anReg <= 2'h0; // @[DisplayMultiplexer.scala 13:22]
    end else if (!(tcReg < 32'h186a0)) begin // @[DisplayMultiplexer.scala 15:29]
      anReg <= _anReg_T_1; // @[DisplayMultiplexer.scala 19:11]
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
module runVendingMachine(
  input        clock,
  input        reset,
  input  [4:0] io_price,
  input        io_coin2,
  input        io_coin5,
  input        io_buy,
  output       io_releaseCan,
  output       io_alarm,
  output [6:0] io_seg,
  output [3:0] io_an
);
  wire  IoSync_clock; // @[VendingMachine.scala 23:22]
  wire  IoSync_io_buy; // @[VendingMachine.scala 23:22]
  wire  IoSync_io_coin2; // @[VendingMachine.scala 23:22]
  wire  IoSync_io_coin5; // @[VendingMachine.scala 23:22]
  wire  IoSync_io_s_buy; // @[VendingMachine.scala 23:22]
  wire  IoSync_io_s_coin2; // @[VendingMachine.scala 23:22]
  wire  IoSync_io_s_coin5; // @[VendingMachine.scala 23:22]
  wire  FSM_clock; // @[VendingMachine.scala 28:19]
  wire  FSM_io_buyCheck; // @[VendingMachine.scala 28:19]
  wire  FSM_io_buy; // @[VendingMachine.scala 28:19]
  wire  FSM_io_coin2; // @[VendingMachine.scala 28:19]
  wire  FSM_io_coin5; // @[VendingMachine.scala 28:19]
  wire  FSM_io_add2; // @[VendingMachine.scala 28:19]
  wire  FSM_io_add5; // @[VendingMachine.scala 28:19]
  wire  FSM_io_releaseCan; // @[VendingMachine.scala 28:19]
  wire  FSM_io_subPrice; // @[VendingMachine.scala 28:19]
  wire  FSM_io_alarm; // @[VendingMachine.scala 28:19]
  wire  DP_clock; // @[VendingMachine.scala 36:18]
  wire  DP_reset; // @[VendingMachine.scala 36:18]
  wire [7:0] DP_io_price; // @[VendingMachine.scala 36:18]
  wire  DP_io_add2; // @[VendingMachine.scala 36:18]
  wire  DP_io_add5; // @[VendingMachine.scala 36:18]
  wire  DP_io_subPrice; // @[VendingMachine.scala 36:18]
  wire  DP_io_buyCheck; // @[VendingMachine.scala 36:18]
  wire [7:0] DP_io_sum; // @[VendingMachine.scala 36:18]
  wire  display_clock; // @[VendingMachine.scala 45:23]
  wire  display_reset; // @[VendingMachine.scala 45:23]
  wire [7:0] display_io_sum; // @[VendingMachine.scala 45:23]
  wire [7:0] display_io_price; // @[VendingMachine.scala 45:23]
  wire [6:0] display_io_seg; // @[VendingMachine.scala 45:23]
  wire [3:0] display_io_an; // @[VendingMachine.scala 45:23]
  wire [7:0] _display_io_sum_T = DP_io_sum / 8'ha; // @[VendingMachine.scala 46:34]
  wire [11:0] _display_io_sum_T_1 = {_display_io_sum_T, 4'h0}; // @[VendingMachine.scala 46:47]
  wire [7:0] _GEN_3 = DP_io_sum % 8'ha; // @[VendingMachine.scala 46:66]
  wire [7:0] _display_io_sum_T_2 = _GEN_3[7:0]; // @[VendingMachine.scala 46:66]
  wire [11:0] _GEN_0 = {{4'd0}, _display_io_sum_T_2}; // @[VendingMachine.scala 46:53]
  wire [11:0] _display_io_sum_T_3 = _display_io_sum_T_1 | _GEN_0; // @[VendingMachine.scala 46:53]
  wire [4:0] _display_io_price_T = io_price / 8'ha; // @[VendingMachine.scala 47:34]
  wire [8:0] _display_io_price_T_1 = {_display_io_price_T, 4'h0}; // @[VendingMachine.scala 47:47]
  wire [7:0] _GEN_2 = {{3'd0}, io_price}; // @[VendingMachine.scala 47:65]
  wire [7:0] _GEN_4 = _GEN_2 % 8'ha; // @[VendingMachine.scala 47:65]
  wire [4:0] _display_io_price_T_2 = _GEN_4[4:0]; // @[VendingMachine.scala 47:65]
  wire [8:0] _GEN_1 = {{4'd0}, _display_io_price_T_2}; // @[VendingMachine.scala 47:53]
  wire [8:0] _display_io_price_T_3 = _display_io_price_T_1 | _GEN_1; // @[VendingMachine.scala 47:53]
  IoSync IoSync ( // @[VendingMachine.scala 23:22]
    .clock(IoSync_clock),
    .io_buy(IoSync_io_buy),
    .io_coin2(IoSync_io_coin2),
    .io_coin5(IoSync_io_coin5),
    .io_s_buy(IoSync_io_s_buy),
    .io_s_coin2(IoSync_io_s_coin2),
    .io_s_coin5(IoSync_io_s_coin5)
  );
  FSM FSM ( // @[VendingMachine.scala 28:19]
    .clock(FSM_clock),
    .io_buyCheck(FSM_io_buyCheck),
    .io_buy(FSM_io_buy),
    .io_coin2(FSM_io_coin2),
    .io_coin5(FSM_io_coin5),
    .io_add2(FSM_io_add2),
    .io_add5(FSM_io_add5),
    .io_releaseCan(FSM_io_releaseCan),
    .io_subPrice(FSM_io_subPrice),
    .io_alarm(FSM_io_alarm)
  );
  Datapath DP ( // @[VendingMachine.scala 36:18]
    .clock(DP_clock),
    .reset(DP_reset),
    .io_price(DP_io_price),
    .io_add2(DP_io_add2),
    .io_add5(DP_io_add5),
    .io_subPrice(DP_io_subPrice),
    .io_buyCheck(DP_io_buyCheck),
    .io_sum(DP_io_sum)
  );
  DisplayMultiplexer display ( // @[VendingMachine.scala 45:23]
    .clock(display_clock),
    .reset(display_reset),
    .io_sum(display_io_sum),
    .io_price(display_io_price),
    .io_seg(display_io_seg),
    .io_an(display_io_an)
  );
  assign io_releaseCan = FSM_io_releaseCan; // @[VendingMachine.scala 33:17]
  assign io_alarm = FSM_io_alarm; // @[VendingMachine.scala 34:12]
  assign io_seg = display_io_seg; // @[VendingMachine.scala 50:10]
  assign io_an = display_io_an; // @[VendingMachine.scala 51:9]
  assign IoSync_clock = clock;
  assign IoSync_io_buy = io_buy; // @[VendingMachine.scala 24:17]
  assign IoSync_io_coin2 = io_coin2; // @[VendingMachine.scala 25:19]
  assign IoSync_io_coin5 = io_coin5; // @[VendingMachine.scala 26:19]
  assign FSM_clock = clock;
  assign FSM_io_buyCheck = DP_io_buyCheck; // @[VendingMachine.scala 43:19]
  assign FSM_io_buy = IoSync_io_s_buy; // @[VendingMachine.scala 29:14]
  assign FSM_io_coin2 = IoSync_io_s_coin2; // @[VendingMachine.scala 30:16]
  assign FSM_io_coin5 = IoSync_io_s_coin5; // @[VendingMachine.scala 31:16]
  assign DP_clock = clock;
  assign DP_reset = reset;
  assign DP_io_price = {{3'd0}, io_price}; // @[VendingMachine.scala 37:15]
  assign DP_io_add2 = FSM_io_add2; // @[VendingMachine.scala 38:14]
  assign DP_io_add5 = FSM_io_add5; // @[VendingMachine.scala 39:14]
  assign DP_io_subPrice = FSM_io_subPrice; // @[VendingMachine.scala 40:18]
  assign display_clock = clock;
  assign display_reset = reset;
  assign display_io_sum = _display_io_sum_T_3[7:0]; // @[VendingMachine.scala 46:18]
  assign display_io_price = _display_io_price_T_3[7:0]; // @[VendingMachine.scala 47:20]
endmodule
