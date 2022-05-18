import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class FsmSpec extends AnyFlatSpec with ChiselScalatestTester {
  "FSM" should "pass" in {
    test(new FSM) { dut =>

      // Setting all inputs to zero
      dut.io.buy.poke(false.B)
      dut.io.coin2.poke(false.B)
      dut.io.coin5.poke(false.B)
      dut.io.buyCheck.poke(false.B)

      // Testing each state

      // Testing the ready state
      dut.io.add2.expect(false.B)
      dut.io.add5.expect(false.B)
      dut.io.alarm.expect(false.B)
      dut.io.subPrice.expect(false.B)
      dut.io.releaseCan.expect(false.B)

      // Testing subPrice
      dut.io.buy.poke(true.B)
      dut.io.buyCheck.poke(true.B)
      dut.clock.step(2)
      dut.io.subPrice.expect(true.B)
      dut.io.buy.poke(false.B)
      dut.io.buyCheck.poke(false.B)


      // Testing releaseCan
      dut.clock.step(1)
      dut.io.releaseCan.expect(true.B)
      dut.clock.step(10)

      // ready
      dut.io.add2.expect(false.B)
      dut.io.add5.expect(false.B)
      dut.io.alarm.expect(false.B)
      dut.io.subPrice.expect(false.B)
      dut.io.releaseCan.expect(false.B)


      // Testing alarm
      dut.io.buy.poke(true.B)
      dut.clock.step(2)
      dut.io.alarm.expect(true.B)
      dut.io.buy.poke(false.B)
      dut.clock.step(10)

      // ready
      dut.io.add2.expect(false.B)
      dut.io.add5.expect(false.B)
      dut.io.alarm.expect(false.B)
      dut.io.subPrice.expect(false.B)
      dut.io.releaseCan.expect(false.B)

      // Testing add2
      dut.io.coin2.poke(true.B)
      dut.clock.step(1)
      dut.io.add2.expect(true.B)
      dut.io.coin2.poke(false.B)
      dut.clock.step(10)

      // ready
      dut.io.add2.expect(false.B)
      dut.io.add5.expect(false.B)
      dut.io.alarm.expect(false.B)
      dut.io.subPrice.expect(false.B)
      dut.io.releaseCan.expect(false.B)


      // Testing add5
      dut.io.coin5.poke(true.B)
      dut.clock.step(1)
      dut.io.coin5.poke(false.B)
      dut.io.add5.expect(true.B)
      dut.clock.step(10)

      // ready
      dut.io.add2.expect(false.B)
      dut.io.add5.expect(false.B)
      dut.io.alarm.expect(false.B)
      dut.io.subPrice.expect(false.B)
      dut.io.releaseCan.expect(false.B)

    }
  }
}
