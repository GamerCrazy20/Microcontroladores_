
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Practica2_labmicro.c,40 :: 		void Interrupt() {
;Practica2_labmicro.c,41 :: 		if (T0IF_bit == 1) {
	BTFSS      T0IF_bit+0, BitPos(T0IF_bit+0)
	GOTO       L_Interrupt0
;Practica2_labmicro.c,42 :: 		TMR0 = 131;
	MOVLW      131
	MOVWF      TMR0+0
;Practica2_labmicro.c,43 :: 		T0IF_bit = 0;
	BCF        T0IF_bit+0, BitPos(T0IF_bit+0)
;Practica2_labmicro.c,45 :: 		milisegundos++;
	INCF       _milisegundos+0, 1
	BTFSC      STATUS+0, 2
	INCF       _milisegundos+1, 1
;Practica2_labmicro.c,46 :: 		if (milisegundos >= 1000) {
	MOVLW      128
	XORWF      _milisegundos+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt54
	MOVLW      232
	SUBWF      _milisegundos+0, 0
L__Interrupt54:
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt1
;Practica2_labmicro.c,47 :: 		milisegundos = 0;
	CLRF       _milisegundos+0
	CLRF       _milisegundos+1
;Practica2_labmicro.c,48 :: 		paso_un_segundo = 1;
	MOVLW      1
	MOVWF      _paso_un_segundo+0
	MOVLW      0
	MOVWF      _paso_un_segundo+1
;Practica2_labmicro.c,49 :: 		}
L_Interrupt1:
;Practica2_labmicro.c,50 :: 		}
L_Interrupt0:
;Practica2_labmicro.c,51 :: 		}
L_end_Interrupt:
L__Interrupt53:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_teclado:

;Practica2_labmicro.c,54 :: 		char teclado() {
;Practica2_labmicro.c,56 :: 		char tecla = 0;
	CLRF       teclado_tecla_L0+0
;Practica2_labmicro.c,58 :: 		lectura_adc = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      teclado_lectura_adc_L0+0
	MOVF       R0+1, 0
	MOVWF      teclado_lectura_adc_L0+1
;Practica2_labmicro.c,61 :: 		if (lectura_adc > 861) {
	MOVLW      128
	XORLW      3
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__teclado56
	MOVF       R0+0, 0
	SUBLW      93
L__teclado56:
	BTFSC      STATUS+0, 0
	GOTO       L_teclado2
;Practica2_labmicro.c,62 :: 		tecla = 4; // boton STOP / SET
	MOVLW      4
	MOVWF      teclado_tecla_L0+0
;Practica2_labmicro.c,63 :: 		}
	GOTO       L_teclado3
L_teclado2:
;Practica2_labmicro.c,64 :: 		else if (lectura_adc > 581) {
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      teclado_lectura_adc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__teclado57
	MOVF       teclado_lectura_adc_L0+0, 0
	SUBLW      69
L__teclado57:
	BTFSC      STATUS+0, 0
	GOTO       L_teclado4
;Practica2_labmicro.c,65 :: 		tecla = 1; // boton +
	MOVLW      1
	MOVWF      teclado_tecla_L0+0
;Practica2_labmicro.c,66 :: 		}
	GOTO       L_teclado5
L_teclado4:
;Practica2_labmicro.c,67 :: 		else if (lectura_adc > 351) {
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      teclado_lectura_adc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__teclado58
	MOVF       teclado_lectura_adc_L0+0, 0
	SUBLW      95
L__teclado58:
	BTFSC      STATUS+0, 0
	GOTO       L_teclado6
;Practica2_labmicro.c,68 :: 		tecla = 2; // boton -
	MOVLW      2
	MOVWF      teclado_tecla_L0+0
;Practica2_labmicro.c,69 :: 		}
	GOTO       L_teclado7
L_teclado6:
;Practica2_labmicro.c,70 :: 		else if (lectura_adc > 101) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      teclado_lectura_adc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__teclado59
	MOVF       teclado_lectura_adc_L0+0, 0
	SUBLW      101
L__teclado59:
	BTFSC      STATUS+0, 0
	GOTO       L_teclado8
;Practica2_labmicro.c,71 :: 		tecla = 3; // boton START
	MOVLW      3
	MOVWF      teclado_tecla_L0+0
;Practica2_labmicro.c,72 :: 		}
	GOTO       L_teclado9
