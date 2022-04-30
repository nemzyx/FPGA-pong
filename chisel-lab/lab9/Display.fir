circuit Display :
  module DisplayMultiplexer :
    input clock : Clock
    input reset : Reset
    output io : { flip sum : UInt<8>, flip price : UInt<8>, seg : UInt<7>, an : UInt<4>}

    wire sevSeg : UInt<7>
    sevSeg <= UInt<7>("h7f")
    wire select : UInt<4>
    select <= UInt<4>("h1")
    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[DisplayMultiplexer.scala 18:23]
    reg anReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[DisplayMultiplexer.scala 19:22]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[DisplayMultiplexer.scala 21:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[DisplayMultiplexer.scala 21:20]
    cntReg <= _cntReg_T_1 @[DisplayMultiplexer.scala 21:10]
    node _T = eq(cntReg, UInt<24>("h989680")) @[DisplayMultiplexer.scala 22:15]
    when _T : @[DisplayMultiplexer.scala 22:28]
      cntReg <= UInt<1>("h0") @[DisplayMultiplexer.scala 23:12]
      node _anReg_T = add(anReg, UInt<1>("h1")) @[DisplayMultiplexer.scala 24:20]
      node _anReg_T_1 = tail(_anReg_T, 1) @[DisplayMultiplexer.scala 24:20]
      anReg <= _anReg_T_1 @[DisplayMultiplexer.scala 24:11]
    node _T_1 = eq(anReg, UInt<3>("h4")) @[DisplayMultiplexer.scala 26:15]
    when _T_1 : @[DisplayMultiplexer.scala 26:24]
      anReg <= UInt<1>("h0") @[DisplayMultiplexer.scala 27:11]
    node _T_2 = eq(UInt<1>("h0"), anReg) @[DisplayMultiplexer.scala 30:17]
    when _T_2 : @[DisplayMultiplexer.scala 30:17]
      io.an <= UInt<4>("h8") @[DisplayMultiplexer.scala 31:21]
    else :
      node _T_3 = eq(UInt<1>("h1"), anReg) @[DisplayMultiplexer.scala 30:17]
      when _T_3 : @[DisplayMultiplexer.scala 30:17]
        io.an <= UInt<3>("h4") @[DisplayMultiplexer.scala 32:21]
      else :
        node _T_4 = eq(UInt<2>("h2"), anReg) @[DisplayMultiplexer.scala 30:17]
        when _T_4 : @[DisplayMultiplexer.scala 30:17]
          io.an <= UInt<2>("h2") @[DisplayMultiplexer.scala 33:21]
        else :
          node _T_5 = eq(UInt<2>("h3"), anReg) @[DisplayMultiplexer.scala 30:17]
          when _T_5 : @[DisplayMultiplexer.scala 30:17]
            io.an <= UInt<1>("h1") @[DisplayMultiplexer.scala 34:21]
    node _io_seg_T = not(sevSeg) @[DisplayMultiplexer.scala 38:13]
    io.seg <= _io_seg_T @[DisplayMultiplexer.scala 38:10]
    node _io_an_T = not(select) @[DisplayMultiplexer.scala 39:12]
    io.an <= _io_an_T @[DisplayMultiplexer.scala 39:9]

  module Display :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sw : UInt<16>, seg : UInt<7>, an : UInt<4>}

    inst dispMux of DisplayMultiplexer @[Display.scala 15:23]
    dispMux.clock <= clock
    dispMux.reset <= reset
    node _dispMux_io_price_T = bits(io.sw, 7, 0) @[Display.scala 18:28]
    dispMux.io.price <= _dispMux_io_price_T @[Display.scala 18:20]
    node _dispMux_io_sum_T = bits(io.sw, 15, 8) @[Display.scala 19:26]
    dispMux.io.sum <= _dispMux_io_sum_T @[Display.scala 19:18]
    io.seg <= dispMux.io.seg @[Display.scala 22:10]
    io.an <= dispMux.io.an @[Display.scala 23:9]

