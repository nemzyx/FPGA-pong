import CharMap.{CHAR}
import chisel3._
import chisel3.util._

class SevenSegDec extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(5.W))
    val out = Output(UInt(7.W))
  })

  val sevSeg = WireDefault(0.U)

  // io.in -> 5 bit, 32 capacity
  switch(io.in) {
    is(0.U)  { sevSeg := "b0111111".U } // CHAR('0'), CHAR('O')
    is(1.U)  { sevSeg := "b0000110".U } // CHAR('1'), CHAR('I'), CHAR('i')
    is(2.U)  { sevSeg := "b1011011".U } // CHAR('2'), CHAR('Z'), CHAR('z')
    is(3.U)  { sevSeg := "b1001111".U } // CHAR('3')
    is(4.U)  { sevSeg := "b1100110".U } // CHAR('4')
    is(5.U)  { sevSeg := "b1101101".U } // CHAR('5'), CHAR('S'), CHAR('s')
    is(6.U)  { sevSeg := "b1111101".U } // CHAR('6')
    is(7.U)  { sevSeg := "b0000111".U } // CHAR('7')
    is(8.U)  { sevSeg := "b1111111".U } // CHAR('8'), CHAR('B')
    is(9.U)  { sevSeg := "b1101111".U } // CHAR('9'), CHAR('g')
    is(10.U) { sevSeg := "b1110111".U } // CHAR('A'), CHAR('a')
    is(11.U) { sevSeg := "b1111100".U } // CHAR('b')
    is(12.U) { sevSeg := "b1011000".U } // CHAR('c')
    is(13.U) { sevSeg := "b1011110".U } // CHAR('d'), CHAR('D')
    is(14.U) { sevSeg := "b1111001".U } // CHAR('E'), CHAR('e')
    is(15.U) { sevSeg := "b1110001".U } // CHAR('F'), CHAR('f')
    is(16.U) { sevSeg := "b1110110".U } // CHAR('H'), CHAR('X'), CHAR('x')
    is(17.U) { sevSeg := "b0111001".U } // CHAR('C'), CHAR('('), CHAR('[')
    is(18.U) { sevSeg := "b0001111".U } // CHAR(')'), CHAR(']')
    is(19.U) { sevSeg := "b0111101".U } // CHAR('G')
    is(20.U) { sevSeg := "b0011110".U } // CHAR('J'), CHAR('j')
    is(21.U) { sevSeg := "b1110101".U } // CHAR('K'), CHAR('k')
    is(22.U) { sevSeg := "b0111000".U } // CHAR('L'), CHAR('l')
    is(23.U) { sevSeg := "b0010101".U } // CHAR('M'), CHAR('m')
    is(24.U) { sevSeg := "b0110111".U } // CHAR('N'), CHAR('n')
    is(25.U) { sevSeg := "b1110011".U } // CHAR('P'), CHAR('p')
    is(26.U) { sevSeg := "b1100111".U } // CHAR('Q'), CHAR('q')
    is(27.U) { sevSeg := "b0110011".U } // CHAR('R'), CHAR('r')
    is(28.U) { sevSeg := "b1111000".U } // CHAR('T'), CHAR('t')
    is(29.U) { sevSeg := "b0111110".U } // CHAR('U'), CHAR('u')
    is(30.U) { sevSeg := "b0011100".U } // CHAR('V'), CHAR('v')
    is(31.U) { sevSeg := "b1011100".U } // CHAR('o')
  }

  io.out := sevSeg
}
