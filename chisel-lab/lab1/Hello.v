module Hello(
  input   clock,
  input   reset,
  output  io_led
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cntReg; // @[Hello.scala 17:23]
  reg  blkReg; // @[Hello.scala 18:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[Hello.scala 20:20]
  wire  _GEN_1 = cntReg == 32'h2faf07f ? 1'h0 : blkReg; // @[Hello.scala 21:28 23:12 18:23]
  wire [25:0] _T_1 = 26'h2faf07f / 4'h8; // @[Hello.scala 25:27]
  wire [31:0] _GEN_3 = {{6'd0}, _T_1}; // @[Hello.scala 25:15]
  wire  _GEN_2 = cntReg == _GEN_3 | _GEN_1; // @[Hello.scala 25:34 26:12]
  assign io_led = blkReg; // @[Hello.scala 28:10]
  always @(posedge clock) begin
    if (reset) begin // @[Hello.scala 17:23]
      cntReg <= 32'h0; // @[Hello.scala 17:23]
    end else if (cntReg == 32'h2faf07f) begin // @[Hello.scala 21:28]
      cntReg <= 32'h0; // @[Hello.scala 22:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[Hello.scala 20:10]
    end
    if (reset) begin // @[Hello.scala 18:23]
      blkReg <= 1'h0; // @[Hello.scala 18:23]
    end else begin
      blkReg <= _GEN_2;
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
  blkReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
