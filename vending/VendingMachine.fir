circuit VendingMachine :
  module IoSync :
    input clock : Clock
    input reset : Reset
    output io : { flip buy : UInt<1>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip p1 : UInt<1>, flip p2 : UInt<1>, s_buy : UInt<1>, s_coin2 : UInt<1>, s_coin5 : UInt<1>, s_p1 : UInt<1>, s_p2 : UInt<1>}

    reg io_s_buy_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_buy_REG) @[IoSync.scala 18:30]
    io_s_buy_REG <= io.buy @[IoSync.scala 18:30]
    reg io_s_buy_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_buy_REG_1) @[IoSync.scala 18:22]
    io_s_buy_REG_1 <= io_s_buy_REG @[IoSync.scala 18:22]
    io.s_buy <= io_s_buy_REG_1 @[IoSync.scala 18:12]
    reg io_s_coin2_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin2_REG) @[IoSync.scala 19:32]
    io_s_coin2_REG <= io.coin2 @[IoSync.scala 19:32]
    reg io_s_coin2_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin2_REG_1) @[IoSync.scala 19:24]
    io_s_coin2_REG_1 <= io_s_coin2_REG @[IoSync.scala 19:24]
    io.s_coin2 <= io_s_coin2_REG_1 @[IoSync.scala 19:14]
    reg io_s_coin5_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin5_REG) @[IoSync.scala 20:32]
    io_s_coin5_REG <= io.coin5 @[IoSync.scala 20:32]
    reg io_s_coin5_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_coin5_REG_1) @[IoSync.scala 20:24]
    io_s_coin5_REG_1 <= io_s_coin5_REG @[IoSync.scala 20:24]
    io.s_coin5 <= io_s_coin5_REG_1 @[IoSync.scala 20:14]
    reg io_s_p1_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_p1_REG) @[IoSync.scala 21:29]
    io_s_p1_REG <= io.p1 @[IoSync.scala 21:29]
    reg io_s_p1_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_p1_REG_1) @[IoSync.scala 21:21]
    io_s_p1_REG_1 <= io_s_p1_REG @[IoSync.scala 21:21]
    io.s_p1 <= io_s_p1_REG_1 @[IoSync.scala 21:11]
    reg io_s_p2_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_p2_REG) @[IoSync.scala 22:29]
    io_s_p2_REG <= io.p2 @[IoSync.scala 22:29]
    reg io_s_p2_REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_s_p2_REG_1) @[IoSync.scala 22:21]
    io_s_p2_REG_1 <= io_s_p2_REG @[IoSync.scala 22:21]
    io.s_p2 <= io_s_p2_REG_1 @[IoSync.scala 22:11]

  module FSM :
    input clock : Clock
    input reset : Reset
    output io : { flip buyCheck : UInt<1>, flip buy : UInt<1>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, add2 : UInt<1>, add5 : UInt<1>, subPrice : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>}

    io.add2 <= UInt<1>("h0") @[FSM.scala 17:11]
    io.add5 <= UInt<1>("h0") @[FSM.scala 18:11]
    io.alarm <= UInt<1>("h0") @[FSM.scala 19:12]
    io.subPrice <= UInt<1>("h0") @[FSM.scala 20:15]
    io.releaseCan <= UInt<1>("h0") @[FSM.scala 21:17]
    reg state : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[FSM.scala 24:22]
    node _T = eq(UInt<3>("h0"), state) @[FSM.scala 28:17]
    when _T : @[FSM.scala 28:17]
      when io.coin2 : @[FSM.scala 30:27]
        state <= UInt<3>("h2") @[FSM.scala 30:34]
      else :
        when io.coin5 : @[FSM.scala 31:27]
          state <= UInt<3>("h1") @[FSM.scala 31:34]
        else :
          when io.buy : @[FSM.scala 32:27]
            state <= UInt<3>("h3") @[FSM.scala 32:34]
          else :
            state <= UInt<3>("h0") @[FSM.scala 33:34]
    else :
      node _T_1 = eq(UInt<3>("h2"), state) @[FSM.scala 28:17]
      when _T_1 : @[FSM.scala 28:17]
        state <= UInt<3>("h7") @[FSM.scala 36:13]
      else :
        node _T_2 = eq(UInt<3>("h1"), state) @[FSM.scala 28:17]
        when _T_2 : @[FSM.scala 28:17]
          state <= UInt<3>("h7") @[FSM.scala 39:13]
        else :
          node _T_3 = eq(UInt<3>("h3"), state) @[FSM.scala 28:17]
          when _T_3 : @[FSM.scala 28:17]
            when io.buyCheck : @[FSM.scala 42:25]
              state <= UInt<3>("h6") @[FSM.scala 42:32]
            else :
              state <= UInt<3>("h4") @[FSM.scala 43:32]
          else :
            node _T_4 = eq(UInt<3>("h4"), state) @[FSM.scala 28:17]
            when _T_4 : @[FSM.scala 28:17]
              when io.buy : @[FSM.scala 46:20]
                state <= UInt<3>("h4") @[FSM.scala 46:27]
              else :
                state <= UInt<3>("h7") @[FSM.scala 47:27]
            else :
              node _T_5 = eq(UInt<3>("h6"), state) @[FSM.scala 28:17]
              when _T_5 : @[FSM.scala 28:17]
                state <= UInt<3>("h5") @[FSM.scala 50:13]
              else :
                node _T_6 = eq(UInt<3>("h5"), state) @[FSM.scala 28:17]
                when _T_6 : @[FSM.scala 28:17]
                  when io.buy : @[FSM.scala 53:20]
                    state <= UInt<3>("h5") @[FSM.scala 53:27]
                  else :
                    state <= UInt<3>("h7") @[FSM.scala 54:27]
                else :
                  node _T_7 = eq(UInt<3>("h7"), state) @[FSM.scala 28:17]
                  when _T_7 : @[FSM.scala 28:17]
                    node _T_8 = or(io.buy, io.coin2) @[FSM.scala 57:21]
                    node _T_9 = or(_T_8, io.coin5) @[FSM.scala 57:32]
                    node _T_10 = eq(_T_9, UInt<1>("h0")) @[FSM.scala 57:12]
                    when _T_10 : @[FSM.scala 57:45]
                      state <= UInt<3>("h0") @[FSM.scala 57:52]
                    else :
                      state <= UInt<3>("h7") @[FSM.scala 58:25]
    node _T_11 = eq(UInt<3>("h0"), state) @[FSM.scala 63:16]
    when _T_11 : @[FSM.scala 63:16]
      io.add2 <= UInt<1>("h0") @[FSM.scala 65:15]
      io.add5 <= UInt<1>("h0") @[FSM.scala 66:15]
      io.alarm <= UInt<1>("h0") @[FSM.scala 67:16]
      io.releaseCan <= UInt<1>("h0") @[FSM.scala 68:21]
    else :
      node _T_12 = eq(UInt<3>("h2"), state) @[FSM.scala 63:16]
      when _T_12 : @[FSM.scala 63:16]
        io.add2 <= UInt<1>("h1") @[FSM.scala 70:27]
      else :
        node _T_13 = eq(UInt<3>("h1"), state) @[FSM.scala 63:16]
        when _T_13 : @[FSM.scala 63:16]
          io.add5 <= UInt<1>("h1") @[FSM.scala 71:27]
        else :
          node _T_14 = eq(UInt<3>("h4"), state) @[FSM.scala 63:16]
          when _T_14 : @[FSM.scala 63:16]
            io.alarm <= UInt<1>("h1") @[FSM.scala 72:28]
          else :
            node _T_15 = eq(UInt<3>("h6"), state) @[FSM.scala 63:16]
            when _T_15 : @[FSM.scala 63:16]
              io.subPrice <= UInt<1>("h1") @[FSM.scala 73:31]
            else :
              node _T_16 = eq(UInt<3>("h5"), state) @[FSM.scala 63:16]
              when _T_16 : @[FSM.scala 63:16]
                io.releaseCan <= UInt<1>("h1") @[FSM.scala 74:33]

  module Datapath :
    input clock : Clock
    input reset : Reset
    output io : { flip price : UInt<8>, flip add2 : UInt<1>, flip add5 : UInt<1>, flip subPrice : UInt<1>, buyCheck : UInt<1>, sum : UInt<8>}

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
    io.sum <= sumReg @[Datapath.scala 35:10]

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

  module DisplayMultiplexer5bit :
    input clock : Clock
    input reset : Reset
    output io : { flip rawEnable : UInt<1>, flip raw : UInt<28>, flip sum : UInt<10>, flip price : UInt<10>, seg : UInt<7>, an : UInt<4>}

    reg tcReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[DisplayMultiplexer5bit.scala 15:22]
    reg anReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[DisplayMultiplexer5bit.scala 16:22]
    node _T = lt(tcReg, UInt<17>("h186a0")) @[DisplayMultiplexer5bit.scala 18:15]
    when _T : @[DisplayMultiplexer5bit.scala 18:29]
      node _tcReg_T = add(tcReg, UInt<1>("h1")) @[DisplayMultiplexer5bit.scala 19:20]
      node _tcReg_T_1 = tail(_tcReg_T, 1) @[DisplayMultiplexer5bit.scala 19:20]
      tcReg <= _tcReg_T_1 @[DisplayMultiplexer5bit.scala 19:11]
    else :
      tcReg <= UInt<1>("h0") @[DisplayMultiplexer5bit.scala 21:11]
      node _anReg_T = add(anReg, UInt<1>("h1")) @[DisplayMultiplexer5bit.scala 22:20]
      node _anReg_T_1 = tail(_anReg_T, 1) @[DisplayMultiplexer5bit.scala 22:20]
      anReg <= _anReg_T_1 @[DisplayMultiplexer5bit.scala 22:11]
    wire sevSeg : UInt<7>
    sevSeg <= UInt<7>("h7f")
    wire select : UInt<4>
    select <= UInt<4>("h1")
    inst decoder of SevenSegDec @[DisplayMultiplexer5bit.scala 27:23]
    decoder.clock <= clock
    decoder.reset <= reset
    decoder.io.in <= UInt<1>("h0") @[DisplayMultiplexer5bit.scala 28:17]
    sevSeg <= decoder.io.out @[DisplayMultiplexer5bit.scala 29:10]
    when io.rawEnable : @[DisplayMultiplexer5bit.scala 31:22]
      node _T_1 = eq(UInt<1>("h0"), anReg) @[DisplayMultiplexer5bit.scala 32:19]
      when _T_1 : @[DisplayMultiplexer5bit.scala 32:19]
        select <= UInt<4>("h8") @[DisplayMultiplexer5bit.scala 34:16]
        node _sevSeg_T = bits(io.raw, 27, 21) @[DisplayMultiplexer5bit.scala 35:25]
        sevSeg <= _sevSeg_T @[DisplayMultiplexer5bit.scala 35:16]
      else :
        node _T_2 = eq(UInt<1>("h1"), anReg) @[DisplayMultiplexer5bit.scala 32:19]
        when _T_2 : @[DisplayMultiplexer5bit.scala 32:19]
          select <= UInt<3>("h4") @[DisplayMultiplexer5bit.scala 38:16]
          node _sevSeg_T_1 = bits(io.raw, 20, 14) @[DisplayMultiplexer5bit.scala 39:25]
          sevSeg <= _sevSeg_T_1 @[DisplayMultiplexer5bit.scala 39:16]
        else :
          node _T_3 = eq(UInt<2>("h2"), anReg) @[DisplayMultiplexer5bit.scala 32:19]
          when _T_3 : @[DisplayMultiplexer5bit.scala 32:19]
            select <= UInt<2>("h2") @[DisplayMultiplexer5bit.scala 42:16]
            node _sevSeg_T_2 = bits(io.raw, 13, 7) @[DisplayMultiplexer5bit.scala 43:25]
            sevSeg <= _sevSeg_T_2 @[DisplayMultiplexer5bit.scala 43:16]
          else :
            node _T_4 = eq(UInt<2>("h3"), anReg) @[DisplayMultiplexer5bit.scala 32:19]
            when _T_4 : @[DisplayMultiplexer5bit.scala 32:19]
              select <= UInt<1>("h1") @[DisplayMultiplexer5bit.scala 46:16]
              node _sevSeg_T_3 = bits(io.raw, 6, 0) @[DisplayMultiplexer5bit.scala 47:25]
              sevSeg <= _sevSeg_T_3 @[DisplayMultiplexer5bit.scala 47:16]
    else :
      sevSeg <= decoder.io.out @[DisplayMultiplexer5bit.scala 51:12]
      node _T_5 = eq(UInt<1>("h0"), anReg) @[DisplayMultiplexer5bit.scala 52:19]
      when _T_5 : @[DisplayMultiplexer5bit.scala 52:19]
        select <= UInt<4>("h8") @[DisplayMultiplexer5bit.scala 54:16]
        node _decoder_io_in_T = bits(io.sum, 9, 5) @[DisplayMultiplexer5bit.scala 55:32]
        decoder.io.in <= _decoder_io_in_T @[DisplayMultiplexer5bit.scala 55:23]
      else :
        node _T_6 = eq(UInt<1>("h1"), anReg) @[DisplayMultiplexer5bit.scala 52:19]
        when _T_6 : @[DisplayMultiplexer5bit.scala 52:19]
          select <= UInt<3>("h4") @[DisplayMultiplexer5bit.scala 58:16]
          node _decoder_io_in_T_1 = bits(io.sum, 4, 0) @[DisplayMultiplexer5bit.scala 59:32]
          decoder.io.in <= _decoder_io_in_T_1 @[DisplayMultiplexer5bit.scala 59:23]
        else :
          node _T_7 = eq(UInt<2>("h2"), anReg) @[DisplayMultiplexer5bit.scala 52:19]
          when _T_7 : @[DisplayMultiplexer5bit.scala 52:19]
            select <= UInt<2>("h2") @[DisplayMultiplexer5bit.scala 62:16]
            node _decoder_io_in_T_2 = bits(io.price, 9, 5) @[DisplayMultiplexer5bit.scala 63:34]
            decoder.io.in <= _decoder_io_in_T_2 @[DisplayMultiplexer5bit.scala 63:23]
          else :
            node _T_8 = eq(UInt<2>("h3"), anReg) @[DisplayMultiplexer5bit.scala 52:19]
            when _T_8 : @[DisplayMultiplexer5bit.scala 52:19]
              select <= UInt<1>("h1") @[DisplayMultiplexer5bit.scala 66:16]
              node _decoder_io_in_T_3 = bits(io.price, 4, 0) @[DisplayMultiplexer5bit.scala 67:34]
              decoder.io.in <= _decoder_io_in_T_3 @[DisplayMultiplexer5bit.scala 67:23]
    node _io_seg_T = not(sevSeg) @[DisplayMultiplexer5bit.scala 72:13]
    io.seg <= _io_seg_T @[DisplayMultiplexer5bit.scala 72:10]
    node _io_an_T = not(select) @[DisplayMultiplexer5bit.scala 73:12]
    io.an <= _io_an_T @[DisplayMultiplexer5bit.scala 73:9]

  module DecimalSeperator :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<8>, out : UInt<8>}

    node _left_T = div(io.in, UInt<10>("ha")) @[DecimalSeperator.scala 28:22]
    node left = shl(_left_T, 5) @[DecimalSeperator.scala 28:36]
    node right = rem(io.in, UInt<10>("ha")) @[DecimalSeperator.scala 29:22]
    node _io_out_T = or(left, right) @[DecimalSeperator.scala 31:18]
    io.out <= _io_out_T @[DecimalSeperator.scala 31:10]

  module DecimalSeperator_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<8>, out : UInt<8>}

    node _left_T = div(io.in, UInt<10>("ha")) @[DecimalSeperator.scala 28:22]
    node left = shl(_left_T, 5) @[DecimalSeperator.scala 28:36]
    node right = rem(io.in, UInt<10>("ha")) @[DecimalSeperator.scala 29:22]
    node _io_out_T = or(left, right) @[DecimalSeperator.scala 31:18]
    io.out <= _io_out_T @[DecimalSeperator.scala 31:10]

  module RNG :
    input clock : Clock
    input reset : Reset
    output io : { random : UInt<4>}

    reg cnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[RNGsimple.scala 19:20]
    node _cnt_T = add(cnt, UInt<1>("h1")) @[RNGsimple.scala 20:14]
    node _cnt_T_1 = tail(_cnt_T, 1) @[RNGsimple.scala 20:14]
    cnt <= _cnt_T_1 @[RNGsimple.scala 20:7]
    node _T = eq(cnt, UInt<4>("hf")) @[RNGsimple.scala 21:12]
    when _T : @[RNGsimple.scala 21:22]
      cnt <= UInt<1>("h0") @[RNGsimple.scala 21:28]
    io.random <= cnt @[RNGsimple.scala 23:13]

  module Win :
    input clock : Clock
    input reset : Reset
    output io : { flip enable : UInt<1>, visualPoints : UInt<4>, visualBuffer : UInt<14>}

    io.visualPoints <= UInt<1>("h0") @[Win.scala 21:19]
    io.visualBuffer <= UInt<1>("h0") @[Win.scala 22:19]
    reg cnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Win.scala 24:20]
    reg clk : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Win.scala 25:20]
    when io.enable : @[Win.scala 26:19]
      node _clk_T = add(clk, UInt<1>("h1")) @[Win.scala 27:16]
      node _clk_T_1 = tail(_clk_T, 1) @[Win.scala 27:16]
      clk <= _clk_T_1 @[Win.scala 27:9]
      node _T = eq(clk, UInt<22>("h3f940a")) @[Win.scala 28:14]
      when _T : @[Win.scala 28:27]
        clk <= UInt<1>("h0") @[Win.scala 29:11]
        node _cnt_T = add(cnt, UInt<1>("h1")) @[Win.scala 30:18]
        node _cnt_T_1 = tail(_cnt_T, 1) @[Win.scala 30:18]
        cnt <= _cnt_T_1 @[Win.scala 30:11]
      node _T_1 = eq(cnt, UInt<4>("hf")) @[Win.scala 32:14]
      when _T_1 : @[Win.scala 32:24]
        cnt <= UInt<1>("h0") @[Win.scala 32:30]
    node _T_2 = eq(UInt<1>("h0"), cnt) @[Win.scala 36:15]
    when _T_2 : @[Win.scala 36:15]
      io.visualPoints <= UInt<1>("h0") @[Win.scala 37:33]
    else :
      node _T_3 = eq(UInt<1>("h1"), cnt) @[Win.scala 36:15]
      when _T_3 : @[Win.scala 36:15]
        io.visualPoints <= UInt<1>("h1") @[Win.scala 38:33]
      else :
        node _T_4 = eq(UInt<2>("h2"), cnt) @[Win.scala 36:15]
        when _T_4 : @[Win.scala 36:15]
          io.visualPoints <= UInt<2>("h2") @[Win.scala 39:33]
        else :
          node _T_5 = eq(UInt<2>("h3"), cnt) @[Win.scala 36:15]
          when _T_5 : @[Win.scala 36:15]
            io.visualPoints <= UInt<2>("h3") @[Win.scala 40:33]
          else :
            node _T_6 = eq(UInt<3>("h4"), cnt) @[Win.scala 36:15]
            when _T_6 : @[Win.scala 36:15]
              io.visualPoints <= UInt<3>("h4") @[Win.scala 41:33]
            else :
              node _T_7 = eq(UInt<3>("h5"), cnt) @[Win.scala 36:15]
              when _T_7 : @[Win.scala 36:15]
                io.visualPoints <= UInt<3>("h5") @[Win.scala 42:33]
              else :
                node _T_8 = eq(UInt<3>("h6"), cnt) @[Win.scala 36:15]
                when _T_8 : @[Win.scala 36:15]
                  io.visualPoints <= UInt<3>("h6") @[Win.scala 43:33]
                else :
                  node _T_9 = eq(UInt<3>("h7"), cnt) @[Win.scala 36:15]
                  when _T_9 : @[Win.scala 36:15]
                    io.visualPoints <= UInt<3>("h7") @[Win.scala 44:33]
                  else :
                    node _T_10 = eq(UInt<4>("h8"), cnt) @[Win.scala 36:15]
                    when _T_10 : @[Win.scala 36:15]
                      io.visualPoints <= UInt<3>("h7") @[Win.scala 45:33]
                    else :
                      node _T_11 = eq(UInt<4>("h9"), cnt) @[Win.scala 36:15]
                      when _T_11 : @[Win.scala 36:15]
                        io.visualPoints <= UInt<1>("h0") @[Win.scala 46:33]
                      else :
                        node _T_12 = eq(UInt<4>("ha"), cnt) @[Win.scala 36:15]
                        when _T_12 : @[Win.scala 36:15]
                          io.visualPoints <= UInt<3>("h7") @[Win.scala 47:33]
                        else :
                          node _T_13 = eq(UInt<4>("hb"), cnt) @[Win.scala 36:15]
                          when _T_13 : @[Win.scala 36:15]
                            io.visualPoints <= UInt<1>("h0") @[Win.scala 48:33]
                          else :
                            node _T_14 = eq(UInt<4>("hc"), cnt) @[Win.scala 36:15]
                            when _T_14 : @[Win.scala 36:15]
                              io.visualPoints <= UInt<3>("h7") @[Win.scala 49:33]
                            else :
                              node _T_15 = eq(UInt<4>("hd"), cnt) @[Win.scala 36:15]
                              when _T_15 : @[Win.scala 36:15]
                                io.visualPoints <= UInt<1>("h0") @[Win.scala 50:33]
                              else :
                                node _T_16 = eq(UInt<4>("he"), cnt) @[Win.scala 36:15]
                                when _T_16 : @[Win.scala 36:15]
                                  io.visualPoints <= UInt<3>("h7") @[Win.scala 51:33]
    node _T_17 = eq(UInt<1>("h0"), cnt) @[Win.scala 55:15]
    when _T_17 : @[Win.scala 55:15]
      io.visualBuffer <= UInt<11>("h408") @[Win.scala 56:33]
    else :
      node _T_18 = eq(UInt<1>("h1"), cnt) @[Win.scala 55:15]
      when _T_18 : @[Win.scala 55:15]
        io.visualBuffer <= UInt<11>("h408") @[Win.scala 57:33]
      else :
        node _T_19 = eq(UInt<2>("h2"), cnt) @[Win.scala 55:15]
        when _T_19 : @[Win.scala 55:15]
          io.visualBuffer <= UInt<14>("h2040") @[Win.scala 58:33]
        else :
          node _T_20 = eq(UInt<2>("h3"), cnt) @[Win.scala 55:15]
          when _T_20 : @[Win.scala 55:15]
            io.visualBuffer <= UInt<14>("h2040") @[Win.scala 59:33]
          else :
            node _T_21 = eq(UInt<3>("h4"), cnt) @[Win.scala 55:15]
            when _T_21 : @[Win.scala 55:15]
              io.visualBuffer <= UInt<8>("h81") @[Win.scala 60:33]
            else :
              node _T_22 = eq(UInt<3>("h5"), cnt) @[Win.scala 55:15]
              when _T_22 : @[Win.scala 55:15]
                io.visualBuffer <= UInt<8>("h81") @[Win.scala 61:33]
              else :
                node _T_23 = eq(UInt<3>("h6"), cnt) @[Win.scala 55:15]
                when _T_23 : @[Win.scala 55:15]
                  io.visualBuffer <= UInt<14>("h2040") @[Win.scala 62:33]
                else :
                  node _T_24 = eq(UInt<3>("h7"), cnt) @[Win.scala 55:15]
                  when _T_24 : @[Win.scala 55:15]
                    io.visualBuffer <= UInt<14>("h2040") @[Win.scala 63:33]
                  else :
                    node _T_25 = eq(UInt<4>("h8"), cnt) @[Win.scala 55:15]
                    when _T_25 : @[Win.scala 55:15]
                      io.visualBuffer <= UInt<1>("h0") @[Win.scala 64:33]
                    else :
                      node _T_26 = eq(UInt<4>("h9"), cnt) @[Win.scala 55:15]
                      when _T_26 : @[Win.scala 55:15]
                        io.visualBuffer <= UInt<11>("h408") @[Win.scala 65:33]
                      else :
                        node _T_27 = eq(UInt<4>("ha"), cnt) @[Win.scala 55:15]
                        when _T_27 : @[Win.scala 55:15]
                          io.visualBuffer <= UInt<14>("h2040") @[Win.scala 66:33]
                        else :
                          node _T_28 = eq(UInt<4>("hb"), cnt) @[Win.scala 55:15]
                          when _T_28 : @[Win.scala 55:15]
                            io.visualBuffer <= UInt<8>("h81") @[Win.scala 67:33]
                          else :
                            node _T_29 = eq(UInt<4>("hc"), cnt) @[Win.scala 55:15]
                            when _T_29 : @[Win.scala 55:15]
                              io.visualBuffer <= UInt<11>("h408") @[Win.scala 68:33]
                            else :
                              node _T_30 = eq(UInt<4>("hd"), cnt) @[Win.scala 55:15]
                              when _T_30 : @[Win.scala 55:15]
                                io.visualBuffer <= UInt<14>("h2040") @[Win.scala 69:33]
                              else :
                                node _T_31 = eq(UInt<4>("he"), cnt) @[Win.scala 55:15]
                                when _T_31 : @[Win.scala 55:15]
                                  io.visualBuffer <= UInt<8>("h81") @[Win.scala 70:33]

  module SpeedupTable :
    input clock : Clock
    input reset : Reset
    output io : { flip idx : UInt<4>, out : UInt<5>}

    io.out <= UInt<1>("h0") @[SpeedupTable.scala 15:10]
    node _T = eq(UInt<1>("h0"), io.idx) @[SpeedupTable.scala 17:18]
    when _T : @[SpeedupTable.scala 17:18]
      io.out <= UInt<1>("h0") @[SpeedupTable.scala 18:23]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.idx) @[SpeedupTable.scala 17:18]
      when _T_1 : @[SpeedupTable.scala 17:18]
        io.out <= UInt<1>("h1") @[SpeedupTable.scala 19:23]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.idx) @[SpeedupTable.scala 17:18]
        when _T_2 : @[SpeedupTable.scala 17:18]
          io.out <= UInt<1>("h1") @[SpeedupTable.scala 20:23]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.idx) @[SpeedupTable.scala 17:18]
          when _T_3 : @[SpeedupTable.scala 17:18]
            io.out <= UInt<1>("h1") @[SpeedupTable.scala 21:23]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.idx) @[SpeedupTable.scala 17:18]
            when _T_4 : @[SpeedupTable.scala 17:18]
              io.out <= UInt<1>("h1") @[SpeedupTable.scala 22:23]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.idx) @[SpeedupTable.scala 17:18]
              when _T_5 : @[SpeedupTable.scala 17:18]
                io.out <= UInt<2>("h2") @[SpeedupTable.scala 23:23]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.idx) @[SpeedupTable.scala 17:18]
                when _T_6 : @[SpeedupTable.scala 17:18]
                  io.out <= UInt<2>("h2") @[SpeedupTable.scala 24:23]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.idx) @[SpeedupTable.scala 17:18]
                  when _T_7 : @[SpeedupTable.scala 17:18]
                    io.out <= UInt<2>("h2") @[SpeedupTable.scala 25:23]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.idx) @[SpeedupTable.scala 17:18]
                    when _T_8 : @[SpeedupTable.scala 17:18]
                      io.out <= UInt<2>("h3") @[SpeedupTable.scala 26:23]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.idx) @[SpeedupTable.scala 17:18]
                      when _T_9 : @[SpeedupTable.scala 17:18]
                        io.out <= UInt<3>("h4") @[SpeedupTable.scala 27:23]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.idx) @[SpeedupTable.scala 17:18]
                        when _T_10 : @[SpeedupTable.scala 17:18]
                          io.out <= UInt<3>("h5") @[SpeedupTable.scala 28:23]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.idx) @[SpeedupTable.scala 17:18]
                          when _T_11 : @[SpeedupTable.scala 17:18]
                            io.out <= UInt<3>("h6") @[SpeedupTable.scala 29:23]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.idx) @[SpeedupTable.scala 17:18]
                            when _T_12 : @[SpeedupTable.scala 17:18]
                              io.out <= UInt<3>("h7") @[SpeedupTable.scala 30:23]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.idx) @[SpeedupTable.scala 17:18]
                              when _T_13 : @[SpeedupTable.scala 17:18]
                                io.out <= UInt<4>("h8") @[SpeedupTable.scala 31:23]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.idx) @[SpeedupTable.scala 17:18]
                                when _T_14 : @[SpeedupTable.scala 17:18]
                                  io.out <= UInt<4>("ha") @[SpeedupTable.scala 32:23]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.idx) @[SpeedupTable.scala 17:18]
                                  when _T_15 : @[SpeedupTable.scala 17:18]
                                    io.out <= UInt<4>("hc") @[SpeedupTable.scala 33:23]

  module Pong :
    input clock : Clock
    input reset : Reset
    output io : { flip p1 : UInt<1>, flip p2 : UInt<1>, flip restart : UInt<1>, p1points : UInt<7>, p2points : UInt<7>, renderMode : UInt<1>, renderOut : UInt<28>, rightOut : UInt<10>, leftOut : UInt<10>}

    io.p1points <= UInt<1>("h0") @[Pong.scala 31:15]
    io.p2points <= UInt<1>("h0") @[Pong.scala 32:15]
    reg p1pointsPersist : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Pong.scala 33:32]
    reg p2pointsPersist : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Pong.scala 34:32]
    reg p1pointsTable : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Pong.scala 35:30]
    reg p2pointsTable : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Pong.scala 36:30]
    node _T = eq(UInt<1>("h0"), p1pointsTable) @[Pong.scala 37:25]
    when _T : @[Pong.scala 37:25]
      io.p1points <= UInt<1>("h0") @[Pong.scala 38:27]
    else :
      node _T_1 = eq(UInt<1>("h1"), p1pointsTable) @[Pong.scala 37:25]
      when _T_1 : @[Pong.scala 37:25]
        io.p1points <= UInt<7>("h40") @[Pong.scala 39:27]
      else :
        node _T_2 = eq(UInt<2>("h2"), p1pointsTable) @[Pong.scala 37:25]
        when _T_2 : @[Pong.scala 37:25]
          io.p1points <= UInt<7>("h60") @[Pong.scala 40:27]
        else :
          node _T_3 = eq(UInt<2>("h3"), p1pointsTable) @[Pong.scala 37:25]
          when _T_3 : @[Pong.scala 37:25]
            io.p1points <= UInt<7>("h70") @[Pong.scala 41:27]
          else :
            node _T_4 = eq(UInt<3>("h4"), p1pointsTable) @[Pong.scala 37:25]
            when _T_4 : @[Pong.scala 37:25]
              io.p1points <= UInt<7>("h78") @[Pong.scala 42:27]
            else :
              node _T_5 = eq(UInt<3>("h5"), p1pointsTable) @[Pong.scala 37:25]
              when _T_5 : @[Pong.scala 37:25]
                io.p1points <= UInt<7>("h7c") @[Pong.scala 43:27]
              else :
                node _T_6 = eq(UInt<3>("h6"), p1pointsTable) @[Pong.scala 37:25]
                when _T_6 : @[Pong.scala 37:25]
                  io.p1points <= UInt<7>("h7e") @[Pong.scala 44:27]
                else :
                  node _T_7 = eq(UInt<3>("h7"), p1pointsTable) @[Pong.scala 37:25]
                  when _T_7 : @[Pong.scala 37:25]
                    io.p1points <= UInt<7>("h7f") @[Pong.scala 45:27]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), p1pointsTable) @[Pong.scala 37:25]
                    when _T_8 : @[Pong.scala 37:25]
                      io.p1points <= UInt<7>("h7f") @[Pong.scala 46:27]
    node _T_9 = eq(UInt<1>("h0"), p2pointsTable) @[Pong.scala 48:25]
    when _T_9 : @[Pong.scala 48:25]
      io.p2points <= UInt<1>("h0") @[Pong.scala 49:27]
    else :
      node _T_10 = eq(UInt<1>("h1"), p2pointsTable) @[Pong.scala 48:25]
      when _T_10 : @[Pong.scala 48:25]
        io.p2points <= UInt<7>("h40") @[Pong.scala 50:27]
      else :
        node _T_11 = eq(UInt<2>("h2"), p2pointsTable) @[Pong.scala 48:25]
        when _T_11 : @[Pong.scala 48:25]
          io.p2points <= UInt<7>("h60") @[Pong.scala 51:27]
        else :
          node _T_12 = eq(UInt<2>("h3"), p2pointsTable) @[Pong.scala 48:25]
          when _T_12 : @[Pong.scala 48:25]
            io.p2points <= UInt<7>("h70") @[Pong.scala 52:27]
          else :
            node _T_13 = eq(UInt<3>("h4"), p2pointsTable) @[Pong.scala 48:25]
            when _T_13 : @[Pong.scala 48:25]
              io.p2points <= UInt<7>("h78") @[Pong.scala 53:27]
            else :
              node _T_14 = eq(UInt<3>("h5"), p2pointsTable) @[Pong.scala 48:25]
              when _T_14 : @[Pong.scala 48:25]
                io.p2points <= UInt<7>("h7c") @[Pong.scala 54:27]
              else :
                node _T_15 = eq(UInt<3>("h6"), p2pointsTable) @[Pong.scala 48:25]
                when _T_15 : @[Pong.scala 48:25]
                  io.p2points <= UInt<7>("h7e") @[Pong.scala 55:27]
                else :
                  node _T_16 = eq(UInt<3>("h7"), p2pointsTable) @[Pong.scala 48:25]
                  when _T_16 : @[Pong.scala 48:25]
                    io.p2points <= UInt<7>("h7f") @[Pong.scala 56:27]
                  else :
                    node _T_17 = eq(UInt<4>("h8"), p2pointsTable) @[Pong.scala 48:25]
                    when _T_17 : @[Pong.scala 48:25]
                      io.p2points <= UInt<7>("h7f") @[Pong.scala 57:27]
    inst RNG of RNG @[Pong.scala 61:19]
    RNG.clock <= clock
    RNG.reset <= reset
    inst win of Win @[Pong.scala 62:19]
    win.clock <= clock
    win.reset <= reset
    win.io.enable <= UInt<1>("h0") @[Pong.scala 63:17]
    reg blk : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Pong.scala 65:20]
    reg blkCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Pong.scala 67:23]
    node _blkCnt_T = add(blkCnt, UInt<1>("h1")) @[Pong.scala 68:20]
    node _blkCnt_T_1 = tail(_blkCnt_T, 1) @[Pong.scala 68:20]
    blkCnt <= _blkCnt_T_1 @[Pong.scala 68:10]
    node _T_18 = eq(blkCnt, UInt<25>("h17d7840")) @[Pong.scala 69:15]
    when _T_18 : @[Pong.scala 69:31]
      blkCnt <= UInt<1>("h0") @[Pong.scala 70:12]
      blk <= UInt<1>("h0") @[Pong.scala 71:9]
    node _T_19 = eq(blkCnt, UInt<24>("hbebc20")) @[Pong.scala 73:15]
    when _T_19 : @[Pong.scala 73:35]
      blk <= UInt<1>("h1") @[Pong.scala 74:9]
    io.renderMode <= UInt<1>("h1") @[Pong.scala 77:17]
    reg buffer : UInt<28>, clock with :
      reset => (reset, UInt<28>("h0")) @[Pong.scala 79:23]
    reg bufCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Pong.scala 80:23]
    node _bufCnt_T = add(bufCnt, UInt<1>("h1")) @[Pong.scala 81:20]
    node _bufCnt_T_1 = tail(_bufCnt_T, 1) @[Pong.scala 81:20]
    bufCnt <= _bufCnt_T_1 @[Pong.scala 81:10]
    node _T_20 = eq(bufCnt, UInt<17>("h186a0")) @[Pong.scala 82:15]
    when _T_20 : @[Pong.scala 82:31]
      bufCnt <= UInt<1>("h0") @[Pong.scala 82:40]
    reg hitCnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Pong.scala 84:23]
    reg bulletCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Pong.scala 85:26]
    node _bulletCnt_T = add(bulletCnt, UInt<1>("h1")) @[Pong.scala 86:26]
    node _bulletCnt_T_1 = tail(_bulletCnt_T, 1) @[Pong.scala 86:26]
    bulletCnt <= _bulletCnt_T_1 @[Pong.scala 86:13]
    inst speedupTable of SpeedupTable @[Pong.scala 92:28]
    speedupTable.clock <= clock
    speedupTable.reset <= reset
    speedupTable.io.idx <= hitCnt @[Pong.scala 93:23]
    node _T_21 = mul(UInt<19>("h7f281"), speedupTable.io.out) @[Pong.scala 94:52]
    node _T_22 = sub(UInt<24>("hbebc20"), _T_21) @[Pong.scala 94:34]
    node _T_23 = tail(_T_22, 1) @[Pong.scala 94:34]
    node _T_24 = eq(bulletCnt, _T_23) @[Pong.scala 94:18]
    when _T_24 : @[Pong.scala 94:75]
      bulletCnt <= UInt<1>("h0") @[Pong.scala 95:15]
    reg bulletY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Pong.scala 98:24]
    reg bullet : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[Pong.scala 99:24]
    reg p1pos : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Pong.scala 100:24]
    reg p2pos : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Pong.scala 101:24]
    reg p1Trigger_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), p1Trigger_REG) @[Pong.scala 103:36]
    p1Trigger_REG <= io.p1 @[Pong.scala 103:36]
    node _p1Trigger_T = eq(p1Trigger_REG, UInt<1>("h0")) @[Pong.scala 103:28]
    node p1Trigger = and(io.p1, _p1Trigger_T) @[Pong.scala 103:25]
    reg p2Trigger_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), p2Trigger_REG) @[Pong.scala 104:36]
    p2Trigger_REG <= io.p2 @[Pong.scala 104:36]
    node _p2Trigger_T = eq(p2Trigger_REG, UInt<1>("h0")) @[Pong.scala 104:28]
    node p2Trigger = and(io.p2, _p2Trigger_T) @[Pong.scala 104:25]
    reg state : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Pong.scala 107:22]
    node _T_25 = eq(UInt<4>("h0"), state) @[Pong.scala 110:17]
    when _T_25 : @[Pong.scala 110:17]
      buffer <= UInt<1>("h0") @[Pong.scala 112:14]
      io.renderMode <= blk @[Pong.scala 113:21]
      p1pos <= UInt<1>("h0") @[Pong.scala 114:15]
      p2pos <= UInt<1>("h1") @[Pong.scala 115:15]
      p1pointsTable <= UInt<1>("h0") @[Pong.scala 116:21]
      p2pointsTable <= UInt<1>("h0") @[Pong.scala 117:21]
      p1pointsPersist <= UInt<1>("h0") @[Pong.scala 118:23]
      p2pointsPersist <= UInt<1>("h0") @[Pong.scala 119:23]
      win.io.enable <= UInt<1>("h0") @[Pong.scala 120:21]
      hitCnt <= UInt<1>("h0") @[Pong.scala 121:14]
      when io.p1 : @[Pong.scala 123:18]
        bullet <= UInt<1>("h0") @[Pong.scala 124:17]
        bulletY <= UInt<1>("h1") @[Pong.scala 125:17]
        state <= UInt<4>("h3") @[Pong.scala 126:15]
      else :
        when io.p2 : @[Pong.scala 128:24]
          bullet <= UInt<3>("h7") @[Pong.scala 129:17]
          bulletY <= UInt<1>("h0") @[Pong.scala 130:17]
          state <= UInt<4>("h4") @[Pong.scala 131:15]
    else :
      node _T_26 = eq(UInt<4>("h1"), state) @[Pong.scala 110:17]
      when _T_26 : @[Pong.scala 110:17]
        node _T_27 = eq(p1pos, bulletY) @[Pong.scala 135:18]
        when _T_27 : @[Pong.scala 135:31]
          node _T_28 = lt(hitCnt, UInt<4>("hf")) @[Pong.scala 136:21]
          when _T_28 : @[Pong.scala 136:29]
            node _hitCnt_T = add(hitCnt, UInt<1>("h1")) @[Pong.scala 136:48]
            node _hitCnt_T_1 = tail(_hitCnt_T, 1) @[Pong.scala 136:48]
            hitCnt <= _hitCnt_T_1 @[Pong.scala 136:38]
          node rnd = lt(RNG.io.random, UInt<4>("h8")) @[Pong.scala 137:33]
          node _T_29 = eq(rnd, bulletY) @[Pong.scala 138:18]
          when _T_29 : @[Pong.scala 138:31]
            node _bullet_T = add(bullet, UInt<1>("h1")) @[Pong.scala 138:50]
            node _bullet_T_1 = tail(_bullet_T, 1) @[Pong.scala 138:50]
            bullet <= _bullet_T_1 @[Pong.scala 138:40]
          node _bulletY_T = mux(rnd, UInt<1>("h1"), UInt<1>("h0")) @[Pong.scala 139:23]
          bulletY <= _bulletY_T @[Pong.scala 139:17]
          state <= UInt<4>("h3") @[Pong.scala 140:15]
        else :
          state <= UInt<4>("h6") @[Pong.scala 142:15]
      else :
        node _T_30 = eq(UInt<4>("h2"), state) @[Pong.scala 110:17]
        when _T_30 : @[Pong.scala 110:17]
          node _T_31 = eq(p2pos, bulletY) @[Pong.scala 146:18]
          when _T_31 : @[Pong.scala 146:31]
            node _T_32 = lt(hitCnt, UInt<4>("hf")) @[Pong.scala 147:21]
            when _T_32 : @[Pong.scala 147:29]
              node _hitCnt_T_2 = add(hitCnt, UInt<1>("h1")) @[Pong.scala 147:48]
              node _hitCnt_T_3 = tail(_hitCnt_T_2, 1) @[Pong.scala 147:48]
              hitCnt <= _hitCnt_T_3 @[Pong.scala 147:38]
            node rnd_1 = gt(RNG.io.random, UInt<3>("h7")) @[Pong.scala 148:33]
            node _T_33 = eq(rnd_1, bulletY) @[Pong.scala 149:18]
            when _T_33 : @[Pong.scala 149:31]
              node _bullet_T_2 = sub(bullet, UInt<1>("h1")) @[Pong.scala 149:50]
              node _bullet_T_3 = tail(_bullet_T_2, 1) @[Pong.scala 149:50]
              bullet <= _bullet_T_3 @[Pong.scala 149:40]
            node _bulletY_T_1 = mux(rnd_1, UInt<1>("h1"), UInt<1>("h0")) @[Pong.scala 150:23]
            bulletY <= _bulletY_T_1 @[Pong.scala 150:17]
            state <= UInt<4>("h4") @[Pong.scala 151:15]
          else :
            state <= UInt<4>("h5") @[Pong.scala 153:15]
        else :
          node _T_34 = eq(UInt<4>("h5"), state) @[Pong.scala 110:17]
          when _T_34 : @[Pong.scala 110:17]
            hitCnt <= UInt<1>("h0") @[Pong.scala 157:14]
            node _p1pointsPersist_T = add(p1pointsPersist, UInt<1>("h1")) @[Pong.scala 158:42]
            node _p1pointsPersist_T_1 = tail(_p1pointsPersist_T, 1) @[Pong.scala 158:42]
            p1pointsPersist <= _p1pointsPersist_T_1 @[Pong.scala 158:23]
            node _p1pointsTable_T = add(p1pointsTable, UInt<1>("h1")) @[Pong.scala 159:38]
            node _p1pointsTable_T_1 = tail(_p1pointsTable_T, 1) @[Pong.scala 159:38]
            p1pointsTable <= _p1pointsTable_T_1 @[Pong.scala 159:21]
            node _T_35 = eq(p1pointsPersist, UInt<3>("h6")) @[Pong.scala 160:28]
            when _T_35 : @[Pong.scala 160:36]
              state <= UInt<4>("h9") @[Pong.scala 161:15]
            else :
              state <= UInt<4>("h8") @[Pong.scala 162:27]
          else :
            node _T_36 = eq(UInt<4>("h6"), state) @[Pong.scala 110:17]
            when _T_36 : @[Pong.scala 110:17]
              hitCnt <= UInt<1>("h0") @[Pong.scala 165:14]
              node _p2pointsPersist_T = add(p2pointsPersist, UInt<1>("h1")) @[Pong.scala 166:42]
              node _p2pointsPersist_T_1 = tail(_p2pointsPersist_T, 1) @[Pong.scala 166:42]
              p2pointsPersist <= _p2pointsPersist_T_1 @[Pong.scala 166:23]
              node _p2pointsTable_T = add(p2pointsTable, UInt<1>("h1")) @[Pong.scala 167:38]
              node _p2pointsTable_T_1 = tail(_p2pointsTable_T, 1) @[Pong.scala 167:38]
              p2pointsTable <= _p2pointsTable_T_1 @[Pong.scala 167:21]
              node _T_37 = eq(p2pointsPersist, UInt<3>("h6")) @[Pong.scala 168:28]
              when _T_37 : @[Pong.scala 168:36]
                state <= UInt<4>("ha") @[Pong.scala 169:15]
              else :
                state <= UInt<4>("h7") @[Pong.scala 170:27]
            else :
              node _T_38 = eq(UInt<4>("h7"), state) @[Pong.scala 110:17]
              when _T_38 : @[Pong.scala 110:17]
                when p1Trigger : @[Pong.scala 172:35]
                  state <= UInt<4>("h3") @[Pong.scala 172:43]
              else :
                node _T_39 = eq(UInt<4>("h8"), state) @[Pong.scala 110:17]
                when _T_39 : @[Pong.scala 110:17]
                  when p2Trigger : @[Pong.scala 173:35]
                    state <= UInt<4>("h4") @[Pong.scala 173:43]
                else :
                  node _T_40 = eq(UInt<4>("h3"), state) @[Pong.scala 110:17]
                  when _T_40 : @[Pong.scala 110:17]
                    node _T_41 = lt(bullet, UInt<3>("h7")) @[Pong.scala 175:19]
                    when _T_41 : @[Pong.scala 175:26]
                      node _T_42 = eq(bulletCnt, UInt<1>("h0")) @[Pong.scala 176:24]
                      when _T_42 : @[Pong.scala 176:33]
                        node _bullet_T_4 = add(bullet, UInt<1>("h1")) @[Pong.scala 177:28]
                        node _bullet_T_5 = tail(_bullet_T_4, 1) @[Pong.scala 177:28]
                        bullet <= _bullet_T_5 @[Pong.scala 177:18]
                    else :
                      state <= UInt<4>("h2") @[Pong.scala 179:28]
                  else :
                    node _T_43 = eq(UInt<4>("h4"), state) @[Pong.scala 110:17]
                    when _T_43 : @[Pong.scala 110:17]
                      node _T_44 = gt(bullet, UInt<1>("h0")) @[Pong.scala 182:19]
                      when _T_44 : @[Pong.scala 182:26]
                        node _T_45 = eq(bulletCnt, UInt<1>("h0")) @[Pong.scala 183:24]
                        when _T_45 : @[Pong.scala 183:33]
                          node _bullet_T_6 = sub(bullet, UInt<1>("h1")) @[Pong.scala 184:28]
                          node _bullet_T_7 = tail(_bullet_T_6, 1) @[Pong.scala 184:28]
                          bullet <= _bullet_T_7 @[Pong.scala 184:18]
                      else :
                        state <= UInt<4>("h1") @[Pong.scala 186:28]
                    else :
                      node _T_46 = eq(UInt<4>("h9"), state) @[Pong.scala 110:17]
                      when _T_46 : @[Pong.scala 110:17]
                        when p1Trigger : @[Pong.scala 189:23]
                          state <= UInt<4>("h0") @[Pong.scala 189:31]
                        win.io.enable <= UInt<1>("h1") @[Pong.scala 190:21]
                        p1pointsTable <= win.io.visualPoints @[Pong.scala 191:21]
                        node _buffer_T = shl(win.io.visualBuffer, 14) @[Pong.scala 192:44]
                        buffer <= _buffer_T @[Pong.scala 192:21]
                      else :
                        node _T_47 = eq(UInt<4>("ha"), state) @[Pong.scala 110:17]
                        when _T_47 : @[Pong.scala 110:17]
                          when p2Trigger : @[Pong.scala 195:23]
                            state <= UInt<4>("h0") @[Pong.scala 195:31]
                          win.io.enable <= UInt<1>("h1") @[Pong.scala 196:21]
                          p2pointsTable <= win.io.visualPoints @[Pong.scala 197:21]
                          buffer <= win.io.visualBuffer @[Pong.scala 198:21]
    node _T_48 = neq(state, UInt<4>("h0")) @[Pong.scala 202:14]
    when _T_48 : @[Pong.scala 202:24]
      when io.restart : @[Pong.scala 203:22]
        state <= UInt<4>("h0") @[Pong.scala 203:30]
      when p1Trigger : @[Pong.scala 206:21]
        node _p1pos_T = not(p1pos) @[Pong.scala 206:32]
        p1pos <= _p1pos_T @[Pong.scala 206:29]
      when p2Trigger : @[Pong.scala 207:21]
        node _p2pos_T = not(p2pos) @[Pong.scala 207:32]
        p2pos <= _p2pos_T @[Pong.scala 207:29]
      node _T_49 = div(UInt<17>("h186a0"), UInt<3>("h4")) @[Pong.scala 210:32]
      node _T_50 = eq(bufCnt, _T_49) @[Pong.scala 210:17]
      when _T_50 : @[Pong.scala 210:39]
        node _T_51 = eq(bulletY, UInt<1>("h0")) @[Pong.scala 211:20]
        when _T_51 : @[Pong.scala 211:29]
          node _T_52 = eq(UInt<1>("h0"), bullet) @[Pong.scala 212:24]
          when _T_52 : @[Pong.scala 212:24]
            node _buffer_T_1 = shl(UInt<28>("h8"), 21) @[Pong.scala 213:50]
            node _buffer_T_2 = or(_buffer_T_1, UInt<1>("h0")) @[Pong.scala 213:56]
            buffer <= _buffer_T_2 @[Pong.scala 213:28]
          else :
            node _T_53 = eq(UInt<1>("h1"), bullet) @[Pong.scala 212:24]
            when _T_53 : @[Pong.scala 212:24]
              node _buffer_T_3 = shl(UInt<28>("h8"), 21) @[Pong.scala 214:50]
              node _buffer_T_4 = or(_buffer_T_3, UInt<1>("h0")) @[Pong.scala 214:56]
              buffer <= _buffer_T_4 @[Pong.scala 214:28]
            else :
              node _T_54 = eq(UInt<2>("h2"), bullet) @[Pong.scala 212:24]
              when _T_54 : @[Pong.scala 212:24]
                node _buffer_T_5 = shl(UInt<28>("h8"), 14) @[Pong.scala 215:50]
                node _buffer_T_6 = or(_buffer_T_5, UInt<1>("h0")) @[Pong.scala 215:56]
                buffer <= _buffer_T_6 @[Pong.scala 215:28]
              else :
                node _T_55 = eq(UInt<2>("h3"), bullet) @[Pong.scala 212:24]
                when _T_55 : @[Pong.scala 212:24]
                  node _buffer_T_7 = shl(UInt<28>("h8"), 14) @[Pong.scala 216:50]
                  node _buffer_T_8 = or(_buffer_T_7, UInt<1>("h0")) @[Pong.scala 216:56]
                  buffer <= _buffer_T_8 @[Pong.scala 216:28]
                else :
                  node _T_56 = eq(UInt<3>("h4"), bullet) @[Pong.scala 212:24]
                  when _T_56 : @[Pong.scala 212:24]
                    node _buffer_T_9 = shl(UInt<28>("h8"), 7) @[Pong.scala 217:50]
                    node _buffer_T_10 = or(_buffer_T_9, UInt<1>("h0")) @[Pong.scala 217:56]
                    buffer <= _buffer_T_10 @[Pong.scala 217:28]
                  else :
                    node _T_57 = eq(UInt<3>("h5"), bullet) @[Pong.scala 212:24]
                    when _T_57 : @[Pong.scala 212:24]
                      node _buffer_T_11 = shl(UInt<28>("h8"), 7) @[Pong.scala 218:50]
                      node _buffer_T_12 = or(_buffer_T_11, UInt<1>("h0")) @[Pong.scala 218:56]
                      buffer <= _buffer_T_12 @[Pong.scala 218:28]
                    else :
                      node _T_58 = eq(UInt<3>("h6"), bullet) @[Pong.scala 212:24]
                      when _T_58 : @[Pong.scala 212:24]
                        buffer <= UInt<28>("h8") @[Pong.scala 219:28]
                      else :
                        node _T_59 = eq(UInt<3>("h7"), bullet) @[Pong.scala 212:24]
                        when _T_59 : @[Pong.scala 212:24]
                          buffer <= UInt<28>("h8") @[Pong.scala 220:28]
        node _T_60 = eq(bulletY, UInt<1>("h1")) @[Pong.scala 223:20]
        when _T_60 : @[Pong.scala 223:29]
          node _T_61 = eq(UInt<1>("h0"), bullet) @[Pong.scala 224:24]
          when _T_61 : @[Pong.scala 224:24]
            node _buffer_T_13 = shl(UInt<28>("h1"), 21) @[Pong.scala 225:50]
            node _buffer_T_14 = or(_buffer_T_13, UInt<1>("h0")) @[Pong.scala 225:56]
            buffer <= _buffer_T_14 @[Pong.scala 225:28]
          else :
            node _T_62 = eq(UInt<1>("h1"), bullet) @[Pong.scala 224:24]
            when _T_62 : @[Pong.scala 224:24]
              node _buffer_T_15 = shl(UInt<28>("h1"), 21) @[Pong.scala 226:50]
              node _buffer_T_16 = or(_buffer_T_15, UInt<1>("h0")) @[Pong.scala 226:56]
              buffer <= _buffer_T_16 @[Pong.scala 226:28]
            else :
              node _T_63 = eq(UInt<2>("h2"), bullet) @[Pong.scala 224:24]
              when _T_63 : @[Pong.scala 224:24]
                node _buffer_T_17 = shl(UInt<28>("h1"), 14) @[Pong.scala 227:50]
                node _buffer_T_18 = or(_buffer_T_17, UInt<1>("h0")) @[Pong.scala 227:56]
                buffer <= _buffer_T_18 @[Pong.scala 227:28]
              else :
                node _T_64 = eq(UInt<2>("h3"), bullet) @[Pong.scala 224:24]
                when _T_64 : @[Pong.scala 224:24]
                  node _buffer_T_19 = shl(UInt<28>("h1"), 14) @[Pong.scala 228:50]
                  node _buffer_T_20 = or(_buffer_T_19, UInt<1>("h0")) @[Pong.scala 228:56]
                  buffer <= _buffer_T_20 @[Pong.scala 228:28]
                else :
                  node _T_65 = eq(UInt<3>("h4"), bullet) @[Pong.scala 224:24]
                  when _T_65 : @[Pong.scala 224:24]
                    node _buffer_T_21 = shl(UInt<28>("h1"), 7) @[Pong.scala 229:50]
                    node _buffer_T_22 = or(_buffer_T_21, UInt<1>("h0")) @[Pong.scala 229:56]
                    buffer <= _buffer_T_22 @[Pong.scala 229:28]
                  else :
                    node _T_66 = eq(UInt<3>("h5"), bullet) @[Pong.scala 224:24]
                    when _T_66 : @[Pong.scala 224:24]
                      node _buffer_T_23 = shl(UInt<28>("h1"), 7) @[Pong.scala 230:50]
                      node _buffer_T_24 = or(_buffer_T_23, UInt<1>("h0")) @[Pong.scala 230:56]
                      buffer <= _buffer_T_24 @[Pong.scala 230:28]
                    else :
                      node _T_67 = eq(UInt<3>("h6"), bullet) @[Pong.scala 224:24]
                      when _T_67 : @[Pong.scala 224:24]
                        buffer <= UInt<28>("h1") @[Pong.scala 231:28]
                      else :
                        node _T_68 = eq(UInt<3>("h7"), bullet) @[Pong.scala 224:24]
                        when _T_68 : @[Pong.scala 224:24]
                          buffer <= UInt<28>("h1") @[Pong.scala 232:28]
      node _T_69 = div(UInt<17>("h186a0"), UInt<3>("h4")) @[Pong.scala 236:33]
      node _T_70 = mul(_T_69, UInt<2>("h2")) @[Pong.scala 236:40]
      node _T_71 = eq(bufCnt, _T_70) @[Pong.scala 236:17]
      when _T_71 : @[Pong.scala 236:47]
        node _T_72 = eq(UInt<1>("h0"), p1pos) @[Pong.scala 237:21]
        when _T_72 : @[Pong.scala 237:21]
          node _buffer_T_25 = shl(UInt<5>("h10"), 21) @[Pong.scala 238:51]
          node _buffer_T_26 = or(buffer, _buffer_T_25) @[Pong.scala 238:36]
          node _buffer_T_27 = or(_buffer_T_26, UInt<1>("h0")) @[Pong.scala 238:57]
          buffer <= _buffer_T_27 @[Pong.scala 238:26]
        else :
          node _T_73 = eq(UInt<1>("h1"), p1pos) @[Pong.scala 237:21]
          when _T_73 : @[Pong.scala 237:21]
            node _buffer_T_28 = shl(UInt<6>("h20"), 21) @[Pong.scala 239:51]
            node _buffer_T_29 = or(buffer, _buffer_T_28) @[Pong.scala 239:36]
            node _buffer_T_30 = or(_buffer_T_29, UInt<1>("h0")) @[Pong.scala 239:57]
            buffer <= _buffer_T_30 @[Pong.scala 239:26]
      node _T_74 = div(UInt<17>("h186a0"), UInt<3>("h4")) @[Pong.scala 242:33]
      node _T_75 = mul(_T_74, UInt<2>("h3")) @[Pong.scala 242:40]
      node _T_76 = eq(bufCnt, _T_75) @[Pong.scala 242:17]
      when _T_76 : @[Pong.scala 242:47]
        node _T_77 = eq(UInt<1>("h0"), p2pos) @[Pong.scala 243:21]
        when _T_77 : @[Pong.scala 243:21]
          node _buffer_T_31 = or(buffer, UInt<3>("h4")) @[Pong.scala 244:36]
          node _buffer_T_32 = or(_buffer_T_31, UInt<1>("h0")) @[Pong.scala 244:51]
          buffer <= _buffer_T_32 @[Pong.scala 244:26]
        else :
          node _T_78 = eq(UInt<1>("h1"), p2pos) @[Pong.scala 243:21]
          when _T_78 : @[Pong.scala 243:21]
            node _buffer_T_33 = or(buffer, UInt<2>("h2")) @[Pong.scala 245:36]
            node _buffer_T_34 = or(_buffer_T_33, UInt<1>("h0")) @[Pong.scala 245:51]
            buffer <= _buffer_T_34 @[Pong.scala 245:26]
    io.renderOut <= buffer @[Pong.scala 250:16]
    node _io_leftOut_T = shl(UInt<5>("h19"), 5) @[Pong.scala 251:30]
    node _io_leftOut_T_1 = or(_io_leftOut_T, UInt<1>("h0")) @[Pong.scala 251:36]
    io.leftOut <= _io_leftOut_T_1 @[Pong.scala 251:16]
    node _io_rightOut_T = shl(UInt<5>("h18"), 5) @[Pong.scala 252:30]
    node _io_rightOut_T_1 = or(_io_rightOut_T, UInt<5>("h13")) @[Pong.scala 252:36]
    io.rightOut <= _io_rightOut_T_1 @[Pong.scala 252:16]

  module VendingMachine :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip pongMode : UInt<1>, flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, flip p1 : UInt<1>, flip p2 : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>, p2LED1 : UInt<1>, p2LED2 : UInt<1>, p2LED3 : UInt<1>, p2LED4 : UInt<1>, p2LED5 : UInt<1>, p2LED6 : UInt<1>, p2LED7 : UInt<1>, p1LED1 : UInt<1>, p1LED2 : UInt<1>, p1LED3 : UInt<1>, p1LED4 : UInt<1>, p1LED5 : UInt<1>, p1LED6 : UInt<1>, p1LED7 : UInt<1>}

    inst IoSync of IoSync @[VendingMachine.scala 42:22]
    IoSync.clock <= clock
    IoSync.reset <= reset
    IoSync.io.buy <= io.buy @[VendingMachine.scala 43:17]
    IoSync.io.coin2 <= io.coin2 @[VendingMachine.scala 44:19]
    IoSync.io.coin5 <= io.coin5 @[VendingMachine.scala 45:19]
    IoSync.io.p1 <= io.p1 @[VendingMachine.scala 46:16]
    IoSync.io.p2 <= io.p2 @[VendingMachine.scala 47:16]
    inst FSM of FSM @[VendingMachine.scala 49:19]
    FSM.clock <= clock
    FSM.reset <= reset
    FSM.io.buy <= IoSync.io.s_buy @[VendingMachine.scala 50:14]
    FSM.io.coin2 <= IoSync.io.s_coin2 @[VendingMachine.scala 51:16]
    FSM.io.coin5 <= IoSync.io.s_coin5 @[VendingMachine.scala 52:16]
    io.releaseCan <= FSM.io.releaseCan @[VendingMachine.scala 53:17]
    io.alarm <= FSM.io.alarm @[VendingMachine.scala 54:12]
    inst DP of Datapath @[VendingMachine.scala 56:18]
    DP.clock <= clock
    DP.reset <= reset
    DP.io.price <= io.price @[VendingMachine.scala 57:15]
    DP.io.add2 <= FSM.io.add2 @[VendingMachine.scala 58:14]
    DP.io.add5 <= FSM.io.add5 @[VendingMachine.scala 59:14]
    DP.io.subPrice <= FSM.io.subPrice @[VendingMachine.scala 61:18]
    FSM.io.buyCheck <= DP.io.buyCheck @[VendingMachine.scala 63:19]
    inst display of DisplayMultiplexer5bit @[VendingMachine.scala 65:23]
    display.clock <= clock
    display.reset <= reset
    inst seperator1 of DecimalSeperator @[VendingMachine.scala 66:26]
    seperator1.clock <= clock
    seperator1.reset <= reset
    inst seperator2 of DecimalSeperator_1 @[VendingMachine.scala 67:26]
    seperator2.clock <= clock
    seperator2.reset <= reset
    seperator1.io.in <= DP.io.sum @[VendingMachine.scala 68:20]
    seperator2.io.in <= io.price @[VendingMachine.scala 69:20]
    inst pong of Pong @[VendingMachine.scala 71:20]
    pong.clock <= clock
    pong.reset <= reset
    pong.io.p1 <= IoSync.io.s_p1 @[VendingMachine.scala 72:14]
    pong.io.p2 <= IoSync.io.s_p2 @[VendingMachine.scala 73:14]
    node _pong_io_restart_T = not(io.pongMode) @[VendingMachine.scala 74:22]
    pong.io.restart <= _pong_io_restart_T @[VendingMachine.scala 74:19]
    node _display_io_rawEnable_T = and(io.pongMode, pong.io.renderMode) @[VendingMachine.scala 75:39]
    display.io.rawEnable <= _display_io_rawEnable_T @[VendingMachine.scala 75:24]
    display.io.raw <= pong.io.renderOut @[VendingMachine.scala 76:18]
    when io.pongMode : @[VendingMachine.scala 78:21]
      display.io.sum <= pong.io.leftOut @[VendingMachine.scala 79:22]
      display.io.price <= pong.io.rightOut @[VendingMachine.scala 80:22]
    else :
      display.io.sum <= seperator1.io.out @[VendingMachine.scala 82:22]
      display.io.price <= seperator2.io.out @[VendingMachine.scala 83:22]
    node _io_p2LED1_T = bits(pong.io.p2points, 6, 6) @[VendingMachine.scala 87:32]
    io.p2LED1 <= _io_p2LED1_T @[VendingMachine.scala 87:13]
    node _io_p2LED2_T = bits(pong.io.p2points, 5, 5) @[VendingMachine.scala 88:32]
    io.p2LED2 <= _io_p2LED2_T @[VendingMachine.scala 88:13]
    node _io_p2LED3_T = bits(pong.io.p2points, 4, 4) @[VendingMachine.scala 89:32]
    io.p2LED3 <= _io_p2LED3_T @[VendingMachine.scala 89:13]
    node _io_p2LED4_T = bits(pong.io.p2points, 3, 3) @[VendingMachine.scala 90:32]
    io.p2LED4 <= _io_p2LED4_T @[VendingMachine.scala 90:13]
    node _io_p2LED5_T = bits(pong.io.p2points, 2, 2) @[VendingMachine.scala 91:32]
    io.p2LED5 <= _io_p2LED5_T @[VendingMachine.scala 91:13]
    node _io_p2LED6_T = bits(pong.io.p2points, 1, 1) @[VendingMachine.scala 92:32]
    io.p2LED6 <= _io_p2LED6_T @[VendingMachine.scala 92:13]
    node _io_p2LED7_T = bits(pong.io.p2points, 0, 0) @[VendingMachine.scala 93:32]
    io.p2LED7 <= _io_p2LED7_T @[VendingMachine.scala 93:13]
    node _io_p1LED1_T = bits(pong.io.p1points, 6, 6) @[VendingMachine.scala 94:32]
    io.p1LED1 <= _io_p1LED1_T @[VendingMachine.scala 94:13]
    node _io_p1LED2_T = bits(pong.io.p1points, 5, 5) @[VendingMachine.scala 95:32]
    io.p1LED2 <= _io_p1LED2_T @[VendingMachine.scala 95:13]
    node _io_p1LED3_T = bits(pong.io.p1points, 4, 4) @[VendingMachine.scala 96:32]
    io.p1LED3 <= _io_p1LED3_T @[VendingMachine.scala 96:13]
    node _io_p1LED4_T = bits(pong.io.p1points, 3, 3) @[VendingMachine.scala 97:32]
    io.p1LED4 <= _io_p1LED4_T @[VendingMachine.scala 97:13]
    node _io_p1LED5_T = bits(pong.io.p1points, 2, 2) @[VendingMachine.scala 98:32]
    io.p1LED5 <= _io_p1LED5_T @[VendingMachine.scala 98:13]
    node _io_p1LED6_T = bits(pong.io.p1points, 1, 1) @[VendingMachine.scala 99:32]
    io.p1LED6 <= _io_p1LED6_T @[VendingMachine.scala 99:13]
    node _io_p1LED7_T = bits(pong.io.p1points, 0, 0) @[VendingMachine.scala 100:32]
    io.p1LED7 <= _io_p1LED7_T @[VendingMachine.scala 100:13]
    io.seg <= display.io.seg @[VendingMachine.scala 103:10]
    io.an <= display.io.an @[VendingMachine.scala 104:9]

