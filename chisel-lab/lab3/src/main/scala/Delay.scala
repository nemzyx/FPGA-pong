import chisel3._

class Delay extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())

  // ***** your code starts here *****

  // below is dummy code to make this example compile
  val delay = RegNext(io.din)
  res := RegNext(delay)

  // ***** your code ends here *****

  io.dout := res
}