import chisel3._
import chisel3.util._

class VendingMachine(maxCount: Int, pongFreq: Int) extends Module {
  val io = IO(new Bundle {
    val pongMode = Input(Bool())
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val p1 = Input(Bool())
    val p2 = Input(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))

    // pong points LEDs
    val p2LED1 = Output(Bool())
    val p2LED2 = Output(Bool())
    val p2LED3 = Output(Bool())
    val p2LED4 = Output(Bool())
    val p2LED5 = Output(Bool())
    val p2LED6 = Output(Bool())
    val p2LED7 = Output(Bool())
    val p1LED1 = Output(Bool())
    val p1LED2 = Output(Bool())
    val p1LED3 = Output(Bool())
    val p1LED4 = Output(Bool())
    val p1LED5 = Output(Bool())
    val p1LED6 = Output(Bool())
    val p1LED7 = Output(Bool())
  })

  // ***** some dummy connections *****
  // sevSeg := "b1111111".U

  // io.alarm := io.coin2
  // io.releaseCan := io.coin5

  // OUR CODE
  val IoSync = Module(new IoSync())
  IoSync.io.buy := io.buy
  IoSync.io.coin2 := io.coin2
  IoSync.io.coin5 := io.coin5
  IoSync.io.p1 := io.p1
  IoSync.io.p2 := io.p2

  val FSM = Module(new FSM())
  FSM.io.buy := IoSync.io.s_buy
  FSM.io.coin2 := IoSync.io.s_coin2
  FSM.io.coin5 := IoSync.io.s_coin5
  io.releaseCan := FSM.io.releaseCan
  io.alarm := FSM.io.alarm

  val DP = Module(new Datapath())
  DP.io.price := io.price     // io.price 5->8 bit
  DP.io.add2 := FSM.io.add2
  DP.io.add5 := FSM.io.add5
  // DP.io.releaseCan := FSM.io.releaseCan
  DP.io.subPrice := FSM.io.subPrice
  
  FSM.io.buyCheck := DP.io.buyCheck

  val display = Module(new DisplayMultiplexer5bit(maxCount))
  val seperator1 = Module(new DecimalSeperator())
  val seperator2 = Module(new DecimalSeperator())
  seperator1.io.in := DP.io.sum
  seperator2.io.in := io.price

  val pong = Module(new Pong(maxCount, pongFreq))
  pong.io.p1 := IoSync.io.s_p1
  pong.io.p2 := IoSync.io.s_p2
  pong.io.restart := ~io.pongMode
  display.io.rawEnable := io.pongMode & pong.io.renderMode
  display.io.raw := pong.io.renderOut

  when(io.pongMode) {
    display.io.sum   := pong.io.leftOut
    display.io.price := pong.io.rightOut
  } .otherwise {
    display.io.sum   := seperator1.io.out
    display.io.price := seperator2.io.out
  }

  // pong points connection
  io.p2LED1 := pong.io.p2points(6)
  io.p2LED2 := pong.io.p2points(5)
  io.p2LED3 := pong.io.p2points(4)
  io.p2LED4 := pong.io.p2points(3)
  io.p2LED5 := pong.io.p2points(2)
  io.p2LED6 := pong.io.p2points(1)
  io.p2LED7 := pong.io.p2points(0)
  io.p1LED1 := pong.io.p1points(6)
  io.p1LED2 := pong.io.p1points(5)
  io.p1LED3 := pong.io.p1points(4)
  io.p1LED4 := pong.io.p1points(3)
  io.p1LED5 := pong.io.p1points(2)
  io.p1LED6 := pong.io.p1points(1)
  io.p1LED7 := pong.io.p1points(0)
  // END OF OUR CODE

  io.seg := display.io.seg
  io.an := display.io.an
}

// generate Verilog
object VendingMachine extends App {
  // val CNT_MAX = (100000000 / 1000 - 1).U // 100 MHz / 1kHz = 100 kHz
  (new chisel3.stage.ChiselStage).emitVerilog(new VendingMachine(100000,100000000))
}


