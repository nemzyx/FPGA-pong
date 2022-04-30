import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val sum = Input(UInt(8.W))
    val price = Input(UInt(8.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireDefault("b1111111".U(7.W))
  val select = WireDefault("b0001".U(4.W))

  // *** your code starts here
  /*
  // val CNT_MAX = (100000000 / 1000 - 1).U // 100 MHz / 1kHz = 1kHz
  val CNT_MAX = 10000000.U
  val cntReg = RegInit(0.U(32.W))
  val anReg = RegInit(0.U(2.W))

  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX) {  // 1 tick
    cntReg := 0.U
    anReg := anReg + 1.U
  }
  when (anReg === 4.U) {     // 4 ticks
    anReg := 0.U
  }

  switch(anReg) {
    is(0.U) { io.an := "b1000".U }
    is(1.U) { io.an := "b0100".U }
    is(2.U) { io.an := "b0010".U }
    is(3.U) { io.an := "b0001".U }
  } */

  // Silas' Kode her:

  val sevenSegDec = Module (new SevenSegDec)
  val regCount = RegInit(0.U(2.W))

  when (regCount === 3.U) {  // LD1
    select := "b0001".U
    sevenSegDec.io.in := io.price(3,0)
  } .elsewhen(regCount === 2.U) { // LD2
    select := "b0010".U
    sevenSegDec.io.in := io.price(7,4)
  } .elsewhen(regCount === 1.U) { // LD3
    select := "b0100".U
    sevenSegDec.io.in := io.sum(3,0)
  } .elsewhen(regCount === 0.U) {  // LD4
    select := "b1000".U
    sevenSegDec.io.in := io.sum(7,4)
  } .otherwise {
    select := 0.U
    sevenSegDec.io.in := io.sum(7,4)
  }

  // clock
  val count = Wire(UInt())
  count := regCount

  val regClk = RegInit(0.U(32.W))

  when (regClk < 10000.U) {
    regClk := regClk + 1.U
  } .otherwise{
    regClk := 0.U
    regCount := regCount + 1.U
  }
  sevSeg := sevenSegDec.io.out


  // *** your code ends here

  io.seg := ~sevSeg
  io.an := ~select
}
