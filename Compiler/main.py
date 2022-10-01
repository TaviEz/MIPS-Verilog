file1 = open("instructions.txt", 'r')
file2 = open("hexa.txt", 'w')

def binToHex(n):
    num = int(n, 2)
    myHex  = hex(num)
    return '0x' + myHex[2:].zfill(8)
    # len(myHex) = 8

def hexToBin(myHex, myLen):
    num = int(myHex, 16)
    myBin = bin(num)
    return myBin[2:].zfill(myLen)

opDict = {
    "add": "000000",
    "sub": "000000",
    "slt": "000000",
    "and": "000000",
    "or": "000000",
    "lw": "100011",
    "sw": "101011",
    "beq": "000100",
    "addi": "001000",
    "j": "000010",
    "jal": "000011",

}

registerDict = {
    "zero": "00000",
    "at": "00001",
    "v0": "00010",
    "v1": "00011",
    "a0": "00100",
    "a1": "00101",
    "a2": "00110",
    "a3": "00111",
    "t0": "01000",
    "t1": "01001",
    "t2": "01010",
    "t3": "01011",
    "t4": "01100",
    "t5": "01101",
    "t6": "01110",
    "t7": "01111",
    "s0": "10000",
    "s1": "10001",
    "s2": "10010",
    "s3": "10011",
    "s4": "10100",
    "s5": "10101",
    "s6": "10110",
    "s7": "10111",
    "t8": "11000",
    "t9": "11001",
    "k0": "11010",
    "k1": "11011",
    "gp": "11100",
    "sp": "11101",
    "fp": "11110",
    "ra": "11111"
}

funcDict = {
    "add": "100000",
    "sub": "100010",
    "or": "100101",
    "and": "100100",
    "slt": "101010"
}

for line in file1:
    myBin = ""
    myStr = line.split() #myStr = list of words in a single line
    myBin += opDict[myStr[0]]

    #maybe create a list with R-type ops then check if the instr from the file is in that list
    # r-type
    if myStr[0] == "add" or myStr[0] == "sub" or myStr[0] == "or" or myStr[0] == "and" or myStr[0] == "slt":
        myBin += registerDict[myStr[2]] + registerDict[myStr[3]] + registerDict[myStr[1]] + "00000" + funcDict[myStr[0]]
    # addi
    elif myStr[0] == "addi":
        #convert imm from hex to bin
        myBin += registerDict[myStr[2]] + registerDict[myStr[1]] + hexToBin(myStr[3], 16)
    elif myStr[0] == "beq":
        myBin += registerDict[myStr[1]] + registerDict[myStr[2]] + hexToBin(myStr[3], 16)
    #lw sw
    elif myStr[0] == "lw" or myStr[0] == "sw":
        end = len(myStr[3]) - 1
        register = registerDict[myStr[3][1:end]]
        myBin += register + registerDict[myStr[1]] + hexToBin(myStr[2], 16)

    elif myStr[0] == "j" or myStr[0] == "jal":
        myBin += hexToBin(myStr[1], 26)

    result = [line, myBin + " \n", binToHex(myBin) + "\n\n"]
    file2.writelines(result)

    myHex = binToHex(myBin)

    for i in range(2, len(myHex)):
        file2.write(myHex[i])
        if(i == 3):
            file2.write("  //")
        if i and i % 2:
            file2.write("\n")








