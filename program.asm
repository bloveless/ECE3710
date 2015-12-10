.data
	@file character_memory.txt

.text
	SETI $2 0
	SETI $3 0
	SETI $0 3
	SETI $14 0xE8
	LSH $14 8
	ADDI $14 0x16
	SETI $15 0xE5
	LSH $15 8
	ADDI $15 0x18
	TCHBRCH :check_touch
	JMP $0
	
:check_touch
	WAIT 1
	SETI $14 0x76
	LSH $14 8
	ADDI $14 0x16
	SETI $15 0x78
	LSH $15 8
	ADDI $15 0x18
	TCHBRCH :bubbler
	SETI $14 0xE8
	LSH $14 8
	ADDI $14 0x87
	SETI $15 0x78
	LSH $15 8
	ADDI $15 0x18
	TCHBRCH :heater
	SETI $14 0x76
	LSH $14 8
	ADDI $14 0x16
	SETI $15 0xE5
	LSH $15 8
	ADDI $15 0x87
	TCHBRCH :pump
	SETI $14 0xE8
	LSH $14 8
	ADDI $14 0x87
	SETI $15 0xE5
	LSH $15 8
	ADDI $15 0x87
	TCHBRCH :lights
	JMP $0
	
:bubbler
	CMPI $2 0
	BGE :bubbler_on
	SETI $2 0
	SETI    $10 0x0F
    SETI $9 0x01
	LSH $9 8
    ADDI $9 0x04
    STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	WLS 1
	WAIT 256
	JMP $0

:bubbler_on
	SETI $2 1
	SETI    $10 0x17
    SETI    $8 0x24
	SETI $9 0x01
	LSH $9 8
    ADDI $9 0x04
	STOR $10 $9
	ADDI $9 1
	STOR $8 $9
	WLS 2
	WAIT 256
	JMP $0

:heater
	CMPI $3 0
    BGE :heater_on
    SETI $3 0
    SETI    $10 0x0F
    SETI    $9 0x01
    LSH     $9 8
    ADDI    $9 0x1F
    STOR $10 $9 
	ADDI $9 1 
	STOR $10 $9
	WLS 3
	WAIT 256
	JMP $0

:heater_on
    SETI $3 1
    SETI    $10 0x17
    SETI    $8 0x24
    SETI    $9 0x01
    LSH     $9 8
    ADDI    $9 0x1F
    STOR $10 $9
    ADDI $9 1
    STOR $8 $9
    WLS 4
    WAIT 256
    JMP $0

:pump
	WLS 9
	WAIT 256
	WLS 0
	WAIT 256
	JMP $0
	
:pane2_touch
	SETI $14 0xE8
	LSH $14 8
	ADDI $14 0x16
	SETI $15 0xE5
	LSH $15 8
	ADDI $15 0x18
	TCHBRCH :chk_2
	SETI $14 :pane2_touch
	JMP $14

:chk_2
	WAIT 1
	SETI $14 0x76
	LSH $14 8
	ADDI $14 0x16
	SETI $15 0x78
	LSH $15 8
	ADDI $15 0x18
	TCHBRCH :morning
	SETI $14 0xE8
	LSH $14 8
	ADDI $14 0x87
	SETI $15 0x78
	LSH $15 8
	ADDI $15 0x18
	TCHBRCH :noon
	SETI $14 0x76
	LSH $14 8
	ADDI $14 0x16
	SETI $15 0xE5
	LSH $15 8
	ADDI $15 0x87
	TCHBRCH :evening
	SETI $14 0xE8
	LSH $14 8
	ADDI $14 0x87
	SETI $15 0xE5
	LSH $15 8
	ADDI $15 0x87
	TCHBRCH :night
	SETI $11 :pane2_touch
	JMP $11
	
:morning
	WLS 6
	WAIT 256
	SETI $11 :normal
	JMP $11

:noon
	WLS 5
	WAIT 256
	SETI $11 :normal
	JMP $11

:evening
	WLS 7
	WAIT 256
	SETI $11 :normal
	JMP $11

:night
	WLS 8
	WAIT 256
	SETI $11 :normal
	JMP $11
	
	
:normal
	//BUBBLER
	SETI $10 0x24
	SETI $9 0xF4
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	SETI    $11 0xB
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x1E
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0xB
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x15
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0xE
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x1B
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $10 $9
	SETI    $11 0x18
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0xF
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	//HEATER
	SETI    $9 0x01
    LSH     $9 8
    ADDI    $9 0x10
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	SETI    $11 0x11
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0xE
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0xA
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x1D
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0xE
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x1B
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $10 $9
	SETI    $11 0x18
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0xF
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	//PUMP
	SETI    $9 0x02
    LSH     $9 8
    ADDI    $9 0xD4
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	SETI    $11 0x19
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x1E
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x16
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x19
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	//LIGHTS
	SETI    $9 0x02
    LSH     $9 8
    ADDI    $9 0xF1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	SETI    $11 0x15
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x12
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x10
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x11
	ADDI $9 1
	STOR $11 $9
	SETI    $11 0x1D
	ADDI $9 1
	STOR $11 $9 
	SETI    $11 0x1C
	ADDI $9 1
	STOR $11 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	ADDI $9 1
	STOR $10 $9
	WAIT 256
	JMP $0
	

:lights
	//MORNING
	 SETI    $10 0x24
     SETI    $9 0xF4
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 SETI    $11 0x16
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x18
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x1B
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x17
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x12
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x17
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x10
	 ADDI $9 1
	 STOR $11 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	//NOON
     SETI    $9 0x01
	 LSH $9 8
	 ADDI $9 0x10
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 SETI    $11 0x17
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x18
     ADDI $9 1
	 STOR $11 $9
     ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x17
     ADDI $9 1
	 STOR $11 $9
     ADDI $9 1
	 STOR $10 $9
     ADDI $9 1
	 STOR $10 $9
     ADDI $9 1
	 STOR $10 $9
     ADDI $9 1
	 STOR $10 $9
     ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 //EVENING
     SETI    $9 0x02
     LSH     $9 8
     ADDI    $9 0xD4
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 SETI    $11 0xE
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x1F
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0xE
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x17
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x12
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x17
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x10
	 ADDI $9 1
	 STOR $11 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 //NIGHT
     SETI    $9 0x02
     LSH     $9 8
     ADDI    $9 0xF0
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 SETI    $11 0x17
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x12
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x10
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x11
	 ADDI $9 1
	 STOR $11 $9
	 SETI    $11 0x1D
	 ADDI $9 1
	 STOR $11 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 ADDI $9 1
	 STOR $10 $9
	 WAIT 256
	 SETI $11 :pane2_touch
	 JMP $11	
	