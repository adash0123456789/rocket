import chisel3._
import chisel3.experimental._

class MyAccelIO extends Bundle {
  val clk         = Input(Clock())
  val rst         = Input(Bool())
  val reg_wr_en   = Input(Bool())
  val reg_addr    = Input(UInt(4.W))
  val reg_wr_data = Input(UInt(32.W))
  val reg_rd_data = Output(UInt(32.W))
  val irq         = Output(Bool())
}

class MyAccelBlackBox extends BlackBox with HasBlackBoxResource {
  val io = IO(new MyAccelIO)
  addResource("/vsrc/MyAccel.sv")
}