import chisel3._
import chisel3.util._

class SevenSegDec extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(4.W))
    val out = Output(UInt(7.W))
  })

  val sevSeg = WireDefault(0.U)

  // *** add your table from Lab 5 here or use the version from Lab 6.

  /* switch(io.in) {
    is("b0000".U) { // 0
      sevSeg := "b0111111".U
    }
    is("b0001".U) { // ...
      sevSeg := "b0000110".U
    }
    is("b0010".U) {
      sevSeg := "b1011011".U
    }
    is("b0011".U) {
      sevSeg := "b1001111".U
    }
    is("b0100".U) {
      sevSeg := "b1100110".U
    }
    is("b0101".U) {
      sevSeg := "b1101101".U
    }
    is("b0110".U) {
      sevSeg := "b1111101".U
    }
    is("b0111".U) {
      sevSeg := "b0000111".U
    }
    is("b1000".U) {
      sevSeg := "b1111111".U
    }
    is("b1001".U) {
      sevSeg := "b1101111".U
    }
    // NUMBERS DONE!!!!!
    // TIME FOR LETTERS!
    is("b1010".U) { // A
      sevSeg := "b1110111".U
    }
    is("b1011".U) { // b
      sevSeg := "b1111100".U
    }
    is("b1100".U) { // c
      sevSeg := "b1011000".U
    }
    is("b1101".U) { // d
      sevSeg := "b1011110".U
    }
    is("b1110".U) { // E
      sevSeg := "b1111001".U
    }
    is("b1111".U) { // F
      sevSeg := "b1110001".U
    }
  } */

  // Silas kode her:
  switch(io.in){
    is(0.U){sevSeg := "b0111111" .U} // 0
    is(1.U){sevSeg := "b0000110" .U} // 1
    is(2.U){sevSeg := "b1011011" .U} // 2
    is(3.U){sevSeg := "b1001111" .U} // 3
    is(4.U){sevSeg := "b1100110" .U} // 4
    is(5.U){sevSeg := "b1101101" .U} // 5
    is(6.U){sevSeg := "b1111101" .U} // 6
    is(7.U){sevSeg := "b0000111" .U} // 7
    is(8.U){sevSeg := "b1111111" .U} // 8
    is(9.U){sevSeg := "b1101111" .U} // 9
    is(10.U){sevSeg := "b1110111" .U} // A
    is(11.U){sevSeg := "b1111100" .U} // B
    is(12.U){sevSeg := "b0111001" .U} // C
    is(13.U){sevSeg := "b1011110" .U} // D
    is(14.U){sevSeg := "b1111001" .U} // E
    is(15.U){sevSeg := "b1110001" .U} // F
  }



  // *** end adding the table

  io.out := sevSeg
}


