import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class DpSpec extends AnyFlatSpec with ChiselScalatestTester {
  "DATAPATH" should "pass" in {
    test(new Datapath) { dut =>
      dut.io.price.poke(9.U)
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
      dut.io.add5.poke(true.B)
      dut.clock.step(1)
      dut.io.add5.poke(false.B)
      dut.clock.step(1)
      println(dut.io.sum.peek())
      dut.io.sum.expect(12.U)

      dut.io.subPrice.poke(true.B)
      dut.clock.step(1)
      dut.io.subPrice.poke(false.B)
      dut.clock.step(1)
      println(dut.io.sum.peek())
      dut.io.sum.expect(3.U)
    }
  }
}
