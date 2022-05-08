import chisel3._
import chisel3.util._

class IoSync extends Module {
  val io = IO(new Bundle {
    val buy = Input(Bool())
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val p1 = Input(Bool())
    val p2 = Input(Bool())
    val s_buy = Output(Bool())
    val s_coin2 = Output(Bool())
    val s_coin5 = Output(Bool())
    val s_p1 = Output(Bool())
    val s_p2 = Output(Bool())
  })

  io.s_buy := RegNext(RegNext(io.buy))
  io.s_coin2 := RegNext(RegNext(io.coin2))
  io.s_coin5 := RegNext(RegNext(io.coin5))
  io.s_p1 := RegNext(RegNext(io.p1))
  io.s_p2 := RegNext(RegNext(io.p2))
}
