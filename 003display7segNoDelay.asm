COUNT RES 1	;Criando 1 variável de 8bits na RAM
	ORG 0x00	;Ajustando início do código para o endereço 0x00
INIT:
	BCF STATUS,RP1	;Limpando bit RP1 do registrador STATUS
	BSF STATUS,RP0	;bit RP0=1 (com estas duas linhas, o banco 1 foi selecionado)
	CLRF TRISB	;TRISB=0 para portB ser OUTPUT
	MOVLW 0x06	
	MOVWF ADCON1	;ADCON1 = 0X06 deixa todos os pinos como OUTPUT
	BCF STATUS,RP0	;Selecionando Banco 0
	CLRF PORTB	;Limpando eventual cachê do POrtB
	;CLRF COUNT	;Limpando conteúdo da variável criada
	CLRW		;Limpando W
LOOP:
	MOVLW 0x0F	
	ANDWF COUNT,0	;Serve para que a variável COUNT não ultrapsse 15
	CALL SEVENSEG_LUT
	MOVWF PORTB	;Enviando o conteúdo de W para o portB para ligar os segmentos do diplay
	INCF COUNT,1 	;Incrementando a variável COUNT para o início de um novo LOOP
	GOTO LOOP	
SEVENSEG_LUT:	;Tabela com os valores dos segmentos em hexadecimal
	ADDWF PCL,1	;Adicionando o valor do working register no Program Counter para que ele pegue o próximo valor em cada iteração 
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