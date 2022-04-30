circuit SevenSegDecoder :
  module SevenSegDecoder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sw : UInt<4>, seg : UInt<7>, an : UInt<4>}

    wire sevSeg : UInt<7>
    sevSeg <= UInt<7>("h0")
    node _T = eq(UInt<1>("h0"), io.sw) @[SevenSegDecoder.scala 14:17]
    when _T : @[SevenSegDecoder.scala 14:17]
      sevSeg <= UInt<6>("h3f") @[SevenSegDecoder.scala 16:14]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.sw) @[SevenSegDecoder.scala 14:17]
      when _T_1 : @[SevenSegDecoder.scala 14:17]
        sevSeg <= UInt<3>("h6") @[SevenSegDecoder.scala 19:14]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.sw) @[SevenSegDecoder.scala 14:17]
        when _T_2 : @[SevenSegDecoder.scala 14:17]
          sevSeg <= UInt<7>("h5b") @[SevenSegDecoder.scala 22:14]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.sw) @[SevenSegDecoder.scala 14:17]
          when _T_3 : @[SevenSegDecoder.scala 14:17]
            sevSeg <= UInt<7>("h4f") @[SevenSegDecoder.scala 25:14]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.sw) @[SevenSegDecoder.scala 14:17]
            when _T_4 : @[SevenSegDecoder.scala 14:17]
              sevSeg <= UInt<7>("h66") @[SevenSegDecoder.scala 28:14]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.sw) @[SevenSegDecoder.scala 14:17]
              when _T_5 : @[SevenSegDecoder.scala 14:17]
                sevSeg <= UInt<7>("h6d") @[SevenSegDecoder.scala 31:14]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.sw) @[SevenSegDecoder.scala 14:17]
                when _T_6 : @[SevenSegDecoder.scala 14:17]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDecoder.scala 34:14]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.sw) @[SevenSegDecoder.scala 14:17]
                  when _T_7 : @[SevenSegDecoder.scala 14:17]
                    sevSeg <= UInt<3>("h7") @[SevenSegDecoder.scala 37:14]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.sw) @[SevenSegDecoder.scala 14:17]
                    when _T_8 : @[SevenSegDecoder.scala 14:17]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDecoder.scala 40:14]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.sw) @[SevenSegDecoder.scala 14:17]
                      when _T_9 : @[SevenSegDecoder.scala 14:17]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDecoder.scala 43:14]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.sw) @[SevenSegDecoder.scala 14:17]
                        when _T_10 : @[SevenSegDecoder.scala 14:17]
                          sevSeg <= UInt<7>("h77") @[SevenSegDecoder.scala 48:14]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.sw) @[SevenSegDecoder.scala 14:17]
                          when _T_11 : @[SevenSegDecoder.scala 14:17]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDecoder.scala 51:14]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.sw) @[SevenSegDecoder.scala 14:17]
                            when _T_12 : @[SevenSegDecoder.scala 14:17]
                              sevSeg <= UInt<7>("h58") @[SevenSegDecoder.scala 54:14]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.sw) @[SevenSegDecoder.scala 14:17]
                              when _T_13 : @[SevenSegDecoder.scala 14:17]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDecoder.scala 57:14]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.sw) @[SevenSegDecoder.scala 14:17]
                                when _T_14 : @[SevenSegDecoder.scala 14:17]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDecoder.scala 60:14]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.sw) @[SevenSegDecoder.scala 14:17]
                                  when _T_15 : @[SevenSegDecoder.scala 14:17]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDecoder.scala 63:14]
    node _io_seg_T = not(sevSeg) @[SevenSegDecoder.scala 68:13]
    io.seg <= _io_seg_T @[SevenSegDecoder.scala 68:10]
    io.an <= UInt<4>("he") @[SevenSegDecoder.scala 69:9]

