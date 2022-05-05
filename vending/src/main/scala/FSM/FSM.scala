import chisel3._
import chisel3.util._

class FSM extends Module {
  val io = IO(new Bundle {
    val buyCheck = Input(Bool())
    val buy = Input(Bool())
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val add2 = Output(Bool())
    val add5 = Output(Bool())
    val subPrice = Output(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
  })

  io.add2 := false.B
  io.add5 := false.B
  io.alarm := false.B
  io.subPrice := false.B
  io.releaseCan := false.B

  val ready :: add5 :: add2 :: buy :: alarm :: release :: subPrice :: buttonCheck :: Nil = Enum(8)
  val state = RegInit(ready)


  // FSM input
  switch(state) {
    is(ready) {
      when(io.coin2)      {state := add2}
      .elsewhen(io.coin5) {state := add5}
      .elsewhen(io.buy)   {state := buy}
      .otherwise          {state := ready}
    }
    is(add2) {
      state := buttonCheck
    }
    is(add5){
      state := buttonCheck
    }
    is(buy){
      when(io.buyCheck) {state := subPrice}
      .otherwise        {state := alarm}
    }
    is(alarm){
      when(io.buy) {state := alarm}
      .otherwise   {state := buttonCheck}
    }
    is(subPrice){
      state := release
    }
    is(release){
      when(io.buy) {state := release}
      .otherwise   {state := buttonCheck}
    }
    is(buttonCheck){
      when(!(io.buy | io.coin2 | io.coin5)) {state := ready}
      .otherwise {state := buttonCheck}
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
    is(add2)     {io.add2 := true.B}
    is(add5)     {io.add5 := true.B}
    is(alarm)    {io.alarm := true.B}
    is(subPrice) {io.subPrice := true.B}
    is(release)  {io.releaseCan := true.B}
  }
}
