import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val rawEnable = Input(Bool()) // enable raw
    val raw = Input(UInt(28.W))  // raw binary input

    val sum = Input(UInt(8.W))
    val price = Input(UInt(8.W))
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

  when(io.rawEnable) {
    switch(anReg) {
      is(0.U) {
        select := "b1000".U
        sevSeg := io.raw(27,21)
      }
      is(1.U) {
        select := "b0100".U
        sevSeg := io.raw(20,14)
      }
      is(2.U) {
        select := "b0010".U
        sevSeg := io.raw(13,7)
      }
      is(3.U) {
        select := "b0001".U
        sevSeg := io.raw(6,0)
      }
    }
  } .otherwise {
    sevSeg := decoder.io.out
    switch(anReg) {
      is(0.U) {
        select := "b1000".U
        decoder.io.in := io.sum(7,4)
      }
      is(1.U) {
        select := "b0100".U
        decoder.io.in := io.sum(3,0)
      }
      is(2.U) {
        select := "b0010".U
        decoder.io.in := io.price(7,4)
      }
      is(3.U) {
        select := "b0001".U
        decoder.io.in := io.price(3,0)
      }
    }
  }

  io.seg := ~sevSeg
  io.an := ~select
}
