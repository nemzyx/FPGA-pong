// ! THIS SHOULD PROBABLY NOT BE A TABLE !
// ===============================================
// generated with python  --- tableGenSpeedup.py
// ===============================================

import chisel3._
import chisel3.util._

class SpeedupTable extends Module {
  val io = IO(new Bundle {
    val idx = Input(UInt(4.W))
    val out = Output(UInt(5.W))
  })

  io.out := 0.U

  switch(io.idx) {
    is(0.U)  { io.out := 0.U  }
    is(1.U)  { io.out := 1.U  }
    is(2.U)  { io.out := 1.U  }
    is(3.U)  { io.out := 1.U  }
    is(4.U)  { io.out := 1.U  }
    is(5.U)  { io.out := 2.U  }
    is(6.U)  { io.out := 2.U  }
    is(7.U)  { io.out := 2.U  }
    is(8.U)  { io.out := 3.U  }
    is(9.U)  { io.out := 4.U  }
    is(10.U) { io.out := 5.U  }
    is(11.U) { io.out := 6.U  }
    is(12.U) { io.out := 7.U  }
    is(13.U) { io.out := 8.U  }
    is(14.U) { io.out := 10.U }
    is(15.U) { io.out := 12.U }
  }
}
