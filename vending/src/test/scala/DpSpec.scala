import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

// Just have a simple Mux2 test here as a reference
class DpSpec extends AnyFlatSpec with ChiselScalatestTester {
  "FSM " should "pass" in {
    test(new Datapath) { dut =>
      dut.io.price.poke(5.U)
      dut.io.sum.expect(0.U)
      dut.io.add2.poke(true.B)
      dut.clock.step(1)
      dut.io.add2.poke(false.B)
      dut.clock.step(1)
      println(dut.io.sum.peek())
      dut.io.sum.expect(2.U)

      dut.io.add5.poke(true.B)
      dut.clock.step(1)
      dut.io.add5.poke(false.B)
      dut.clock.step(1)
      println(dut.io.sum.peek())
      dut.io.sum.expect(7.U)
    }
  }
}
