module MyAccel #(
    parameter REG_COUNT = 10
)(
    input  wire         clk,
    input  wire         rst,

    input  wire         reg_wr_en,
    input  wire [3:0]   reg_addr,
    input  wire [31:0]  reg_wr_data,
    output wire [31:0]  reg_rd_data,
    output wire         irq
);

    reg [31:0] regs [0:REG_COUNT-1];
    reg        done = 0;

    assign reg_rd_data = regs[reg_addr];
    assign irq = done;

    always @(posedge clk) begin
        if (rst) begin
            integer i;
            done <= 0;
            for (i = 0; i < REG_COUNT; i = i + 1)
                regs[i] <= 0;
        end else if (reg_wr_en) begin
            regs[reg_addr] <= reg_wr_data;
            if (reg_addr == 0 && reg_wr_data[0]) begin
                // Start bit triggers op!
                regs[1] <= regs[2] + regs[3]; // simple add, example calc!
                done <= 1'b1;
            end
            if (reg_addr == 0 && reg_wr_data[1]) begin
                done <= 1'b0;
            end
        end
    end
endmodule