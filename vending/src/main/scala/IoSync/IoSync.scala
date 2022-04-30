import chisel3._
import chisel3.util._

class IoSync extends Module {
  val io = IO(new Bundle {
    val buy = Input(Bool())
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val s_buy = Output(Bool())
    val s_coin2 = Output(Bool())
    val s_coin5 = Output(Bool())
  })

  val x1 = WireDefault(false.B)
  val x2 = WireDefault(false.B)

  when(io.buy) {
    x1 := true.B
    x2 := true.B
  }

  io.s_buy := RegNext(RegNext(io.buy))
  io.s_coin2 := RegNext(RegNext(io.coin2))
  io.s_coin5 := RegNext(RegNext(io.coin5))
}
