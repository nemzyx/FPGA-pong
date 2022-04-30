import chisel3._
import chisel3.util._

class CPU extends Module {
  val io = IO(new Bundle {
    val buy = Input(Bool())
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val price = Input(UInt(8.W))
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val sum = Output(UInt(8.W))
  })

  val reCheck = WireDefault(false.B)
  val release = WireDefault(false.B)
  val alCheck = WireDefault(false.B)

  when (io.sum >= io.price) {
    reCheck := true.B
  }.otherwise {
    reCheck := false.B
  }

  when(reCheck && io.buy) {
    release:=true.B
  } .elsewhen(io.buy && ~reCheck) {
    alCheck := true.B
  } .otherwise {
    alCheck := false.B
    release := false.B
  }

  val acReg = RegInit(0.U(8.W)) // accumulator

  io.sum := acReg
  io.alarm := alCheck //dummy
  io.releaseCan := release //dummy
}
