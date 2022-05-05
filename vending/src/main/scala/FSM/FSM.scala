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
    val alarm = Output(Bool())
    val init = Output(Bool())
  })


  val ready :: add5 :: add2 :: buy :: alarm :: release :: buttomCheck :: Nil = Enum(7)
  val state = RegInit(ready)


  // FSM input
  switch(state) {
    is(ready) {
      when(io.coin2) {state := add2}
      .elsewhen(io.coin5) {state := add5}
      .elsewhen(io.buy) {state := buy}
        .otherwise {state := ready}
      }
    is(add2) {
      state := buttomCheck
    }
    is(add5){
      state := buttomCheck
    }
    is(buy){
      when(io.buyCheck) {state := release}
        .otherwise {state := alarm}
    }
    is(alarm){
      when(io.buy) {state := alarm}
        .otherwise {buttomCheck}
    }
    is(release){
      state := buttomCheck
    }
    is(buttomCheck){
      when(!(io.buy | io.coin2 | io.coin5)) {state := ready}
        .otherwise{state := buttomCheck}
    }
  }

  // Output control
  switch(state){
    is(ready){
      io.add2 := false.B
      io.add5 := false.B
      io.alarm := false.B
      io.releaseCan := false.B
    }
    is(add2) {io.add2 := true.B}
    is(add5) {io.add5 := true.B}
    is(alarm) {io.alarm := true.B}
    is(realese) {io.releaseCan := true.B}
  }
}
