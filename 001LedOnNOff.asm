INIT:
	ORG 0X00
	BCF STATUS,RP1
	BSF STATUS,RP0
	MOVLW 0x06
	MOVWF ADCON1
	CLRF TRISB
	BCF STATUS,RP0
	MOVLW 0x55
	MOVWF PORTB
LOOP:
	COMF PORTB,1
	GOTO LOOP