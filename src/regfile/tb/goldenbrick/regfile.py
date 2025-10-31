import random
import os

class GoldenRegFile:
    def __init__(self, num_rows=32, num_cols=32, byte_width=8):
        self.num_regs = num_rows*num_cols
        self.registers = ['xxxxxxxx'] * self.num_regs
        self.byte_width = 8
        self.reset()

    def reset(self):
        self.out2 = 0
        self.out1 = 0

    def wr(self, wr_enable: bool, rd_enable: bool, wr_addr: int, rd_addr1: int, rd_addr2: int, data = 0x0):
        # Read or write to register file 
        if wr_enable:
            self.registers[wr_addr] = data 
            return self.out1, self.out2
        if rd_enable:
            self.out1 = self.registers[rd_addr1]
            self.out2 = self.registers[rd_addr2]
            return self.out1, self.out2


if __name__ == "__main__":

    NUM_WRITES = 100
    NUM_READS = 100

    rf = GoldenRegFile()
    rf.reset()

    lines = []
    expected_mem = ['xxxxxxxx'] * 1024
    for _ in range(NUM_WRITES):
        wr_addr = random.randint(0, 1023) 
        rd_addr1 = 0
        rd_addr2 = 0
        data = random.randint(0, 255)

        rf.wr(True, False, wr_addr, rd_addr1, rd_addr2, data)

        expected_mem[wr_addr] = data
        lines.append(f"WR = {1} RD = {0} WRADDR = {wr_addr:010b} RD1 = {rd_addr1:010b} RD2 = {rd_addr2:010b} DATA = {data:08b} OUT1 = {rf.out1:08b} OUT2 = {rf.out2:08b}")

    print("Performing random reads and checking...")
    passed = True
    
    out1 = rf.out1 # hold from previous
    out2 = rf.out2
    for _ in range(NUM_READS):
        rd_addr1 = random.randint(0, 1023) 
        rd_addr2 = random.randint(0, 1023) 
        expected1 = expected_mem[rd_addr1]
        expected2 = expected_mem[rd_addr2]
        actual1, actual2 = rf.wr(False, True, wr_addr, rd_addr1, rd_addr2)
        if (out1 == "xxxxxxxx"):
            if (out2 == "xxxxxxxx"):
                lines.append(f"WR = {0} RD = {1} WRADDR = {wr_addr:010b} RD1 = {rd_addr1:010b} RD2 = {rd_addr2:010b} DATA = {data:08b} OUT1 = {out1} OUT2 = {out2}")
            else:
                lines.append(f"WR = {0} RD = {1} WRADDR = {wr_addr:010b} RD1 = {rd_addr1:010b} RD2 = {rd_addr2:010b} DATA = {data:08b} OUT1 = {out1} OUT2 = {out2:08b}")
        else:
            if (out2 == "xxxxxxxx"):
                lines.append(f"WR = {0} RD = {1} WRADDR = {wr_addr:010b} RD1 = {rd_addr1:010b} RD2 = {rd_addr2:010b} DATA = {data:08b} OUT1 = {out1:08b} OUT2 = {out2}")
            else:
                lines.append(f"WR = {0} RD = {1} WRADDR = {wr_addr:010b} RD1 = {rd_addr1:010b} RD2 = {rd_addr2:010b} DATA = {data:08b} OUT1 = {out1:08b} OUT2 = {out2:08b}")


        if actual1 != expected1:
            print(f"Mismatch at address {rd_addr1:010b}: expected {expected1}, got {actual1}")
            passed = False
        if actual2 != expected2:
            print(f"Mismatch at address {rd_addr2:010b}: expected {expected2}, got {actual2}")
            passed = False
        out1 = actual1
        out2 = actual2

    if passed:
        print("Correct Values")
    else:
        print("Some reads failed")

    with open(os.path.abspath(__file__)[:-10] + "goldenbrick.txt", "w") as f:
        for line in lines:
            f.write(line + "\n")
