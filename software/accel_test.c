#define BASE 0x40000000
volatile unsigned *regs = (unsigned*)BASE;

int main() {
    regs[2] = 41;
    regs[3] = 1;
    regs[0] = 1; // Start
    while (!(regs[0] & 0x80000000));
    unsigned out = regs[1];
    regs[0] = 2; // Ack/clear IRQ
    return 0;
}