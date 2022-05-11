// ====================================
// !! ⚠ WARNING ⚠ !!
//
// THIS CODE IS A HOT MESS !
// PROCEED WITH CAUTION
//
// ☺
// probably much room for optimization
// but hey - it's a pong game
// within a vending machine
// ====================================

import CharMap.{CHAR}
import chisel3._
import chisel3.util._
import scala.annotation.switch

class Pong(dispFreq: Int, freq: Int) extends Module {
  val io = IO(new Bundle {
    val p1 = Input(Bool())
    val p2 = Input(Bool())
    val restart = Input(Bool())
    val p1points = Output(UInt(7.W))
    val p2points = Output(UInt(7.W))
    val renderMode = Output(Bool())      // rendering bits or decoder ?
    val renderOut = Output(UInt(28.W))  // rendering raw bits, 7 * 4
    val rightOut = Output(UInt(10.W))  // decoder left display
    val leftOut = Output(UInt(10.W))  // decoder right display
  })

  io.p1points := 0.U
  io.p2points := 0.U
  val p1pointsPersist = RegInit(0.U(4.W))
  val p2pointsPersist = RegInit(0.U(4.W))
  val p1pointsTable = RegInit(0.U(4.W))
  val p2pointsTable = RegInit(0.U(4.W))
  switch(p1pointsTable) {
    is(0.U) { io.p1points := "b0000000".U }
    is(1.U) { io.p1points := "b1000000".U }
    is(2.U) { io.p1points := "b1100000".U }
    is(3.U) { io.p1points := "b1110000".U }
    is(4.U) { io.p1points := "b1111000".U }
    is(5.U) { io.p1points := "b1111100".U }
    is(6.U) { io.p1points := "b1111110".U }
    is(7.U) { io.p1points := "b1111111".U }
    is(8.U) { io.p1points := "b1111111".U }
  }
  switch(p2pointsTable) {
    is(0.U) { io.p2points := "b0000000".U }
    is(1.U) { io.p2points := "b1000000".U }
    is(2.U) { io.p2points := "b1100000".U }
    is(3.U) { io.p2points := "b1110000".U }
    is(4.U) { io.p2points := "b1111000".U }
    is(5.U) { io.p2points := "b1111100".U }
    is(6.U) { io.p2points := "b1111110".U }
    is(7.U) { io.p2points := "b1111111".U }
    is(8.U) { io.p2points := "b1111111".U }
  }

  // val RNG = Module(new RNGsimple(dispFreq))
  val RNG = Module(new RNG(dispFreq))
  val win = Module(new Win(freq/24))
  win.io.enable := false.B

  val blk = RegInit(false.B)

  val blkCnt = RegInit(0.U(32.W))
  blkCnt := blkCnt + 1.U
  when(blkCnt === (freq/4).U) {
    blkCnt := 0.U
    blk := false.B
  }
  when(blkCnt === ((freq/4)/2).U) {
    blk := true.B
  }

  io.renderMode := true.B

  val buffer = RegInit(0.U(28.W))
  val bufCnt = RegInit(0.U(32.W))
  bufCnt := bufCnt + 1.U
  when(bufCnt === dispFreq.U) { bufCnt := 0.U } // reset buffer counter

  val hitCnt = RegInit(0.U(4.W))
  val bulletCnt = RegInit(0.U(32.W))
  bulletCnt := bulletCnt + 1.U
  val baseSpeed = (freq / 8) // 250ms, freq = 1s
  //  M = 48 : max speed is 75% of base speed
  //  M = 24 : max speed is 50% of base speed
  //  M = 12 : max speed is 25% of base speed
  val M = 24 // make smaller to increase max speed
  val speedupTable = Module(new SpeedupTable())
  speedupTable.io.idx := hitCnt
  when(bulletCnt === baseSpeed.U - (baseSpeed/M).U * speedupTable.io.out) {
    bulletCnt := 0.U //tick
  }

  val bulletY = RegInit(0.U(1.W))  // bullet Y position
  val bullet  = RegInit(0.U(3.W))  // bullet position
  val p1pos   = RegInit(0.U(1.W))  // player 1 position
  val p2pos   = RegInit(0.U(1.W))  // player 2 position
  
  val p1Trigger = io.p1 && !RegNext(io.p1) // rising edge
  val p2Trigger = io.p2 && !RegNext(io.p2) // rising edge

  val idle :: player1 :: player2 :: shootP1 :: shootP2 :: scoreP1 :: scoreP2 :: awaitP1 :: awaitP2 :: winP1 :: winP2 :: Nil = Enum(11)
  val state = RegInit(idle)

