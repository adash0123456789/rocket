import chisel3._
import chisel3.util._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp}

class MyAccelTL(address: BigInt)(implicit p: Parameters) extends LazyModule {
  val device = new SimpleDevice("myaccel", Seq("myvendor,myaccel"))
  val node = TLRegisterNode(
    address = Seq(AddressSet(address, 0xFF)), // 256 bytes (64x4)
    device = device
  )
  lazy val module = new LazyModuleImp(this) with HasRegMap {
    val blackbox = Module(new MyAccelBlackBox)
    blackbox.io.clk := clock
    blackbox.io.rst := reset.asBool

    // MMIO integration logic (register fields etc.) goes here
    // Wire up regmap to blackbox
  }
}