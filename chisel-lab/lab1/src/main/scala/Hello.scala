/*
 * Blinking LED: the hardware version of Hello World
 *
 * Copyright: 2013, Technical University of Denmark, DTU Compute
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

import chisel3._

class Hello extends Module {
  val io = IO(new Bundle {
    val led = Output(Bool())
  })
  val CNT_MAX = (50000000 - 1).U
  
  val cntReg = RegInit(0.U(32.W))
  val blkReg = RegInit(false.B)

  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX) {
    cntReg := 0.U
    blkReg := false.B
  }
  when(cntReg === CNT_MAX / 8.U) {
    blkReg := true.B
  }
  io.led := blkReg
}

/**
 * An object extending App to generate the Verilog code.
 */
object HelloMain extends App {
  println("Hello World, I will now generate the Verilog file!")
  // for (n <- 0 to 3) {
  //   println(1 << n)
  // }
  emitVerilog(new Hello())
}
