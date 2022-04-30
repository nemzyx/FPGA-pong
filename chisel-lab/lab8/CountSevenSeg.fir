circuit CountSevenSeg :
  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    wire sevSeg : UInt
    sevSeg <= UInt<1>("h0")
    node _T = eq(UInt<1>("h0"), io.in) @[SevenSegDec.scala 13:17]
    when _T : @[SevenSegDec.scala 13:17]
      sevSeg <= UInt<6>("h3f") @[SevenSegDec.scala 15:14]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[SevenSegDec.scala 13:17]
      when _T_1 : @[SevenSegDec.scala 13:17]
        sevSeg <= UInt<3>("h6") @[SevenSegDec.scala 18:14]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[SevenSegDec.scala 13:17]
        when _T_2 : @[SevenSegDec.scala 13:17]
          sevSeg <= UInt<7>("h5b") @[SevenSegDec.scala 21:14]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[SevenSegDec.scala 13:17]
          when _T_3 : @[SevenSegDec.scala 13:17]
            sevSeg <= UInt<7>("h4f") @[SevenSegDec.scala 24:14]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[SevenSegDec.scala 13:17]
            when _T_4 : @[SevenSegDec.scala 13:17]
              sevSeg <= UInt<7>("h66") @[SevenSegDec.scala 27:14]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[SevenSegDec.scala 13:17]
              when _T_5 : @[SevenSegDec.scala 13:17]
                sevSeg <= UInt<7>("h6d") @[SevenSegDec.scala 30:14]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[SevenSegDec.scala 13:17]
                when _T_6 : @[SevenSegDec.scala 13:17]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDec.scala 33:14]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[SevenSegDec.scala 13:17]
                  when _T_7 : @[SevenSegDec.scala 13:17]
                    sevSeg <= UInt<3>("h7") @[SevenSegDec.scala 36:14]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[SevenSegDec.scala 13:17]
                    when _T_8 : @[SevenSegDec.scala 13:17]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDec.scala 39:14]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[SevenSegDec.scala 13:17]
                      when _T_9 : @[SevenSegDec.scala 13:17]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDec.scala 42:14]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[SevenSegDec.scala 13:17]
                        when _T_10 : @[SevenSegDec.scala 13:17]
                          sevSeg <= UInt<7>("h77") @[SevenSegDec.scala 47:14]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[SevenSegDec.scala 13:17]
                          when _T_11 : @[SevenSegDec.scala 13:17]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDec.scala 50:14]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[SevenSegDec.scala 13:17]
                            when _T_12 : @[SevenSegDec.scala 13:17]
                              sevSeg <= UInt<7>("h58") @[SevenSegDec.scala 53:14]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[SevenSegDec.scala 13:17]
                              when _T_13 : @[SevenSegDec.scala 13:17]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDec.scala 56:14]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[SevenSegDec.scala 13:17]
                                when _T_14 : @[SevenSegDec.scala 13:17]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDec.scala 59:14]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[SevenSegDec.scala 13:17]
                                  when _T_15 : @[SevenSegDec.scala 13:17]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDec.scala 62:14]
    io.out <= sevSeg @[SevenSegDec.scala 66:10]

  module CountSevenSeg :
    input clock : Clock
    input reset : UInt<1>
    output io : { seg : UInt<7>, an : UInt<4>}

    wire sevSeg : UInt<7>
    sevSeg <= UInt<7>("h7f")
    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[CountSevenSeg.scala 15:23]
    reg segReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[CountSevenSeg.scala 16:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[CountSevenSeg.scala 18:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[CountSevenSeg.scala 18:20]
    cntReg <= _cntReg_T_1 @[CountSevenSeg.scala 18:10]
    node _T = eq(cntReg, UInt<26>("h2faf07f")) @[CountSevenSeg.scala 19:15]
    when _T : @[CountSevenSeg.scala 19:28]
      cntReg <= UInt<1>("h0") @[CountSevenSeg.scala 20:12]
      node _segReg_T = add(segReg, UInt<1>("h1")) @[CountSevenSeg.scala 21:22]
      node _segReg_T_1 = tail(_segReg_T, 1) @[CountSevenSeg.scala 21:22]
      segReg <= _segReg_T_1 @[CountSevenSeg.scala 21:12]
    node _T_1 = eq(segReg, UInt<5>("h10")) @[CountSevenSeg.scala 24:16]
    when _T_1 : @[CountSevenSeg.scala 24:26]
      segReg <= UInt<4>("h0") @[CountSevenSeg.scala 25:12]
    inst segDec of SevenSegDec @[CountSevenSeg.scala 29:22]
    segDec.clock <= clock
    segDec.reset <= reset
    segDec.io.in <= segReg @[CountSevenSeg.scala 30:16]
    sevSeg <= segDec.io.out @[CountSevenSeg.scala 31:10]
    node _io_seg_T = not(sevSeg) @[CountSevenSeg.scala 35:13]
    io.seg <= _io_seg_T @[CountSevenSeg.scala 35:10]
    io.an <= UInt<1>("h0") @[CountSevenSeg.scala 36:9]

