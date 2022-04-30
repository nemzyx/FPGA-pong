import chisel3._
import chisel3.util._

class CountSevenSeg extends Module {
  val io = IO(new Bundle {
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireInit("b1111111".U(7.W))

  // *** your code starts here
  val CNT_MAX = (100000000 / 2 - 1).U // 100 MHz / 2 = 2Hz

  val cntReg = RegInit(0.U(32.W))
  val segReg = RegInit(0.U(4.W))

  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX) {  // 1 tick
    cntReg := 0.U
    segReg := segReg + 1.U
    //io.an := io.an + 1.U
  }
  when (segReg === 16.U) {     // 15 ticks
    segReg := 0.U(4.W)
    //io.an := 0.U(4.W)
  }

  val segDec = Module(new SevenSegDec())
  segDec.io.in := segReg // connect seven segment input with segReg
  sevSeg := segDec.io.out // connect io.seg to the output of decoder

  // *** your code ends here

  io.seg := ~sevSeg
  io.an := "b1110".U
}

// generate Verilog
object CountSevenSeg extends App {
  emitVerilog(new CountSevenSeg())
}