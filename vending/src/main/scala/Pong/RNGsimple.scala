// ! THIS WAS PROBABLY OVER ENGINEERED !
// ==========================================
// the pong game only needs a random int 0 <> 1
// buut... you never know if you
// want to expand functionality
//
// 256 table of 0 <> 16 pseudo-random values
// generated with python  --- tableGenRNG.py
// ==========================================

import chisel3._
import chisel3.util._

class RNG(clock: Int) extends Module {
  val io = IO(new Bundle {
    val random = Output(UInt(4.W))
  })
  
  val cnt = RegInit(0.U(4.W))
  cnt := cnt + 1.U
  when(cnt === 15.U) { cnt := 0.U }

  io.random := cnt
}
