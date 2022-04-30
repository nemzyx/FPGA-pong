import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

// Just have a simple Mux2 test here as a reference
class FsmSpec extends AnyFlatSpec with ChiselScalatestTester {
  "FSM " should "pass" in {
    test(new FSM) { dut =>
      // dut.io.buy.poke(true.B)
      // dut.io.alarm.expect(false.B)
      // println(dut.io.alarm.peek())

      dut.io.buy.poke(false.B)
      dut.io.coin2.poke(false.B)
      dut.io.coin5.poke(false.B)
      //////////////////////////////////

      // dut.clock.step(1)
      // println(dut.io.test.peek())
      // dut.clock.step(1)
      // dut.io.buy.poke(true.B)
      // println(dut.io.test.peek())
      // dut.clock.step(1)
      // println(dut.io.test.peek())
      // dut.clock.step(1)
      // println(dut.io.test.peek())
      // dut.clock.step(1)
      // println(dut.io.test.peek())
      // dut.clock.step(1)
      // println(dut.io.test.peek())
      // dut.clock.step(1)
      // println(dut.io.test.peek())

      // dut.io.coin2.poke(true.B)
      // dut.ready.expect(false.B)
      // println(dut.ready.peek())

      // dut.io.buyCheck.poke(true.B)
      // dut.io.buy.poke(true.B)
      // dut.clock.step(1)
      // dut.io.alarm.expect(false.B)
    }
  }
}
