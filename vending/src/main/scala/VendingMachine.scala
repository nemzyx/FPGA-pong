import chisel3._
import chisel3.util._

class VendingMachine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
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

  val display = Module(new DisplayMultiplexer(maxCount))
  val seperator1 = Module(new DecimalSeperator())
  val seperator2 = Module(new DecimalSeperator())
  seperator1.io.in := DP.io.sum
  seperator2.io.in := io.price
  display.io.sum   := seperator1.io.out
  display.io.price := seperator2.io.out
  // END OF OUR CODE

  io.seg := display.io.seg
  io.an := display.io.an
}

// generate Verilog
object VendingMachine extends App {
  // val CNT_MAX = (100000000 / 1000 - 1).U // 100 MHz / 1kHz = 100 kHz
  (new chisel3.stage.ChiselStage).emitVerilog(new VendingMachine(100000))
}


