import chisel3._
import chisel3.util._

class Display(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val sw = Input(UInt(20.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val dispMux = Module(new DisplayMultiplexer(maxCount))

  // Simulate the price and sum input with the switches
  dispMux.io.price := io.sw(9, 0)
  dispMux.io.sum := io.sw(19, 9)

  // Connect the display
  io.seg := dispMux.io.seg
  io.an := dispMux.io.an
}

// generate Verilog
object Display extends App {
  emitVerilog(new Display(100000))
}
