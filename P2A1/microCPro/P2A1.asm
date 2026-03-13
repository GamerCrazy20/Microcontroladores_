
_Init_Sistema:

;P2A1.c,29 :: 		void Init_Sistema() {
;P2A1.c,32 :: 		OSCCON = 0b01100111; // Clock 4MHz
	MOVLW      103
	MOVWF      OSCCON+0
;P2A1.c,36 :: 		ANSEL = 0b00000001;
	MOVLW      1
	MOVWF      ANSEL+0
;P2A1.c,37 :: 		ANSELH = 0x00;
	CLRF       ANSELH+0
;P2A1.c,39 :: 		TRISA = 0b00000001;
	MOVLW      1
	MOVWF      TRISA+0
;P2A1.c,40 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;P2A1.c,41 :: 		TRISC = 0b00100000; // El RC5 sea entrada
	MOVLW      32
	MOVWF      TRISC+0
;P2A1.c,43 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;P2A1.c,44 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;P2A1.c,45 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;P2A1.c,47 :: 		ADC_Init();
	CALL       _ADC_Init+0
;P2A1.c,48 :: 		}
L_end_Init_Sistema:
	RETURN
; end of _Init_Sistema

_main:

;P2A1.c,50 :: 		void main() {
;P2A1.c,51 :: 		Init_Sistema();
	CALL       _Init_Sistema+0
;P2A1.c,53 :: 		while(1) {
L_main0:
;P2A1.c,57 :: 		if (BOTON == 1) {
	BTFSS      PORTC+0, 5
	GOTO       L_main2
;P2A1.c,58 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;P2A1.c,59 :: 		activo = !activo;
	MOVF       _activo+0, 0
	IORWF      _activo+1, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _activo+0
	MOVWF      _activo+1
	MOVLW      0
	MOVWF      _activo+1
;P2A1.c,60 :: 		while (BOTON == 1);
L_main4:
	BTFSS      PORTC+0, 5
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;P2A1.c,61 :: 		}
L_main2:
;P2A1.c,63 :: 		if (activo == 1) {
	MOVLW      0
	XORWF      _activo+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      1
	XORWF      _activo+0, 0
L__main19:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;P2A1.c,64 :: 		valor_adc = ADC_Read(0); // Lectura del ADC
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valor_adc+0
	MOVF       R0+1, 0
	MOVWF      _valor_adc+1
;P2A1.c,67 :: 		PORTC = 0b11100000;
	MOVLW      224
	MOVWF      PORTC+0
;P2A1.c,69 :: 		if (valor_adc < 205) { // 0 a 1 V
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      205
	SUBWF      R0+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;P2A1.c,70 :: 		LED0 = 1;
	BSF        PORTC+0, 0
;P2A1.c,71 :: 		}
	GOTO       L_main8
L_main7:
;P2A1.c,72 :: 		else if (valor_adc < 410){  // 1 a 2 V
	MOVLW      128
	XORWF      _valor_adc+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      154
	SUBWF      _valor_adc+0, 0
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;P2A1.c,73 :: 		LED1 = 1;}
	BSF        PORTC+0, 1
	GOTO       L_main10
L_main9:
;P2A1.c,74 :: 		else if (valor_adc < 615){  // 2 a 3V
	MOVLW      128
	XORWF      _valor_adc+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      103
	SUBWF      _valor_adc+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;P2A1.c,75 :: 		LED2 = 1;}
	BSF        PORTC+0, 2
	GOTO       L_main12
L_main11:
;P2A1.c,76 :: 		else if (valor_adc < 820){  // 3 a 4V
	MOVLW      128
	XORWF      _valor_adc+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      52
	SUBWF      _valor_adc+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;P2A1.c,77 :: 		LED3 = 1;}
	BSF        PORTC+0, 3
	GOTO       L_main14
L_main13:
;P2A1.c,79 :: 		LED4 = 1;
	BSF        PORTC+0, 4
;P2A1.c,80 :: 		}
L_main14:
L_main12:
L_main10:
L_main8:
;P2A1.c,82 :: 		} else {
	GOTO       L_main15
L_main6:
;P2A1.c,84 :: 		PORTC = 0b11100000; // Para apagar todo
	MOVLW      224
	MOVWF      PORTC+0
;P2A1.c,85 :: 		}
L_main15:
;P2A1.c,87 :: 		Delay_ms(20);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
;P2A1.c,88 :: 		}
	GOTO       L_main0
;P2A1.c,89 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
