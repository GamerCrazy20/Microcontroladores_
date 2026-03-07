
_Teclado:

;Practica4.c,47 :: 		char Teclado() {
;Practica4.c,48 :: 		char tecla = 0;
	CLRF       Teclado_tecla_L0+0
;Practica4.c,50 :: 		FILA1 = 1;
	BSF        LATA+0, 0
;Practica4.c,51 :: 		FILA2 = 0;
	BCF        LATA+0, 1
;Practica4.c,52 :: 		FILA3 = 0;
	BCF        LATA+0, 2
;Practica4.c,53 :: 		FILA4 = 0;
	BCF        LATA+0, 3
;Practica4.c,54 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_Teclado0:
	DECFSZ     R13, 1
	GOTO       L_Teclado0
	DECFSZ     R12, 1
	GOTO       L_Teclado0
	NOP
	NOP
;Practica4.c,55 :: 		if (COL1 == 1){
	BTFSS      PORTA+0, 4
	GOTO       L_Teclado1
;Practica4.c,56 :: 		tecla = '1';
	MOVLW      49
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,57 :: 		}
L_Teclado1:
;Practica4.c,58 :: 		if (COL2 == 1){
	BTFSS      PORTA+0, 6
	GOTO       L_Teclado2
;Practica4.c,59 :: 		tecla = '2';
	MOVLW      50
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,60 :: 		}
L_Teclado2:
;Practica4.c,61 :: 		if (COL3 == 1){
	BTFSS      PORTA+0, 7
	GOTO       L_Teclado3
;Practica4.c,62 :: 		tecla = '3';
	MOVLW      51
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,63 :: 		}
L_Teclado3:
;Practica4.c,65 :: 		FILA1 = 0;
	BCF        LATA+0, 0
;Practica4.c,66 :: 		FILA2 = 1;
	BSF        LATA+0, 1
;Practica4.c,67 :: 		FILA3 = 0;
	BCF        LATA+0, 2
;Practica4.c,68 :: 		FILA4 = 0;
	BCF        LATA+0, 3
;Practica4.c,70 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_Teclado4:
	DECFSZ     R13, 1
	GOTO       L_Teclado4
	DECFSZ     R12, 1
	GOTO       L_Teclado4
	NOP
	NOP
;Practica4.c,72 :: 		if (COL1 == 1) {
	BTFSS      PORTA+0, 4
	GOTO       L_Teclado5
;Practica4.c,73 :: 		tecla = '4';
	MOVLW      52
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,74 :: 		}
L_Teclado5:
;Practica4.c,75 :: 		if (COL2 == 1) {
	BTFSS      PORTA+0, 6
	GOTO       L_Teclado6
;Practica4.c,76 :: 		tecla = '5';
	MOVLW      53
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,77 :: 		}
L_Teclado6:
;Practica4.c,78 :: 		if (COL3 == 1) {
	BTFSS      PORTA+0, 7
	GOTO       L_Teclado7
;Practica4.c,79 :: 		tecla = '6';
	MOVLW      54
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,80 :: 		}
L_Teclado7:
;Practica4.c,82 :: 		FILA1 = 0;
	BCF        LATA+0, 0
;Practica4.c,83 :: 		FILA2 = 0;
	BCF        LATA+0, 1
;Practica4.c,84 :: 		FILA3 = 1;
	BSF        LATA+0, 2
;Practica4.c,85 :: 		FILA4 = 0;
	BCF        LATA+0, 3
;Practica4.c,87 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_Teclado8:
	DECFSZ     R13, 1
	GOTO       L_Teclado8
	DECFSZ     R12, 1
	GOTO       L_Teclado8
	NOP
	NOP
;Practica4.c,89 :: 		if (COL1 == 1) {
	BTFSS      PORTA+0, 4
	GOTO       L_Teclado9
;Practica4.c,90 :: 		tecla = '7';
	MOVLW      55
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,91 :: 		}
L_Teclado9:
;Practica4.c,92 :: 		if (COL2 == 1) {
	BTFSS      PORTA+0, 6
	GOTO       L_Teclado10
;Practica4.c,93 :: 		tecla = '8';
	MOVLW      56
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,94 :: 		}
L_Teclado10:
;Practica4.c,95 :: 		if (COL3 == 1) {
	BTFSS      PORTA+0, 7
	GOTO       L_Teclado11
;Practica4.c,96 :: 		tecla = '9';
	MOVLW      57
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,97 :: 		}
L_Teclado11:
;Practica4.c,99 :: 		FILA1 = 0; FILA2 = 0; FILA3 = 0; FILA4 = 1;
	BCF        LATA+0, 0
	BCF        LATA+0, 1
	BCF        LATA+0, 2
	BSF        LATA+0, 3
;Practica4.c,100 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_Teclado12:
	DECFSZ     R13, 1
	GOTO       L_Teclado12
	DECFSZ     R12, 1
	GOTO       L_Teclado12
	NOP
	NOP
;Practica4.c,101 :: 		if (COL1 == 1) {
	BTFSS      PORTA+0, 4
	GOTO       L_Teclado13
;Practica4.c,102 :: 		tecla = '*';
	MOVLW      42
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,103 :: 		}
L_Teclado13:
;Practica4.c,104 :: 		if (COL2 == 1) {
	BTFSS      PORTA+0, 6
	GOTO       L_Teclado14
;Practica4.c,105 :: 		tecla = '0';
	MOVLW      48
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,106 :: 		}
L_Teclado14:
;Practica4.c,107 :: 		if (COL3 == 1) {
	BTFSS      PORTA+0, 7
	GOTO       L_Teclado15
;Practica4.c,108 :: 		tecla = '#';
	MOVLW      35
	MOVWF      Teclado_tecla_L0+0
;Practica4.c,109 :: 		}
L_Teclado15:
;Practica4.c,111 :: 		FILA1 = 0;
	BCF        LATA+0, 0
;Practica4.c,112 :: 		FILA2 = 0;
	BCF        LATA+0, 1
;Practica4.c,113 :: 		FILA3 = 0;
	BCF        LATA+0, 2
;Practica4.c,114 :: 		FILA4 = 0;
	BCF        LATA+0, 3
;Practica4.c,116 :: 		return tecla;
	MOVF       Teclado_tecla_L0+0, 0
	MOVWF      R0
;Practica4.c,117 :: 		}
L_end_Teclado:
	RETURN
