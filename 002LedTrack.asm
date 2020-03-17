INIT:
	ORG 0x00
	BCF STATUS,RP1	;Limpando bit RP1 do registrador STATUS
	BSF STATUS,RP0	;bit RP0=1 (com estas duas linhas, o banco 1 foi selecionado)
	CLRF TRISB	;TRISB=0 para portB ser OUTPUT
	MOVLW 0x06	
	MOVWF ADCON1	;ADCON1 = 0X06 deixa todos os pinos como OUTPUT
	BCF STATUS,RP0	;Selecionando Banco 0
	CLRF PORTB	;Limpando eventual cachê do POrtB
	MOVLW 0x80	
	MOVWF PORTB	;Iniciando PORT B/PIN 7 
LOOP:
	BTFSC PORTB,0
	GOTO RELOOP	;Adicionando 2 instruções a mais para melhorar o display estéticamente
	RRF PORTB,1	;Deslocando a direita os bits do PORT B
	GOTO LOOP
RELOOP:
	MOVWF PORTB
	GOTO LOOP