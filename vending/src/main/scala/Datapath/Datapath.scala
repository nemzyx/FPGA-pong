import chisel3._
import chisel3.util._

class Datapath extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(8.W))
    val add2 = Input(Bool())
    val add5 = Input(Bool())
    val subPrice = Input(Bool())
    // val releaseCan = Input(Bool())
    val buyCheck = Output(Bool())
    val sum = Output(UInt(8.W))
  })
  
  val sumReg = RegInit(0.U(8.W))

  when(io.add2) {
    sumReg := sumReg + 2.U; // io.sum = io.sum + 2.U ????????
  }

  when(io.add5) {
    sumReg := sumReg + 5.U;
  }

  when(io.subPrice) {
    sumReg := sumReg - io.price
  }

  when(sumReg >= io.price) {
    io.buyCheck := true.B
  } .otherwise {
    io.buyCheck := false.B
  }

  io.sum := sumReg
}
