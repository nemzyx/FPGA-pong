import chisel3._
import chisel3.util._

class FSM extends Module {
  val io = IO(new Bundle {
    val buyCheck = Input(Bool())
    val buy = Input(Bool())
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val reset = Input(Bool())
    val add2 = Output(Bool())
    val add5 = Output(Bool())
    val releaseCan = Output(Bool())
    val subPrice = Output(Bool())
    val alarm = Output(Bool())
    val init = Output(Bool())
  })

  io.alarm := false.B
  io.releaseCan := false.B
  io.subPrice := false.B
  io.add2 := false.B
  io.add5 := false.B
  io.init := false.B
  
  val ready = WireDefault(true.B)

  when(~io.buy && ~io.coin2 && ~io.coin5) {
    ready := true.B
    io.add2 := false.B
    io.add5 := false.B
  } .otherwise {
    ready := false.B
  }
  
  when(ready) {    
    when(io.coin2) {
      // ready := false.B
      io.add2 := true.B
    } .elsewhen(io.coin5) {
      // ready := false.B
      io.add5 := true.B
    }
    when(io.buy && io.buyCheck) {
      // ready := false.B
      io.alarm := false.B
      io.releaseCan := true.B
      io.subPrice := true.B
    } .elsewhen(io.buy && ~io.buyCheck) {
      // ready := false.B
      io.alarm := true.B
      io.releaseCan := false.B
      io.subPrice := false.B
    }
  }

  when(io.reset) {
    ready := false.B
    io.init := true.B
  } .otherwise {
    io.init := false.B
  }

  // button check
  // when(buy || coin2 || coin5) {
  //   ready := false.B
  // } .otherwise {
  //   ready := true.B
  // }
}
