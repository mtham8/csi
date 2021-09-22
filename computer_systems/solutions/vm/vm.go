package vm

const (
	Load  = 0x01
	Store = 0x02
	Add   = 0x03
	Sub   = 0x04
	Halt  = 0xff
)

// Stretch goals
const (
	Addi = 0x05
	Subi = 0x06
	Jump = 0x07
	Beqz = 0x08
)

// Given a 256 byte array of "memory", run the stored program
// to completion, modifying the data in place to reflect the result
//
// The memory format is:
//
// 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f ... ff
// __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ ... __
// ^==DATA===============^ ^==INSTRUCTIONS==============^
//

// TODO: implement some degree of memory protection, such as preventing instructions from being accidentally overwritten.
func compute(memory []byte) {

	registers := [3]byte{8, 0, 0} // PC, R1 and R2

	// Keep looping, like a physical computer's clock
	for {
		pc := registers[0]
		op := memory[pc]

		// // decode and execute
		switch op {
		case Load:
			// load    r1  addr
			// Load value at given address into given register
			registers[memory[pc+1]] = memory[memory[pc+2]]
		case Store:
			// store   r2  addr
			// Store the value in register at the given memory address
			memory[memory[pc+2]] = registers[memory[pc+1]]
		case Add:
			// add     r1  r2
			// Set r1 = r1 + r2
			registers[memory[pc+1]] += registers[memory[pc+2]]
		case Sub:
			// sub     r1  r2
			// Set r1 = r1 - r2
			registers[memory[pc+1]] -= registers[memory[pc+2]]
		case Addi:
			// addi r1 4
			registers[memory[pc+1]] += memory[pc+2]
		case Subi:
			registers[memory[pc+1]] -= memory[pc+2]
		case Jump:
			// jump 40
			registers[0] = memory[pc+1]
			continue
		case Beqz:
			// beqz r2 3
			if registers[memory[pc+1]] == 0 {
				registers[0] += memory[pc+2]
			}
		case Halt:
			return
		}
		registers[0] += 3
	}
}