L_teclado8:
;Practica2_labmicro.c,74 :: 		tecla = 0; // ningun boton
	CLRF       teclado_tecla_L0+0
;Practica2_labmicro.c,75 :: 		}
L_teclado9:
L_teclado7:
L_teclado5:
L_teclado3:
;Practica2_labmicro.c,77 :: 		Delay_ms(20); // Anti rebote para estabilizar la señal
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_teclado10:
	DECFSZ     R13+0, 1
	GOTO       L_teclado10
	DECFSZ     R12+0, 1
	GOTO       L_teclado10
	NOP
;Practica2_labmicro.c,80 :: 		if (tecla == tecla_anterior) {
	MOVF       teclado_tecla_L0+0, 0
	XORWF      _tecla_anterior+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_teclado11
;Practica2_labmicro.c,81 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_teclado
;Practica2_labmicro.c,82 :: 		}
L_teclado11:
;Practica2_labmicro.c,84 :: 		tecla_anterior = tecla;
	MOVF       teclado_tecla_L0+0, 0
	MOVWF      _tecla_anterior+0
;Practica2_labmicro.c,86 :: 		if (tecla != 0) {
	MOVF       teclado_tecla_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_teclado12
;Practica2_labmicro.c,88 :: 		if (tecla == 3 || tecla == 4) {
	MOVF       teclado_tecla_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__teclado48
	MOVF       teclado_tecla_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__teclado48
	GOTO       L_teclado15
L__teclado48:
;Practica2_labmicro.c,89 :: 		Salida_Buzzer = 1;
	BSF        PORTC+0, 7
;Practica2_labmicro.c,90 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_teclado16:
	DECFSZ     R13+0, 1
	GOTO       L_teclado16
	DECFSZ     R12+0, 1
	GOTO       L_teclado16
	NOP
	NOP
;Practica2_labmicro.c,91 :: 		Salida_Buzzer = 0;
	BCF        PORTC+0, 7
;Practica2_labmicro.c,92 :: 		}
L_teclado15:
;Practica2_labmicro.c,93 :: 		return tecla;
	MOVF       teclado_tecla_L0+0, 0
	MOVWF      R0+0
	GOTO       L_end_teclado
;Practica2_labmicro.c,94 :: 		}
L_teclado12:
;Practica2_labmicro.c,96 :: 		return 0;
	CLRF       R0+0
;Practica2_labmicro.c,97 :: 		}
L_end_teclado:
	RETURN
; end of _teclado

_Init:

;Practica2_labmicro.c,99 :: 		void Init(){
;Practica2_labmicro.c,100 :: 		OSCCON = 0b01100111; // Oscilador 4MHz
	MOVLW      103
	MOVWF      OSCCON+0
;Practica2_labmicro.c,101 :: 		ANSEL = 0b00000001;
	MOVLW      1
	MOVWF      ANSEL+0
;Practica2_labmicro.c,102 :: 		ANSELH = 0x00;
	CLRF       ANSELH+0
;Practica2_labmicro.c,104 :: 		TRISA = 0b00000001;
	MOVLW      1
	MOVWF      TRISA+0
;Practica2_labmicro.c,105 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Practica2_labmicro.c,106 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Practica2_labmicro.c,108 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;Practica2_labmicro.c,109 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Practica2_labmicro.c,110 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;Practica2_labmicro.c,113 :: 		OPTION_REG = 0b00000010;
	MOVLW      2
	MOVWF      OPTION_REG+0
;Practica2_labmicro.c,114 :: 		TMR0 = 131;
	MOVLW      131
	MOVWF      TMR0+0
;Practica2_labmicro.c,115 :: 		INTCON.T0IE = 1;
	BSF        INTCON+0, 5
;Practica2_labmicro.c,116 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;Practica2_labmicro.c,118 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Practica2_labmicro.c,119 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica2_labmicro.c,120 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica2_labmicro.c,121 :: 		}
L_end_Init:
	RETURN
; end of _Init

_Estado_Set:

