COUNT RES 1	;Criando 1 vari�vel de 8bits na RAM
	ORG 0x00	;Ajustando in�cio do c�digo para o endere�o 0x00
INIT:
	BCF STATUS,RP1	;Limpando bit RP1 do registrador STATUS
	BSF STATUS,RP0	;bit RP0=1 (com estas duas linhas, o banco 1 foi selecionado)
	CLRF TRISB	;TRISB=0 para portB ser OUTPUT
	MOVLW 0x06	
	MOVWF ADCON1	;ADCON1 = 0X06 deixa todos os pinos como OUTPUT
	BCF STATUS,RP0	;Selecionando Banco 0
	CLRF PORTB	;Limpando eventual cach� do POrtB
	;CLRF COUNT	;Limpando conte�do da vari�vel criada
	CLRW		;Limpando W
LOOP:
	MOVLW 0x0F	
	ANDWF COUNT,0	;Serve para que a vari�vel COUNT n�o ultrapsse 15
	CALL SEVENSEG_LUT
	MOVWF PORTB	;Enviando o conte�do de W para o portB para ligar os segmentos do diplay
	INCF COUNT,1 	;Incrementando a vari�vel COUNT para o in�cio de um novo LOOP
	GOTO LOOP	
SEVENSEG_LUT:	;Tabela com os valores dos segmentos em hexadecimal
	ADDWF PCL,1	;Adicionando o valor do working register no Program Counter para que ele pegue o pr�ximo valor em cada itera��o 
	RETLW 0x3F
	RETLW 0x06
	RETLW 0x5B
	RETLW 0x4F
	RETLW 0x66
	RETLW 0x6D
	RETLW 0x7D
	RETLW 0x07
	RETLW 0x7F
	RETLW 0x6F
	RETLW 0x77
	RETLW 0x7C
	RETLW 0x39
	RETLW 0x5E
	RETLW 0x79
	RETLW 0x71