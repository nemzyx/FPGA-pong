import chisel3._
import chisel3.util._

class DecimalSeperator extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })

  // val cnt = RegInit(0.U(8.W)) // int division cnt
  // val acc = RegInit(io.in.zext)   //  accumulator, start io.in

  // when(acc > 0.S) {
  //   acc := acc - 10.S
  //   cnt := cnt + 1.U
  // } .otherwise {
  //   acc := io.in.zext
  //   cnt := 0.U
  // }

  // val left  = cnt << 4
  // val right = (io.in % 10.U(8.W))

  val left  = (io.in / 10.U) << 4
  val right = (io.in % 10.U(8.W))
  
  io.out := left | right
}
