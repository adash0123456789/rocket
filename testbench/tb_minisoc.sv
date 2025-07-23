module tb_minisoc;
  reg clk = 0, rst = 1;
  always #5 clk = ~clk;
  initial begin
    #10 rst = 0;
    // Simulate for some time
    #10000 $finish;
  end

  // Instantiate your SoC here, connect clock, reset, memory, ...
endmodule