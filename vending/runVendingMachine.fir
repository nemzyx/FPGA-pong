circuit runVendingMachine :
  module IoSync :
    input clock : Clock
    input reset : Reset
    output io : { flip buy : UInt<1>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, s_buy : UInt<1>, s_coin2 : UInt<1>, s_coin5 : UInt<1>}

    wire x1 : UInt<1>
    x1 <= UInt<1>("h0")
    wire x2 : UInt<1>
    x2 <= UInt<1>("h0")
    when io.buy : @[IoSync.scala 17:16]
      x1 <= UInt<1>("h1") @[IoSync.scala 18:8]
      x2 <= UInt<1>("h1") @[IoSync.scala 19:8]
    reg io_s_buy_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_buy_REG) @[IoSync.scala 22:30]
    io_s_buy_REG <= io.buy @[IoSync.scala 22:30]
    reg io_s_buy_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_buy_REG_1) @[IoSync.scala 22:22]
    io_s_buy_REG_1 <= io_s_buy_REG @[IoSync.scala 22:22]
    io.s_buy <= io_s_buy_REG_1 @[IoSync.scala 22:12]
    reg io_s_coin2_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin2_REG) @[IoSync.scala 23:32]
    io_s_coin2_REG <= io.coin2 @[IoSync.scala 23:32]
    reg io_s_coin2_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin2_REG_1) @[IoSync.scala 23:24]
    io_s_coin2_REG_1 <= io_s_coin2_REG @[IoSync.scala 23:24]
    io.s_coin2 <= io_s_coin2_REG_1 @[IoSync.scala 23:14]
    reg io_s_coin5_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin5_REG) @[IoSync.scala 24:32]
    io_s_coin5_REG <= io.coin5 @[IoSync.scala 24:32]
    reg io_s_coin5_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin5_REG_1) @[IoSync.scala 24:24]
    io_s_coin5_REG_1 <= io_s_coin5_REG @[IoSync.scala 24:24]
    io.s_coin5 <= io_s_coin5_REG_1 @[IoSync.scala 24:14]

  module FSM :
    input clock : Clock
    input reset : Reset
    output io : { flip buyCheck : UInt<1>, flip buy : UInt<1>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip reset : UInt<1>, add2 : UInt<1>, add5 : UInt<1>, releaseCan : UInt<1>, subPrice : UInt<1>, alarm : UInt<1>, init : UInt<1>}

    io.alarm <= UInt<1>("h0") @[FSM.scala 19:12]
    io.releaseCan <= UInt<1>("h0") @[FSM.scala 20:17]
    io.subPrice <= UInt<1>("h0") @[FSM.scala 21:15]
    io.add2 <= UInt<1>("h0") @[FSM.scala 22:11]
    io.add5 <= UInt<1>("h0") @[FSM.scala 23:11]
    io.init <= UInt<1>("h0") @[FSM.scala 24:11]
    node _anyBtn_T = or(io.buy, io.coin2) @[FSM.scala 26:24]
    node anyBtn = or(_anyBtn_T, io.coin5) @[FSM.scala 26:35]
    wire ready : UInt<1>
    ready <= UInt<1>("h0")
    reg ready_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ready_REG) @[FSM.scala 28:30]
    ready_REG <= anyBtn @[FSM.scala 28:30]
    node _ready_T = eq(ready_REG, UInt<1>("h0")) @[FSM.scala 28:22]
    node _ready_T_1 = and(anyBtn, _ready_T) @[FSM.scala 28:19]
    ready <= _ready_T_1 @[FSM.scala 28:9]
    when ready : @[FSM.scala 30:15]
      when io.coin2 : @[FSM.scala 31:20]
        io.add2 <= UInt<1>("h1") @[FSM.scala 32:15]
      when io.coin5 : @[FSM.scala 34:20]
        io.add5 <= UInt<1>("h1") @[FSM.scala 35:15]
      node _T = and(io.buy, io.buyCheck) @[FSM.scala 38:17]
      when _T : @[FSM.scala 38:33]
        io.alarm <= UInt<1>("h0") @[FSM.scala 39:16]
        io.releaseCan <= UInt<1>("h1") @[FSM.scala 40:21]
        io.subPrice <= UInt<1>("h1") @[FSM.scala 41:19]
      else :
        node _T_1 = not(io.buyCheck) @[FSM.scala 42:27]
        node _T_2 = and(io.buy, _T_1) @[FSM.scala 42:24]
        when _T_2 : @[FSM.scala 42:41]
          io.alarm <= UInt<1>("h1") @[FSM.scala 43:16]
          io.releaseCan <= UInt<1>("h0") @[FSM.scala 44:21]
          io.subPrice <= UInt<1>("h0") @[FSM.scala 45:19]
    when io.reset : @[FSM.scala 49:18]
      ready <= UInt<1>("h0") @[FSM.scala 50:11]
      io.init <= UInt<1>("h1") @[FSM.scala 51:13]
    else :
      io.init <= UInt<1>("h0") @[FSM.scala 53:13]

  module Datapath :
    input clock : Clock
    input reset : Reset
    output io : { flip price : UInt<8>, flip add2 : UInt<1>, flip add5 : UInt<1>, flip subPrice : UInt<1>, flip init : UInt<1>, buyCheck : UInt<1>, sum : UInt<8>}

    reg sumReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[Datapath.scala 15:23]
    when io.add2 : @[Datapath.scala 17:17]
      node _sumReg_T = add(sumReg, UInt<2>("h2")) @[Datapath.scala 18:22]
      node _sumReg_T_1 = tail(_sumReg_T, 1) @[Datapath.scala 18:22]
      sumReg <= _sumReg_T_1 @[Datapath.scala 18:12]
    when io.add5 : @[Datapath.scala 21:17]
      node _sumReg_T_2 = add(sumReg, UInt<3>("h5")) @[Datapath.scala 22:22]
      node _sumReg_T_3 = tail(_sumReg_T_2, 1) @[Datapath.scala 22:22]
      sumReg <= _sumReg_T_3 @[Datapath.scala 22:12]
    when io.subPrice : @[Datapath.scala 25:21]
      node _sumReg_T_4 = sub(sumReg, io.price) @[Datapath.scala 26:22]
      node _sumReg_T_5 = tail(_sumReg_T_4, 1) @[Datapath.scala 26:22]
      sumReg <= _sumReg_T_5 @[Datapath.scala 26:12]
    node _T = geq(sumReg, io.price) @[Datapath.scala 29:15]
    when _T : @[Datapath.scala 29:28]
      io.buyCheck <= UInt<1>("h1") @[Datapath.scala 30:17]
    else :
      io.buyCheck <= UInt<1>("h0") @[Datapath.scala 32:17]
    when io.init : @[Datapath.scala 35:17]
      sumReg <= UInt<1>("h0") @[Datapath.scala 36:12]
    io.sum <= sumReg @[Datapath.scala 39:10]

  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<5>, out : UInt<7>}

    wire sevSeg : UInt
    sevSeg <= UInt<1>("h0")
    node _T = eq(UInt<1>("h0"), io.in) @[SevenSegDec.scala 14:17]
    when _T : @[SevenSegDec.scala 14:17]
      sevSeg <= UInt<6>("h3f") @[SevenSegDec.scala 15:23]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[SevenSegDec.scala 14:17]
      when _T_1 : @[SevenSegDec.scala 14:17]
        sevSeg <= UInt<3>("h6") @[SevenSegDec.scala 16:23]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[SevenSegDec.scala 14:17]
        when _T_2 : @[SevenSegDec.scala 14:17]
          sevSeg <= UInt<7>("h5b") @[SevenSegDec.scala 17:23]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[SevenSegDec.scala 14:17]
          when _T_3 : @[SevenSegDec.scala 14:17]
            sevSeg <= UInt<7>("h4f") @[SevenSegDec.scala 18:23]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[SevenSegDec.scala 14:17]
            when _T_4 : @[SevenSegDec.scala 14:17]
              sevSeg <= UInt<7>("h66") @[SevenSegDec.scala 19:23]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[SevenSegDec.scala 14:17]
              when _T_5 : @[SevenSegDec.scala 14:17]
                sevSeg <= UInt<7>("h6d") @[SevenSegDec.scala 20:23]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[SevenSegDec.scala 14:17]
                when _T_6 : @[SevenSegDec.scala 14:17]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDec.scala 21:23]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[SevenSegDec.scala 14:17]
                  when _T_7 : @[SevenSegDec.scala 14:17]
                    sevSeg <= UInt<3>("h7") @[SevenSegDec.scala 22:23]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[SevenSegDec.scala 14:17]
                    when _T_8 : @[SevenSegDec.scala 14:17]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDec.scala 23:23]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[SevenSegDec.scala 14:17]
                      when _T_9 : @[SevenSegDec.scala 14:17]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDec.scala 24:23]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[SevenSegDec.scala 14:17]
                        when _T_10 : @[SevenSegDec.scala 14:17]
                          sevSeg <= UInt<7>("h77") @[SevenSegDec.scala 25:23]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[SevenSegDec.scala 14:17]
                          when _T_11 : @[SevenSegDec.scala 14:17]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDec.scala 26:23]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[SevenSegDec.scala 14:17]
                            when _T_12 : @[SevenSegDec.scala 14:17]
                              sevSeg <= UInt<7>("h58") @[SevenSegDec.scala 27:23]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[SevenSegDec.scala 14:17]
                              when _T_13 : @[SevenSegDec.scala 14:17]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDec.scala 28:23]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[SevenSegDec.scala 14:17]
                                when _T_14 : @[SevenSegDec.scala 14:17]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDec.scala 29:23]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[SevenSegDec.scala 14:17]
                                  when _T_15 : @[SevenSegDec.scala 14:17]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDec.scala 30:23]
                                  else :
                                    node _T_16 = eq(UInt<5>("h10"), io.in) @[SevenSegDec.scala 14:17]
                                    when _T_16 : @[SevenSegDec.scala 14:17]
                                      sevSeg <= UInt<7>("h76") @[SevenSegDec.scala 31:23]
                                    else :
                                      node _T_17 = eq(UInt<5>("h11"), io.in) @[SevenSegDec.scala 14:17]
                                      when _T_17 : @[SevenSegDec.scala 14:17]
                                        sevSeg <= UInt<6>("h39") @[SevenSegDec.scala 32:23]
                                      else :
                                        node _T_18 = eq(UInt<5>("h12"), io.in) @[SevenSegDec.scala 14:17]
                                        when _T_18 : @[SevenSegDec.scala 14:17]
                                          sevSeg <= UInt<4>("hf") @[SevenSegDec.scala 33:23]
                                        else :
                                          node _T_19 = eq(UInt<5>("h13"), io.in) @[SevenSegDec.scala 14:17]
                                          when _T_19 : @[SevenSegDec.scala 14:17]
                                            sevSeg <= UInt<6>("h3d") @[SevenSegDec.scala 34:23]
                                          else :
                                            node _T_20 = eq(UInt<5>("h14"), io.in) @[SevenSegDec.scala 14:17]
                                            when _T_20 : @[SevenSegDec.scala 14:17]
                                              sevSeg <= UInt<5>("h1e") @[SevenSegDec.scala 35:23]
                                            else :
                                              node _T_21 = eq(UInt<5>("h15"), io.in) @[SevenSegDec.scala 14:17]
                                              when _T_21 : @[SevenSegDec.scala 14:17]
                                                sevSeg <= UInt<7>("h75") @[SevenSegDec.scala 36:23]
                                              else :
                                                node _T_22 = eq(UInt<5>("h16"), io.in) @[SevenSegDec.scala 14:17]
                                                when _T_22 : @[SevenSegDec.scala 14:17]
                                                  sevSeg <= UInt<6>("h38") @[SevenSegDec.scala 37:23]
                                                else :
                                                  node _T_23 = eq(UInt<5>("h17"), io.in) @[SevenSegDec.scala 14:17]
                                                  when _T_23 : @[SevenSegDec.scala 14:17]
                                                    sevSeg <= UInt<5>("h15") @[SevenSegDec.scala 38:23]
                                                  else :
                                                    node _T_24 = eq(UInt<5>("h18"), io.in) @[SevenSegDec.scala 14:17]
                                                    when _T_24 : @[SevenSegDec.scala 14:17]
                                                      sevSeg <= UInt<6>("h37") @[SevenSegDec.scala 39:23]
                                                    else :
                                                      node _T_25 = eq(UInt<5>("h19"), io.in) @[SevenSegDec.scala 14:17]
                                                      when _T_25 : @[SevenSegDec.scala 14:17]
                                                        sevSeg <= UInt<7>("h73") @[SevenSegDec.scala 40:23]
                                                      else :
                                                        node _T_26 = eq(UInt<5>("h1a"), io.in) @[SevenSegDec.scala 14:17]
                                                        when _T_26 : @[SevenSegDec.scala 14:17]
                                                          sevSeg <= UInt<7>("h67") @[SevenSegDec.scala 41:23]
                                                        else :
                                                          node _T_27 = eq(UInt<5>("h1b"), io.in) @[SevenSegDec.scala 14:17]
                                                          when _T_27 : @[SevenSegDec.scala 14:17]
                                                            sevSeg <= UInt<6>("h33") @[SevenSegDec.scala 42:23]
                                                          else :
                                                            node _T_28 = eq(UInt<5>("h1c"), io.in) @[SevenSegDec.scala 14:17]
                                                            when _T_28 : @[SevenSegDec.scala 14:17]
                                                              sevSeg <= UInt<7>("h78") @[SevenSegDec.scala 43:23]
                                                            else :
                                                              node _T_29 = eq(UInt<5>("h1d"), io.in) @[SevenSegDec.scala 14:17]
                                                              when _T_29 : @[SevenSegDec.scala 14:17]
                                                                sevSeg <= UInt<6>("h3e") @[SevenSegDec.scala 44:23]
                                                              else :
                                                                node _T_30 = eq(UInt<5>("h1e"), io.in) @[SevenSegDec.scala 14:17]
                                                                when _T_30 : @[SevenSegDec.scala 14:17]
                                                                  sevSeg <= UInt<5>("h1c") @[SevenSegDec.scala 45:23]
                                                                else :
                                                                  node _T_31 = eq(UInt<5>("h1f"), io.in) @[SevenSegDec.scala 14:17]
                                                                  when _T_31 : @[SevenSegDec.scala 14:17]
                                                                    sevSeg <= UInt<7>("h5c") @[SevenSegDec.scala 46:23]
    io.out <= sevSeg @[SevenSegDec.scala 49:10]

  module DisplayMultiplexer :
    input clock : Clock
    input reset : Reset
    output io : { flip sum : UInt<8>, flip price : UInt<8>, seg : UInt<7>, an : UInt<4>}

    reg tcReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[DisplayMultiplexer.scala 12:22]
    reg anReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[DisplayMultiplexer.scala 13:22]
    node _T = lt(tcReg, UInt<17>("h186a0")) @[DisplayMultiplexer.scala 15:15]
    when _T : @[DisplayMultiplexer.scala 15:29]
      node _tcReg_T = add(tcReg, UInt<1>("h1")) @[DisplayMultiplexer.scala 16:20]
      node _tcReg_T_1 = tail(_tcReg_T, 1) @[DisplayMultiplexer.scala 16:20]
      tcReg <= _tcReg_T_1 @[DisplayMultiplexer.scala 16:11]
    else :
      tcReg <= UInt<1>("h0") @[DisplayMultiplexer.scala 18:11]
      node _anReg_T = add(anReg, UInt<1>("h1")) @[DisplayMultiplexer.scala 19:20]
      node _anReg_T_1 = tail(_anReg_T, 1) @[DisplayMultiplexer.scala 19:20]
      anReg <= _anReg_T_1 @[DisplayMultiplexer.scala 19:11]
    wire sevSeg : UInt<7>
    sevSeg <= UInt<7>("h7f")
    wire select : UInt<4>
    select <= UInt<4>("h1")
    inst decoder of SevenSegDec @[DisplayMultiplexer.scala 24:23]
    decoder.clock <= clock
    decoder.reset <= reset
    decoder.io.in <= UInt<1>("h0") @[DisplayMultiplexer.scala 25:17]
    sevSeg <= decoder.io.out @[DisplayMultiplexer.scala 26:10]
    node _T_1 = eq(UInt<1>("h0"), anReg) @[DisplayMultiplexer.scala 28:17]
    when _T_1 : @[DisplayMultiplexer.scala 28:17]
      select <= UInt<4>("h8") @[DisplayMultiplexer.scala 30:14]
      node _decoder_io_in_T = bits(io.sum, 7, 4) @[DisplayMultiplexer.scala 31:30]
      decoder.io.in <= _decoder_io_in_T @[DisplayMultiplexer.scala 31:21]
    else :
      node _T_2 = eq(UInt<1>("h1"), anReg) @[DisplayMultiplexer.scala 28:17]
      when _T_2 : @[DisplayMultiplexer.scala 28:17]
        select <= UInt<3>("h4") @[DisplayMultiplexer.scala 34:14]
        node _decoder_io_in_T_1 = bits(io.sum, 3, 0) @[DisplayMultiplexer.scala 35:30]
        decoder.io.in <= _decoder_io_in_T_1 @[DisplayMultiplexer.scala 35:21]
      else :
        node _T_3 = eq(UInt<2>("h2"), anReg) @[DisplayMultiplexer.scala 28:17]
        when _T_3 : @[DisplayMultiplexer.scala 28:17]
          select <= UInt<2>("h2") @[DisplayMultiplexer.scala 38:14]
          node _decoder_io_in_T_2 = bits(io.price, 7, 4) @[DisplayMultiplexer.scala 39:32]
          decoder.io.in <= _decoder_io_in_T_2 @[DisplayMultiplexer.scala 39:21]
        else :
          node _T_4 = eq(UInt<2>("h3"), anReg) @[DisplayMultiplexer.scala 28:17]
          when _T_4 : @[DisplayMultiplexer.scala 28:17]
            select <= UInt<1>("h1") @[DisplayMultiplexer.scala 42:14]
            node _decoder_io_in_T_3 = bits(io.price, 3, 0) @[DisplayMultiplexer.scala 43:32]
            decoder.io.in <= _decoder_io_in_T_3 @[DisplayMultiplexer.scala 43:21]
    node _io_seg_T = not(sevSeg) @[DisplayMultiplexer.scala 47:13]
    io.seg <= _io_seg_T @[DisplayMultiplexer.scala 47:10]
    node _io_an_T = not(select) @[DisplayMultiplexer.scala 48:12]
    io.an <= _io_an_T @[DisplayMultiplexer.scala 48:9]

  module runVendingMachine :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>}

    inst IoSync of IoSync @[VendingMachine.scala 23:22]
    IoSync.clock <= clock
    IoSync.reset <= reset
    IoSync.io.buy <= io.buy @[VendingMachine.scala 24:17]
    IoSync.io.coin2 <= io.coin2 @[VendingMachine.scala 25:19]
    IoSync.io.coin5 <= io.coin5 @[VendingMachine.scala 26:19]
    inst FSM of FSM @[VendingMachine.scala 28:19]
    FSM.clock <= clock
    FSM.reset <= reset
    FSM.io.buy <= IoSync.io.s_buy @[VendingMachine.scala 29:14]
    FSM.io.coin2 <= IoSync.io.s_coin2 @[VendingMachine.scala 30:16]
    FSM.io.coin5 <= IoSync.io.s_coin5 @[VendingMachine.scala 31:16]
    FSM.io.reset <= UInt<1>("h0") @[VendingMachine.scala 32:16]
    io.releaseCan <= FSM.io.releaseCan @[VendingMachine.scala 33:17]
    io.alarm <= FSM.io.alarm @[VendingMachine.scala 34:12]
    inst DP of Datapath @[VendingMachine.scala 36:18]
    DP.clock <= clock
    DP.reset <= reset
    DP.io.price <= io.price @[VendingMachine.scala 37:15]
    DP.io.add2 <= FSM.io.add2 @[VendingMachine.scala 38:14]
    DP.io.add5 <= FSM.io.add5 @[VendingMachine.scala 39:14]
    DP.io.subPrice <= FSM.io.subPrice @[VendingMachine.scala 40:18]
    DP.io.init <= FSM.io.init @[VendingMachine.scala 41:14]
    FSM.io.buyCheck <= DP.io.buyCheck @[VendingMachine.scala 43:19]
    inst display of DisplayMultiplexer @[VendingMachine.scala 45:23]
    display.clock <= clock
    display.reset <= reset
    node _display_io_sum_T = div(DP.io.sum, UInt<8>("ha")) @[VendingMachine.scala 46:34]
    node _display_io_sum_T_1 = shl(_display_io_sum_T, 4) @[VendingMachine.scala 46:47]
    node _display_io_sum_T_2 = rem(DP.io.sum, UInt<8>("ha")) @[VendingMachine.scala 46:66]
    node _display_io_sum_T_3 = or(_display_io_sum_T_1, _display_io_sum_T_2) @[VendingMachine.scala 46:53]
    display.io.sum <= _display_io_sum_T_3 @[VendingMachine.scala 46:18]
    node _display_io_price_T = div(io.price, UInt<8>("ha")) @[VendingMachine.scala 47:34]
    node _display_io_price_T_1 = shl(_display_io_price_T, 4) @[VendingMachine.scala 47:47]
    node _display_io_price_T_2 = rem(io.price, UInt<8>("ha")) @[VendingMachine.scala 47:65]
    node _display_io_price_T_3 = or(_display_io_price_T_1, _display_io_price_T_2) @[VendingMachine.scala 47:53]
    display.io.price <= _display_io_price_T_3 @[VendingMachine.scala 47:20]
    io.seg <= display.io.seg @[VendingMachine.scala 50:10]
    io.an <= display.io.an @[VendingMachine.scala 51:9]