; end of _Teclado

_Pantalla_Principal:

;Practica4.c,120 :: 		void Pantalla_Principal() {
;Practica4.c,121 :: 		Lcd_Out(1, 1, "Presione * ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,122 :: 		Lcd_Out(2, 1, "Para ingresar  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr2_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,123 :: 		if (tecla_nueva == '*') {
	MOVF       _tecla_nueva+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_Pantalla_Principal16
;Practica4.c,124 :: 		estado = 1;
	MOVLW      1
	MOVWF      _estado+0
;Practica4.c,125 :: 		indice_teclas = 0;
	CLRF       _indice_teclas+0
;Practica4.c,126 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,127 :: 		}
L_Pantalla_Principal16:
;Practica4.c,128 :: 		}
L_end_Pantalla_Principal:
	RETURN
; end of _Pantalla_Principal

_Solicitud_Clave_Principal:

;Practica4.c,130 :: 		void Solicitud_Clave_Principal() {
;Practica4.c,131 :: 		Lcd_Out(1, 1, "Digite clave   ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr3_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,132 :: 		Lcd_Out(2, 1, "Acceso: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr4_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,135 :: 		if (indice_teclas > 0) {
	MOVF       _indice_teclas+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_Solicitud_Clave_Principal17
;Practica4.c,136 :: 		Lcd_Chr(2, 9, '*'); }
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Solicitud_Clave_Principal18
L_Solicitud_Clave_Principal17:
;Practica4.c,138 :: 		Lcd_Chr(2, 9, '_');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Solicitud_Clave_Principal18:
;Practica4.c,139 :: 		if (indice_teclas > 1) {
	MOVF       _indice_teclas+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_Solicitud_Clave_Principal19
;Practica4.c,140 :: 		Lcd_Chr(2, 10, '*');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Solicitud_Clave_Principal20
L_Solicitud_Clave_Principal19:
;Practica4.c,142 :: 		Lcd_Chr(2, 10, '_');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Practica4.c,143 :: 		}
L_Solicitud_Clave_Principal20:
;Practica4.c,144 :: 		if (indice_teclas > 2) {
	MOVF       _indice_teclas+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_Solicitud_Clave_Principal21
;Practica4.c,145 :: 		Lcd_Chr(2, 11, '*');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Solicitud_Clave_Principal22
L_Solicitud_Clave_Principal21:
;Practica4.c,147 :: 		Lcd_Chr(2, 11, '_');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Practica4.c,148 :: 		}
L_Solicitud_Clave_Principal22:
;Practica4.c,149 :: 		if (indice_teclas > 3) {
	MOVF       _indice_teclas+0, 0
	SUBLW      3
	BTFSC      STATUS+0, 0
	GOTO       L_Solicitud_Clave_Principal23
;Practica4.c,150 :: 		Lcd_Chr(2, 12, '*');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Solicitud_Clave_Principal24
L_Solicitud_Clave_Principal23:
;Practica4.c,152 :: 		Lcd_Chr(2, 12, '_');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Solicitud_Clave_Principal24:
;Practica4.c,154 :: 		if (tecla_nueva >= '0' && tecla_nueva <= '9') {
	MOVLW      48
	SUBWF      _tecla_nueva+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Solicitud_Clave_Principal27
	MOVF       _tecla_nueva+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_Solicitud_Clave_Principal27
L__Solicitud_Clave_Principal91:
;Practica4.c,155 :: 		buffer_teclas[indice_teclas] = tecla_nueva;
	MOVLW      _buffer_teclas+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_buffer_teclas+0)
	MOVWF      FSR1H
	MOVF       _indice_teclas+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVF       _tecla_nueva+0, 0
	MOVWF      INDF1+0
;Practica4.c,156 :: 		indice_teclas++;
	INCF       _indice_teclas+0, 1
;Practica4.c,157 :: 		if (indice_teclas == 4) {
	MOVF       _indice_teclas+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_Solicitud_Clave_Principal28
;Practica4.c,158 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11
	MOVLW      134
	MOVWF      R12
	MOVLW      153
	MOVWF      R13
L_Solicitud_Clave_Principal29:
	DECFSZ     R13, 1
	GOTO       L_Solicitud_Clave_Principal29
	DECFSZ     R12, 1
	GOTO       L_Solicitud_Clave_Principal29
	DECFSZ     R11, 1
	GOTO       L_Solicitud_Clave_Principal29
;Practica4.c,159 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,160 :: 		if (buffer_teclas[0]=='8' && buffer_teclas[1]=='0' && buffer_teclas[2]=='0' && buffer_teclas[3]=='8') {
	MOVF       _buffer_teclas+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L_Solicitud_Clave_Principal32
	MOVF       _buffer_teclas+1, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_Solicitud_Clave_Principal32
	MOVF       _buffer_teclas+2, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_Solicitud_Clave_Principal32
	MOVF       _buffer_teclas+3, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L_Solicitud_Clave_Principal32
L__Solicitud_Clave_Principal90:
;Practica4.c,161 :: 		Lcd_Out(1, 1, "Acceso correcto");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr5_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,162 :: 		Lcd_Out(2, 1, "Espere...      ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr6_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,163 :: 		Delay_ms(2000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_Solicitud_Clave_Principal33:
	DECFSZ     R13, 1
	GOTO       L_Solicitud_Clave_Principal33
	DECFSZ     R12, 1
	GOTO       L_Solicitud_Clave_Principal33
	DECFSZ     R11, 1
	GOTO       L_Solicitud_Clave_Principal33
	NOP
	NOP
;Practica4.c,164 :: 		estado = 2; //Estado para menu de ordenes
	MOVLW      2
	MOVWF      _estado+0
;Practica4.c,165 :: 		} else {
	GOTO       L_Solicitud_Clave_Principal34
L_Solicitud_Clave_Principal32:
;Practica4.c,166 :: 		Lcd_Out(1, 1, "Clave incorrecta");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr7_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,167 :: 		Lcd_Out(2, 1, "Vuelva a iniciar");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr8_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,168 :: 		Delay_ms(2000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_Solicitud_Clave_Principal35:
	DECFSZ     R13, 1
	GOTO       L_Solicitud_Clave_Principal35
	DECFSZ     R12, 1
	GOTO       L_Solicitud_Clave_Principal35
	DECFSZ     R11, 1
	GOTO       L_Solicitud_Clave_Principal35
	NOP
	NOP
;Practica4.c,169 :: 		estado = 0;
	CLRF       _estado+0
;Practica4.c,170 :: 		}
L_Solicitud_Clave_Principal34:
;Practica4.c,171 :: 		indice_teclas = 0;
	CLRF       _indice_teclas+0
;Practica4.c,172 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,173 :: 		}
L_Solicitud_Clave_Principal28:
;Practica4.c,174 :: 		}
L_Solicitud_Clave_Principal27:
;Practica4.c,175 :: 		}
L_end_Solicitud_Clave_Principal:
	RETURN
; end of _Solicitud_Clave_Principal

_Menu_Ordenes:

;Practica4.c,177 :: 		void Menu_Ordenes() {
;Practica4.c,178 :: 		Lcd_Out(1, 1, "Menu de ordenes");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr9_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,179 :: 		Lcd_Out(2, 1, "Acceso: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr10_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,181 :: 		if (indice_teclas > 0) {
	MOVF       _indice_teclas+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_Menu_Ordenes36
;Practica4.c,182 :: 		Lcd_Chr(2, 9, '*');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Menu_Ordenes37
L_Menu_Ordenes36:
;Practica4.c,184 :: 		Lcd_Chr(2, 9, '_');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Menu_Ordenes37:
;Practica4.c,185 :: 		if (indice_teclas > 1) {
	MOVF       _indice_teclas+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_Menu_Ordenes38
;Practica4.c,186 :: 		Lcd_Chr(2, 10, '*');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Menu_Ordenes39
L_Menu_Ordenes38:
;Practica4.c,188 :: 		Lcd_Chr(2, 10, '_');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Menu_Ordenes39:
;Practica4.c,189 :: 		if (indice_teclas > 2) {
	MOVF       _indice_teclas+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_Menu_Ordenes40
;Practica4.c,190 :: 		Lcd_Chr(2, 11, '*');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Menu_Ordenes41
L_Menu_Ordenes40:
;Practica4.c,192 :: 		Lcd_Chr(2, 11, '_');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Menu_Ordenes41:
;Practica4.c,193 :: 		if (indice_teclas > 3) {
	MOVF       _indice_teclas+0, 0
	SUBLW      3
	BTFSC      STATUS+0, 0
	GOTO       L_Menu_Ordenes42
;Practica4.c,194 :: 		Lcd_Chr(2, 12, '*');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_Menu_Ordenes43
L_Menu_Ordenes42:
;Practica4.c,196 :: 		Lcd_Chr(2, 12, '_');}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      95
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Menu_Ordenes43:
;Practica4.c,198 :: 		if (tecla_nueva == '#' && indice_teclas == 0) {
	MOVF       _tecla_nueva+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes46
	MOVF       _indice_teclas+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes46
L__Menu_Ordenes95:
;Practica4.c,199 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,200 :: 		Lcd_Out(1, 1, "Sin orden valida");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr11_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,201 :: 		Lcd_Out(2, 1, "No se ejecuta   ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr12_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,202 :: 		Delay_ms(2000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_Menu_Ordenes47:
	DECFSZ     R13, 1
	GOTO       L_Menu_Ordenes47
	DECFSZ     R12, 1
	GOTO       L_Menu_Ordenes47
	DECFSZ     R11, 1
	GOTO       L_Menu_Ordenes47
	NOP
	NOP
;Practica4.c,203 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,204 :: 		}
L_Menu_Ordenes46:
;Practica4.c,206 :: 		if (tecla_nueva >= '0' && tecla_nueva <= '9') {
	MOVLW      48
	SUBWF      _tecla_nueva+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Menu_Ordenes50
	MOVF       _tecla_nueva+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_Menu_Ordenes50
L__Menu_Ordenes94:
;Practica4.c,207 :: 		buffer_teclas[indice_teclas] = tecla_nueva;
	MOVLW      _buffer_teclas+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_buffer_teclas+0)
	MOVWF      FSR1H
	MOVF       _indice_teclas+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVF       _tecla_nueva+0, 0
	MOVWF      INDF1+0
;Practica4.c,208 :: 		indice_teclas++;
	INCF       _indice_teclas+0, 1
;Practica4.c,209 :: 		if (indice_teclas == 4) {
	MOVF       _indice_teclas+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes51
;Practica4.c,210 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11
	MOVLW      134
	MOVWF      R12
	MOVLW      153
	MOVWF      R13
L_Menu_Ordenes52:
	DECFSZ     R13, 1
	GOTO       L_Menu_Ordenes52
	DECFSZ     R12, 1
	GOTO       L_Menu_Ordenes52
	DECFSZ     R11, 1
	GOTO       L_Menu_Ordenes52
;Practica4.c,211 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,212 :: 		if (buffer_teclas[0]=='1' && buffer_teclas[1]=='2' && buffer_teclas[2]=='3' && buffer_teclas[3]=='4') {
	MOVF       _buffer_teclas+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes55
	MOVF       _buffer_teclas+1, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes55
	MOVF       _buffer_teclas+2, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes55
	MOVF       _buffer_teclas+3, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes55
L__Menu_Ordenes93:
;Practica4.c,213 :: 		direccion = 1; estado = 3; // Orden Derecha
	MOVLW      1
	MOVWF      _direccion+0
	MOVLW      3
	MOVWF      _estado+0
;Practica4.c,214 :: 		} else if (buffer_teclas[0]=='4' && buffer_teclas[1]=='3' && buffer_teclas[2]=='2' && buffer_teclas[3]=='1') {
	GOTO       L_Menu_Ordenes56
L_Menu_Ordenes55:
	MOVF       _buffer_teclas+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes59
	MOVF       _buffer_teclas+1, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes59
	MOVF       _buffer_teclas+2, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes59
	MOVF       _buffer_teclas+3, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_Menu_Ordenes59
L__Menu_Ordenes92:
;Practica4.c,215 :: 		direccion = 2; estado = 4; // Orden Izquierda
	MOVLW      2
	MOVWF      _direccion+0
	MOVLW      4
	MOVWF      _estado+0
;Practica4.c,216 :: 		} else {
	GOTO       L_Menu_Ordenes60
L_Menu_Ordenes59:
;Practica4.c,217 :: 		Lcd_Out(1, 1, "Orden invalida ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr13_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,218 :: 		Lcd_Out(2, 1, "Intente otra vez");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr14_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,219 :: 		Delay_ms(2000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_Menu_Ordenes61:
	DECFSZ     R13, 1
	GOTO       L_Menu_Ordenes61
	DECFSZ     R12, 1
	GOTO       L_Menu_Ordenes61
	DECFSZ     R11, 1
	GOTO       L_Menu_Ordenes61
	NOP
	NOP
;Practica4.c,220 :: 		}
L_Menu_Ordenes60:
L_Menu_Ordenes56:
;Practica4.c,221 :: 		indice_teclas = 0;
	CLRF       _indice_teclas+0
;Practica4.c,222 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,223 :: 		}
L_Menu_Ordenes51:
;Practica4.c,224 :: 		}
L_Menu_Ordenes50:
;Practica4.c,225 :: 		}
L_end_Menu_Ordenes:
	RETURN
; end of _Menu_Ordenes

_Control_Motor:

;Practica4.c,227 :: 		void Control_Motor(char dir) {
;Practica4.c,229 :: 		MOTOR_DER = 0;
	BCF        LATB+0, 6
;Practica4.c,230 :: 		MOTOR_IZQ = 0;
	BCF        LATB+0, 7
;Practica4.c,232 :: 		if (dir == 1) {
	MOVF       FARG_Control_Motor_dir+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Control_Motor62
;Practica4.c,233 :: 		Lcd_Out(1, 1, "Orden derecha   ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr15_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,234 :: 		} else {
	GOTO       L_Control_Motor63
L_Control_Motor62:
;Practica4.c,235 :: 		Lcd_Out(1, 1, "Orden izquierda ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr16_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,236 :: 		}
L_Control_Motor63:
;Practica4.c,237 :: 		Lcd_Out(2, 1, "Pulse #         ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr17_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,240 :: 		if (tecla_nueva == '#') {
	MOVF       _tecla_nueva+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_Control_Motor64
;Practica4.c,241 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,243 :: 		while(1) {
L_Control_Motor65:
;Practica4.c,245 :: 		tecla_actual = Teclado();
	CALL       _Teclado+0
	MOVF       R0, 0
	MOVWF      _tecla_actual+0
;Practica4.c,246 :: 		if (tecla_actual != 0 && tecla_actual != tecla_anterior)
	MOVF       R0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Control_Motor69
	MOVF       _tecla_actual+0, 0
	XORWF      _tecla_anterior+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Control_Motor69
L__Control_Motor96:
;Practica4.c,247 :: 		tecla_nueva = tecla_actual;
	MOVF       _tecla_actual+0, 0
	MOVWF      _tecla_nueva+0
	GOTO       L_Control_Motor70
L_Control_Motor69:
;Practica4.c,249 :: 		tecla_nueva = 0;
	CLRF       _tecla_nueva+0
L_Control_Motor70:
;Practica4.c,250 :: 		tecla_anterior = tecla_actual;
	MOVF       _tecla_actual+0, 0
	MOVWF      _tecla_anterior+0
;Practica4.c,253 :: 		if (dir == 1) {
	MOVF       FARG_Control_Motor_dir+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Control_Motor71
;Practica4.c,254 :: 		MOTOR_DER = 1; MOTOR_IZQ = 0;
	BSF        LATB+0, 6
	BCF        LATB+0, 7
;Practica4.c,255 :: 		Lcd_Out(1, 1, "Motor derecha   ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr18_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,256 :: 		} else {
	GOTO       L_Control_Motor72
L_Control_Motor71:
;Practica4.c,257 :: 		MOTOR_DER = 0; MOTOR_IZQ = 1;
	BCF        LATB+0, 6
	BSF        LATB+0, 7
;Practica4.c,258 :: 		Lcd_Out(1, 1, "Motor izquierda ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr19_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,259 :: 		}
L_Control_Motor72:
;Practica4.c,260 :: 		Lcd_Out(2, 1, "# para detener  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr20_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,263 :: 		if (tecla_nueva == '#') {
	MOVF       _tecla_nueva+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_Control_Motor73
;Practica4.c,264 :: 		MOTOR_DER = 0;
	BCF        LATB+0, 6
;Practica4.c,265 :: 		MOTOR_IZQ = 0;
	BCF        LATB+0, 7
;Practica4.c,266 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,267 :: 		Lcd_Out(1, 1, "Sistema detenido");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr21_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,268 :: 		Lcd_Out(2, 1, "Volviendo menu  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr22_Practica4+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr22_Practica4+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Practica4.c,269 :: 		Delay_ms(5000);
	MOVLW      26
	MOVWF      R11
	MOVLW      94
	MOVWF      R12
	MOVLW      110
	MOVWF      R13
L_Control_Motor74:
	DECFSZ     R13, 1
	GOTO       L_Control_Motor74
	DECFSZ     R12, 1
	GOTO       L_Control_Motor74
	DECFSZ     R11, 1
	GOTO       L_Control_Motor74
	NOP
;Practica4.c,270 :: 		estado = 0;
	CLRF       _estado+0
;Practica4.c,271 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,272 :: 		break;
	GOTO       L_Control_Motor66
;Practica4.c,273 :: 		}
L_Control_Motor73:
;Practica4.c,274 :: 		Delay_ms(20);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Control_Motor75:
	DECFSZ     R13, 1
	GOTO       L_Control_Motor75
	DECFSZ     R12, 1
	GOTO       L_Control_Motor75
	NOP
;Practica4.c,275 :: 		}
	GOTO       L_Control_Motor65
L_Control_Motor66:
;Practica4.c,276 :: 		}
L_Control_Motor64:
;Practica4.c,277 :: 		}
L_end_Control_Motor:
	RETURN
; end of _Control_Motor

_Init_Sistema:

;Practica4.c,279 :: 		void Init_Sistema(){
;Practica4.c,280 :: 		OSCCON = 0b01101000; // clock 4MHZ
	MOVLW      104
	MOVWF      OSCCON+0
;Practica4.c,281 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;Practica4.c,282 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;Practica4.c,283 :: 		TRISA = 0b11010000;
	MOVLW      208
	MOVWF      TRISA+0
;Practica4.c,284 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Practica4.c,285 :: 		LATA = 0x00;
	CLRF       LATA+0
;Practica4.c,286 :: 		LATB = 0x00;
	CLRF       LATB+0
;Practica4.c,287 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Practica4.c,288 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,289 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica4.c,290 :: 		}
L_end_Init_Sistema:
	RETURN
; end of _Init_Sistema

_main:

;Practica4.c,292 :: 		void main() {
;Practica4.c,293 :: 		Init_Sistema();
	CALL       _Init_Sistema+0
;Practica4.c,294 :: 		while(1) {
L_main76:
;Practica4.c,295 :: 		tecla_actual = Teclado();
	CALL       _Teclado+0
	MOVF       R0, 0
	MOVWF      _tecla_actual+0
;Practica4.c,297 :: 		if (tecla_actual != 0 && tecla_actual != tecla_anterior) {
	MOVF       R0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main80
	MOVF       _tecla_actual+0, 0
	XORWF      _tecla_anterior+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main80
L__main97:
;Practica4.c,298 :: 		tecla_nueva = tecla_actual;
	MOVF       _tecla_actual+0, 0
	MOVWF      _tecla_nueva+0
;Practica4.c,299 :: 		} else {
	GOTO       L_main81
L_main80:
;Practica4.c,300 :: 		tecla_nueva = 0;
	CLRF       _tecla_nueva+0
;Practica4.c,301 :: 		}
L_main81:
;Practica4.c,302 :: 		tecla_anterior = tecla_actual;
	MOVF       _tecla_actual+0, 0
	MOVWF      _tecla_anterior+0
;Practica4.c,304 :: 		switch (estado) {
	GOTO       L_main82
;Practica4.c,305 :: 		case 0: Pantalla_Principal(); break;
L_main84:
	CALL       _Pantalla_Principal+0
	GOTO       L_main83
;Practica4.c,306 :: 		case 1: Solicitud_Clave_Principal(); break;
L_main85:
	CALL       _Solicitud_Clave_Principal+0
	GOTO       L_main83
;Practica4.c,307 :: 		case 2: Menu_Ordenes(); break;
L_main86:
	CALL       _Menu_Ordenes+0
	GOTO       L_main83
;Practica4.c,308 :: 		case 3: Control_Motor(1); break; // Caso Derecha
L_main87:
	MOVLW      1
	MOVWF      FARG_Control_Motor_dir+0
	CALL       _Control_Motor+0
	GOTO       L_main83
;Practica4.c,309 :: 		case 4: Control_Motor(2); break; // Caso Izquierda
L_main88:
	MOVLW      2
	MOVWF      FARG_Control_Motor_dir+0
	CALL       _Control_Motor+0
	GOTO       L_main83
;Practica4.c,310 :: 		}
L_main82:
	MOVF       _estado+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main84
	MOVF       _estado+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main85
	MOVF       _estado+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main86
	MOVF       _estado+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main87
	MOVF       _estado+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main88
L_main83:
;Practica4.c,311 :: 		Delay_ms(20);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_main89:
	DECFSZ     R13, 1
	GOTO       L_main89
	DECFSZ     R12, 1
	GOTO       L_main89
	NOP
;Practica4.c,312 :: 		}
	GOTO       L_main76
;Practica4.c,313 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