;Practica2_labmicro.c,125 :: 		void Estado_Set() {
;Practica2_labmicro.c,126 :: 		Lcd_Out(1, 1, "Set:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,127 :: 		Lcd_Out(2, 1, "Ajuste el tiempo");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,130 :: 		if (tecla_pulsada == 1 && setpoint < 999){
	MOVF       _tecla_pulsada+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Set19
	MOVLW      128
	XORWF      _setpoint+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Set62
	MOVLW      231
	SUBWF      _setpoint+0, 0
L__Estado_Set62:
	BTFSC      STATUS+0, 0
	GOTO       L_Estado_Set19
L__Estado_Set51:
;Practica2_labmicro.c,131 :: 		setpoint++;
	INCF       _setpoint+0, 1
	BTFSC      STATUS+0, 2
	INCF       _setpoint+1, 1
;Practica2_labmicro.c,132 :: 		}
L_Estado_Set19:
;Practica2_labmicro.c,133 :: 		if (tecla_pulsada == 2 && setpoint > 0) {
	MOVF       _tecla_pulsada+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Set22
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _setpoint+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Set63
	MOVF       _setpoint+0, 0
	SUBLW      0
L__Estado_Set63:
	BTFSC      STATUS+0, 0
	GOTO       L_Estado_Set22
L__Estado_Set50:
;Practica2_labmicro.c,134 :: 		setpoint--;
	MOVLW      1
	SUBWF      _setpoint+0, 1
	BTFSS      STATUS+0, 0
	DECF       _setpoint+1, 1
;Practica2_labmicro.c,135 :: 		}
L_Estado_Set22:
;Practica2_labmicro.c,138 :: 		if (tecla_pulsada == 3 && setpoint > 0) {
	MOVF       _tecla_pulsada+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Set25
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _setpoint+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Set64
	MOVF       _setpoint+0, 0
	SUBLW      0
L__Estado_Set64:
	BTFSC      STATUS+0, 0
	GOTO       L_Estado_Set25
L__Estado_Set49:
;Practica2_labmicro.c,139 :: 		contador = 0;
	CLRF       _contador+0
	CLRF       _contador+1
;Practica2_labmicro.c,140 :: 		en_pausa = 0;
	CLRF       _en_pausa+0
	CLRF       _en_pausa+1
;Practica2_labmicro.c,141 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica2_labmicro.c,142 :: 		estado = 1; // Ir a RUN
	MOVLW      1
	MOVWF      _estado+0
	MOVLW      0
	MOVWF      _estado+1
;Practica2_labmicro.c,143 :: 		}
L_Estado_Set25:
;Practica2_labmicro.c,146 :: 		IntToStr(setpoint, texto_numero);
	MOVF       _setpoint+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _setpoint+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto_numero+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Practica2_labmicro.c,147 :: 		Lcd_Out(1, 6, Ltrim(texto_numero));
	MOVLW      _texto_numero+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,148 :: 		Lcd_Out_Cp(" s  ");
	MOVLW      ?lstr3_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;Practica2_labmicro.c,149 :: 		}
L_end_Estado_Set:
	RETURN
; end of _Estado_Set

_Estado_Run:

