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

class Win(clock: Int) extends Module {
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val visualPoints = Output(UInt(4.W))
    val visualBuffer = Output(UInt(14.W))
  })

  io.visualPoints := 0.U
  io.visualBuffer := 0.U

  val cnt = RegInit(0.U(4.W))
  val clk = RegInit(0.U(32.W))
  when(io.enable) {
    clk := clk + 1.U
    when(clk === clock.U) { // slow down generation speed
      clk := 0.U
      cnt := cnt + 1.U // tick
    }
    when(cnt === 15.U) { cnt := 0.U }
  }

  // points anim
  switch(cnt) {
    is(0.U)   { io.visualPoints := 0.U  }
    is(1.U)   { io.visualPoints := 1.U  }
    is(2.U)   { io.visualPoints := 2.U  }
    is(3.U)   { io.visualPoints := 3.U  }
    is(4.U)   { io.visualPoints := 4.U  }
    is(5.U)   { io.visualPoints := 5.U  }
    is(6.U)   { io.visualPoints := 6.U  }
    is(7.U)   { io.visualPoints := 7.U  }
    is(8.U)   { io.visualPoints := 7.U  }
    is(9.U)   { io.visualPoints := 0.U  }
    is(10.U)  { io.visualPoints := 7.U  }
    is(11.U)  { io.visualPoints := 0.U  }
    is(12.U)  { io.visualPoints := 7.U  }
    is(13.U)  { io.visualPoints := 0.U  }
    is(14.U)  { io.visualPoints := 7.U  }
  }

  // buffer anim
  switch(cnt) {
    is(0.U)   { io.visualBuffer := "b00010000001000".U  }
    is(1.U)   { io.visualBuffer := "b00010000001000".U  }
    is(2.U)   { io.visualBuffer := "b10000001000000".U  }
    is(3.U)   { io.visualBuffer := "b10000001000000".U  }
    is(4.U)   { io.visualBuffer := "b00000010000001".U  }
    is(5.U)   { io.visualBuffer := "b00000010000001".U  }
    is(6.U)   { io.visualBuffer := "b10000001000000".U  }
    is(7.U)   { io.visualBuffer := "b10000001000000".U  }
    is(8.U)   { io.visualBuffer := 0.U  }
    is(9.U)   { io.visualBuffer := "b00010000001000".U  }
    is(10.U)  { io.visualBuffer := "b10000001000000".U  }
    is(11.U)  { io.visualBuffer := "b00000010000001".U  }
    is(12.U)  { io.visualBuffer := "b00010000001000".U  }
    is(13.U)  { io.visualBuffer := "b10000001000000".U  }
    is(14.U)  { io.visualBuffer := "b00000010000001".U  }
  }
}
