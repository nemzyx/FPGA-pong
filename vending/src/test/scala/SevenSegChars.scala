import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SevenSegChars extends AnyFlatSpec with ChiselScalatestTester {
	"SevenSegDec " should "pass" in {
		test(new SevenSegDec) { dut =>
			def print7Segment(x:BigInt,y: Int){
				var tempStr = ""
				// println(CHARS collect { case (c,y) => c})
				println(y)
				println(if ((~x & 0x01) == 0) " _"  else " ")  //Print top "_"
				tempStr += (if((~x & 0x20) == 0) "|" else " ") //Print top left "|"
				tempStr += (if((~x & 0x40) == 0) "_" else " ") //Print middle "_"
				tempStr += (if((~x & 0x2) == 0) "|" else " ")  //Print top right "|"
				println(tempStr)
				tempStr = (if((~x & 0x10) == 0) "|" else " ")  //Print lower left "|"
				tempStr += (if((~x & 0x8) == 0) "_" else " ")  //Print lower "_"
				tempStr += (if((~x & 0x4) == 0) "|" else " ")  //Print lower right "|"
				println(tempStr)
				println()                                      //Print empty line
			}

			for (idx <- 0 until 32) {
				dut.io.in.poke(idx.U) //We apply a value to the input
				println(dut.io.out.peek().litValue.toString(2).reverse.padTo(7,'0').reverse) // And check the value on the output.
				print7Segment(dut.io.out.peek().litValue, idx) // Here we print the result, as it would look on the 7-segment display.
			}
		}
	}
}