;Practica2_labmicro.c,151 :: 		void Estado_Run() {
;Practica2_labmicro.c,153 :: 		Lcd_Out(1, 1, "Set:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,154 :: 		IntToStr(setpoint, texto_numero);
	MOVF       _setpoint+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _setpoint+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto_numero+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Practica2_labmicro.c,155 :: 		Lcd_Out(1, 6, Ltrim(texto_numero));
	MOVLW      _texto_numero+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,156 :: 		Lcd_Out_Cp(" s  ");
	MOVLW      ?lstr5_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;Practica2_labmicro.c,159 :: 		if (tecla_pulsada == 3) {
	MOVF       _tecla_pulsada+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Run26
;Practica2_labmicro.c,160 :: 		if (en_pausa == 0){
	MOVLW      0
	XORWF      _en_pausa+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Run66
	MOVLW      0
	XORWF      _en_pausa+0, 0
L__Estado_Run66:
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Run27
;Practica2_labmicro.c,161 :: 		en_pausa = 1;
	MOVLW      1
	MOVWF      _en_pausa+0
	MOVLW      0
	MOVWF      _en_pausa+1
;Practica2_labmicro.c,162 :: 		}
	GOTO       L_Estado_Run28
L_Estado_Run27:
;Practica2_labmicro.c,164 :: 		en_pausa = 0;
	CLRF       _en_pausa+0
	CLRF       _en_pausa+1
;Practica2_labmicro.c,165 :: 		}
L_Estado_Run28:
;Practica2_labmicro.c,166 :: 		}
L_Estado_Run26:
;Practica2_labmicro.c,169 :: 		if (tecla_pulsada == 4) {
	MOVF       _tecla_pulsada+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Run29
;Practica2_labmicro.c,170 :: 		contador = 0;
	CLRF       _contador+0
	CLRF       _contador+1
;Practica2_labmicro.c,171 :: 		en_pausa = 0;
	CLRF       _en_pausa+0
	CLRF       _en_pausa+1
;Practica2_labmicro.c,172 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica2_labmicro.c,173 :: 		estado = 0; // Volver para el set
	CLRF       _estado+0
	CLRF       _estado+1
;Practica2_labmicro.c,174 :: 		return;
	GOTO       L_end_Estado_Run
;Practica2_labmicro.c,175 :: 		}
L_Estado_Run29:
;Practica2_labmicro.c,178 :: 		if (en_pausa == 0) {
	MOVLW      0
	XORWF      _en_pausa+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Run67
	MOVLW      0
	XORWF      _en_pausa+0, 0
L__Estado_Run67:
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Run30
;Practica2_labmicro.c,179 :: 		Lcd_Out(2, 1, "Run:   ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,180 :: 		} else {
	GOTO       L_Estado_Run31
L_Estado_Run30:
;Practica2_labmicro.c,181 :: 		Lcd_Out(2, 1, "Pausa: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,182 :: 		}
L_Estado_Run31:
;Practica2_labmicro.c,185 :: 		IntToStr(contador, texto_numero);
	MOVF       _contador+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _contador+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _texto_numero+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Practica2_labmicro.c,186 :: 		Lcd_Out(2, 8, Ltrim(texto_numero));
	MOVLW      _texto_numero+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,187 :: 		Lcd_Out_Cp(" s  ");
	MOVLW      ?lstr8_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;Practica2_labmicro.c,190 :: 		if (paso_un_segundo == 1) {
	MOVLW      0
	XORWF      _paso_un_segundo+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Run68
	MOVLW      1
	XORWF      _paso_un_segundo+0, 0
L__Estado_Run68:
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Run32
;Practica2_labmicro.c,191 :: 		paso_un_segundo = 0;
	CLRF       _paso_un_segundo+0
	CLRF       _paso_un_segundo+1
;Practica2_labmicro.c,193 :: 		if (en_pausa == 0) {
	MOVLW      0
	XORWF      _en_pausa+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Run69
	MOVLW      0
	XORWF      _en_pausa+0, 0
L__Estado_Run69:
	BTFSS      STATUS+0, 2
	GOTO       L_Estado_Run33
;Practica2_labmicro.c,194 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;Practica2_labmicro.c,197 :: 		if (contador >= setpoint) {
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _setpoint+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Estado_Run70
	MOVF       _setpoint+0, 0
	SUBWF      _contador+0, 0
L__Estado_Run70:
	BTFSS      STATUS+0, 0
	GOTO       L_Estado_Run34
;Practica2_labmicro.c,198 :: 		Salida_Relay = 1;
	BSF        PORTC+0, 6
;Practica2_labmicro.c,199 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica2_labmicro.c,200 :: 		estado = 2;
	MOVLW      2
	MOVWF      _estado+0
	MOVLW      0
	MOVWF      _estado+1
;Practica2_labmicro.c,203 :: 		Salida_Buzzer=1;
	BSF        PORTC+0, 7
;Practica2_labmicro.c,204 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Estado_Run35:
	DECFSZ     R13+0, 1
	GOTO       L_Estado_Run35
	DECFSZ     R12+0, 1
	GOTO       L_Estado_Run35
	DECFSZ     R11+0, 1
	GOTO       L_Estado_Run35
	NOP
;Practica2_labmicro.c,205 :: 		Salida_Buzzer=0;
	BCF        PORTC+0, 7
;Practica2_labmicro.c,206 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Estado_Run36:
	DECFSZ     R13+0, 1
	GOTO       L_Estado_Run36
	DECFSZ     R12+0, 1
	GOTO       L_Estado_Run36
	DECFSZ     R11+0, 1
	GOTO       L_Estado_Run36
	NOP
;Practica2_labmicro.c,207 :: 		Salida_Buzzer=1;
	BSF        PORTC+0, 7
;Practica2_labmicro.c,208 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Estado_Run37:
	DECFSZ     R13+0, 1
	GOTO       L_Estado_Run37
	DECFSZ     R12+0, 1
	GOTO       L_Estado_Run37
	DECFSZ     R11+0, 1
	GOTO       L_Estado_Run37
	NOP
;Practica2_labmicro.c,209 :: 		Salida_Buzzer=0;
	BCF        PORTC+0, 7
;Practica2_labmicro.c,210 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Estado_Run38:
	DECFSZ     R13+0, 1
	GOTO       L_Estado_Run38
	DECFSZ     R12+0, 1
	GOTO       L_Estado_Run38
	DECFSZ     R11+0, 1
	GOTO       L_Estado_Run38
	NOP
;Practica2_labmicro.c,211 :: 		Salida_Buzzer=1;
	BSF        PORTC+0, 7
;Practica2_labmicro.c,212 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Estado_Run39:
	DECFSZ     R13+0, 1
	GOTO       L_Estado_Run39
	DECFSZ     R12+0, 1
	GOTO       L_Estado_Run39
	DECFSZ     R11+0, 1
	GOTO       L_Estado_Run39
	NOP
;Practica2_labmicro.c,213 :: 		Salida_Buzzer=0;
	BCF        PORTC+0, 7
;Practica2_labmicro.c,214 :: 		}
L_Estado_Run34:
;Practica2_labmicro.c,215 :: 		}
L_Estado_Run33:
;Practica2_labmicro.c,216 :: 		}
L_Estado_Run32:
;Practica2_labmicro.c,217 :: 		}
L_end_Estado_Run:
	RETURN
; end of _Estado_Run

_Estado_Done:

;Practica2_labmicro.c,219 :: 		void Estado_Done() {
;Practica2_labmicro.c,220 :: 		Lcd_Out(1, 1, "TIEMPO TERMINADO");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,221 :: 		Lcd_Out(2, 1, "FIN");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Practica2_labmicro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica2_labmicro.c,224 :: 		if (tecla_pulsada != 0) {
	MOVF       _tecla_pulsada+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Estado_Done40
;Practica2_labmicro.c,225 :: 		Salida_Relay = 0; // Seguridad de relay
	BCF        PORTC+0, 6
;Practica2_labmicro.c,226 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica2_labmicro.c,227 :: 		estado = 0; // volver a SET
	CLRF       _estado+0
	CLRF       _estado+1
;Practica2_labmicro.c,228 :: 		}
L_Estado_Done40:
;Practica2_labmicro.c,229 :: 		}
L_end_Estado_Done:
	RETURN
; end of _Estado_Done

_main:

;Practica2_labmicro.c,231 :: 		void main() {
;Practica2_labmicro.c,232 :: 		Init();
	CALL       _Init+0
;Practica2_labmicro.c,234 :: 		while(1) {
L_main41:
;Practica2_labmicro.c,236 :: 		tecla_pulsada = teclado();
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      _tecla_pulsada+0
;Practica2_labmicro.c,239 :: 		if (estado == 0) {
	MOVLW      0
	XORWF      _estado+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      0
	XORWF      _estado+0, 0
L__main73:
	BTFSS      STATUS+0, 2
	GOTO       L_main43
;Practica2_labmicro.c,240 :: 		Estado_Set();
	CALL       _Estado_Set+0
;Practica2_labmicro.c,241 :: 		}
	GOTO       L_main44
L_main43:
;Practica2_labmicro.c,242 :: 		else if (estado == 1) {
	MOVLW      0
	XORWF      _estado+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main74
	MOVLW      1
	XORWF      _estado+0, 0
L__main74:
	BTFSS      STATUS+0, 2
	GOTO       L_main45
;Practica2_labmicro.c,243 :: 		Estado_Run();
	CALL       _Estado_Run+0
;Practica2_labmicro.c,244 :: 		}
	GOTO       L_main46
L_main45:
;Practica2_labmicro.c,245 :: 		else if (estado == 2) {
	MOVLW      0
	XORWF      _estado+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      2
	XORWF      _estado+0, 0
L__main75:
	BTFSS      STATUS+0, 2
	GOTO       L_main47
;Practica2_labmicro.c,246 :: 		Estado_Done();
	CALL       _Estado_Done+0
;Practica2_labmicro.c,247 :: 		}
L_main47:
L_main46:
L_main44:
;Practica2_labmicro.c,248 :: 		}
	GOTO       L_main41
;Practica2_labmicro.c,249 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