  // kinda FSM pattern
  switch(state) {
    is(idle) {
      buffer := 0.U
      io.renderMode := blk
      p1pos   := 0.U
      p2pos   := 1.U
      p1pointsTable := 0.U
      p2pointsTable := 0.U
      p1pointsPersist := 0.U
      p2pointsPersist := 0.U
      win.io.enable := false.B
      hitCnt := 0.U

      when(io.p1){
        bullet  := 0.U
        bulletY := 1.U
        state := shootP1
      }
      .elsewhen(io.p2) {
        bullet  := 7.U
        bulletY := 0.U
        state := shootP2
      }
    }
    is(player1) {
      when(p1pos === bulletY) { // hit
        when(hitCnt < 15.U) { hitCnt := hitCnt + 1.U }
        val rnd = RNG.io.random < 8.U
        when(rnd === bulletY) { bullet := bullet + 1.U }
        bulletY := Mux(rnd, 1.U, 0.U)
        state := shootP1
      } .otherwise {      // miss
        state := scoreP2
      }
    }
    is(player2) {
      when(p2pos === bulletY) { // hit
        when(hitCnt < 15.U) { hitCnt := hitCnt + 1.U }
        val rnd = RNG.io.random > 7.U
        when(rnd === bulletY) { bullet := bullet - 1.U }
        bulletY := Mux(rnd, 1.U, 0.U)
        state := shootP2
      } .otherwise {      // miss
        state := scoreP1
      }
    }
    is(scoreP1) {
      hitCnt := 0.U
      p1pointsPersist := p1pointsPersist + 1.U
      p1pointsTable := p1pointsTable + 1.U
      when(p1pointsPersist === 6.U){ // player 1 win
        state := winP1
      }.otherwise { state := awaitP2 }
    }
    is(scoreP2) {
      hitCnt := 0.U
      p2pointsPersist := p2pointsPersist + 1.U
      p2pointsTable := p2pointsTable + 1.U
      when(p2pointsPersist === 6.U){ // player 2 win
        state := winP2
      }.otherwise { state := awaitP1 }
    }
    is(awaitP1) { when(p1Trigger) { state := shootP1 } }
    is(awaitP2) { when(p2Trigger) { state := shootP2 } }
    is(shootP1) {
      when(bullet < 7.U) {
        when(bulletCnt === 0.U) { //tick
          bullet := bullet + 1.U
        }
      } .otherwise { state := player2 }
    }
    is(shootP2) {
      when(bullet > 0.U) {
        when(bulletCnt === 0.U) { //tick
          bullet := bullet - 1.U
        }
      } .otherwise { state := player1 }
    }
    is(winP1) {
      when(p1Trigger) { state := idle }
      win.io.enable := true.B
      p1pointsTable := win.io.visualPoints
      buffer        := win.io.visualBuffer << 14
    }
    is(winP2) {
      when(p2Trigger) { state := idle }
      win.io.enable := true.B
      p2pointsTable := win.io.visualPoints
      buffer        := win.io.visualBuffer
    }
  }

  when(state =/= idle) {
    when(io.restart) { state := idle }

    // input
    when(p1Trigger) { p1pos := ~p1pos }
    when(p2Trigger) { p2pos := ~p2pos }

    // rendering
    when(bufCnt === dispFreq.U / 4.U) {
      when(bulletY === 0.U) {
        switch(bullet) {
          is(0.U) { buffer := "b0001000".U(28.W) << 21 | 0.U }
          is(1.U) { buffer := "b0001000".U(28.W) << 21 | 0.U }
          is(2.U) { buffer := "b0001000".U(28.W) << 14 | 0.U }
          is(3.U) { buffer := "b0001000".U(28.W) << 14 | 0.U }
          is(4.U) { buffer := "b0001000".U(28.W) << 7  | 0.U }
          is(5.U) { buffer := "b0001000".U(28.W) << 7  | 0.U }
          is(6.U) { buffer := "b0001000".U(28.W) }
          is(7.U) { buffer := "b0001000".U(28.W) }
        }
      }
      when(bulletY === 1.U) {
        switch(bullet) {
          is(0.U) { buffer := "b0000001".U(28.W) << 21 | 0.U }
          is(1.U) { buffer := "b0000001".U(28.W) << 21 | 0.U }
          is(2.U) { buffer := "b0000001".U(28.W) << 14 | 0.U }
          is(3.U) { buffer := "b0000001".U(28.W) << 14 | 0.U }
          is(4.U) { buffer := "b0000001".U(28.W) << 7  | 0.U }
          is(5.U) { buffer := "b0000001".U(28.W) << 7  | 0.U }
          is(6.U) { buffer := "b0000001".U(28.W) }
          is(7.U) { buffer := "b0000001".U(28.W) }
        }
      }
    }
    when(bufCnt === (dispFreq.U / 4.U) * 2.U) {
      switch(p1pos) {
        is(0.U) { buffer := buffer | "b0010000".U << 21 | 0.U }
        is(1.U) { buffer := buffer | "b0100000".U << 21 | 0.U }
      }
    }
    when(bufCnt === (dispFreq.U / 4.U) * 3.U) {
      switch(p2pos) {
        is(0.U) { buffer := buffer | "b0000100".U | 0.U }
        is(1.U) { buffer := buffer | "b0000010".U | 0.U }
      }
    }
  }

  io.renderOut := buffer
  io.leftOut   := (CHAR("P") << 5) | CHAR("O")
  io.rightOut  := (CHAR("N") << 5) | CHAR("G")
}
