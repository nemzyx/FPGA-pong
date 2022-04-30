import chisel3._
import chisel3.util._

class DisplayMultiplexer5bit(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val sum = Input(UInt(10.W))
    val price = Input(UInt(10.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val tcReg = RegInit(0.U(32.W)) // tick register
  val anReg = RegInit(0.U(2.W)) //  AN register

  when (tcReg < maxCount.U) { // 1 tick
    tcReg := tcReg + 1.U     //  ++
  } .otherwise{             //   tick finished
    tcReg := 0.U           //    reset
    anReg := anReg + 1.U  //     anReg++
  }

  val sevSeg = WireDefault("b1111111".U(7.W))
  val select = WireDefault("b0001".U(4.W))
  val decoder = Module(new SevenSegDec)
  decoder.io.in := 0.U      // initialize decoder fully
  sevSeg := decoder.io.out  // connect to output

  switch(anReg) {
    is(0.U) {
      select := "b1000".U
      decoder.io.in := io.sum(9,5)
    }
    is(1.U) {
      select := "b0100".U
      decoder.io.in := io.sum(4,0)
    }
    is(2.U) {
      select := "b0010".U
      decoder.io.in := io.price(9,5)
    }
    is(3.U) {
      select := "b0001".U
      decoder.io.in := io.price(4,0)
    }
  }

  io.seg := ~sevSeg
  io.an := ~select
}
