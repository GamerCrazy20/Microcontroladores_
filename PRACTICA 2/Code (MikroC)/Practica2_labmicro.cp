#line 1 "C:/Users/alber/OneDrive/Documentos/Pucmm/LAB MICROCONTROLADORES/PRACTICA 2/Code (MikroC)/Practica2_labmicro.c"
#line 9 "C:/Users/alber/OneDrive/Documentos/Pucmm/LAB MICROCONTROLADORES/PRACTICA 2/Code (MikroC)/Practica2_labmicro.c"
sbit LCD_RS at RC4_bit;
sbit LCD_EN at RC5_bit;
sbit LCD_D7 at RC3_bit;
sbit LCD_D6 at RC2_bit;
sbit LCD_D5 at RC1_bit;
sbit LCD_D4 at RC0_bit;

sbit LCD_RS_Direction at TRISC4_bit;
sbit LCD_EN_Direction at TRISC5_bit;
sbit LCD_D7_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC0_bit;


sbit Salida_Relay at PORTC.B6;
sbit Salida_Buzzer at PORTC.B7;


int estado = 0;
int setpoint = 0;
int contador = 0;
int milisegundos = 0;
int paso_un_segundo = 0;
int en_pausa = 0;

char texto_numero[7];
char tecla_pulsada = 0;
char tecla_anterior = 0;


void Interrupt() {
 if (T0IF_bit == 1) {
 TMR0 = 131;
 T0IF_bit = 0;

 milisegundos++;
 if (milisegundos >= 1000) {
 milisegundos = 0;
 paso_un_segundo = 1;
 }
 }
}


char teclado() {
 int lectura_adc;
 char tecla = 0;

 lectura_adc = ADC_Read(0);


 if (lectura_adc > 861) {
 tecla = 4;
 }
 else if (lectura_adc > 581) {
 tecla = 1;
 }
 else if (lectura_adc > 351) {
 tecla = 2;
 }
 else if (lectura_adc > 101) {
 tecla = 3;
 }
 else {
 tecla = 0;
 }

 Delay_ms(20);


 if (tecla == tecla_anterior) {
 return 0;
 }

 tecla_anterior = tecla;

 if (tecla != 0) {

 if (tecla == 3 || tecla == 4) {
 Salida_Buzzer = 1;
 Delay_ms(100);
 Salida_Buzzer = 0;
 }
 return tecla;
 }

 return 0;
}

void Init(){
 OSCCON = 0b01100111;
 ANSEL = 0b00000001;
 ANSELH = 0x00;

 TRISA = 0b00000001;
 TRISB = 0x00;
 TRISC = 0x00;

 PORTA = 0x00;
 PORTB = 0x00;
 PORTC = 0x00;


 OPTION_REG = 0b00000010;
 TMR0 = 131;
 INTCON.T0IE = 1;
 INTCON.GIE = 1;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
}



void Estado_Set() {
 Lcd_Out(1, 1, "Set:");
 Lcd_Out(2, 1, "Ajuste el tiempo");


 if (tecla_pulsada == 1 && setpoint < 999){
 setpoint++;
 }
 if (tecla_pulsada == 2 && setpoint > 0) {
 setpoint--;
 }


 if (tecla_pulsada == 3 && setpoint > 0) {
 contador = 0;
 en_pausa = 0;
 Lcd_Cmd(_LCD_CLEAR);
 estado = 1;
 }


 IntToStr(setpoint, texto_numero);
 Lcd_Out(1, 6, Ltrim(texto_numero));
 Lcd_Out_Cp(" s  ");
}

void Estado_Run() {

 Lcd_Out(1, 1, "Set:");
 IntToStr(setpoint, texto_numero);
 Lcd_Out(1, 6, Ltrim(texto_numero));
 Lcd_Out_Cp(" s  ");


 if (tecla_pulsada == 3) {
 if (en_pausa == 0){
 en_pausa = 1;
 }
 else {
 en_pausa = 0;
 }
 }


 if (tecla_pulsada == 4) {
 contador = 0;
 en_pausa = 0;
 Lcd_Cmd(_LCD_CLEAR);
 estado = 0;
 return;
 }


 if (en_pausa == 0) {
 Lcd_Out(2, 1, "Run:   ");
 } else {
 Lcd_Out(2, 1, "Pausa: ");
 }


 IntToStr(contador, texto_numero);
 Lcd_Out(2, 8, Ltrim(texto_numero));
 Lcd_Out_Cp(" s  ");


 if (paso_un_segundo == 1) {
 paso_un_segundo = 0;

 if (en_pausa == 0) {
 contador++;


 if (contador >= setpoint) {
 Salida_Relay = 1;
 Lcd_Cmd(_LCD_CLEAR);
 estado = 2;


 Salida_Buzzer=1;
 Delay_ms(200);
 Salida_Buzzer=0;
 Delay_ms(200);
 Salida_Buzzer=1;
 Delay_ms(200);
 Salida_Buzzer=0;
 Delay_ms(200);
 Salida_Buzzer=1;
 Delay_ms(200);
 Salida_Buzzer=0;
 }
 }
 }
}

void Estado_Done() {
 Lcd_Out(1, 1, "TIEMPO TERMINADO");
 Lcd_Out(2, 1, "FIN");


 if (tecla_pulsada != 0) {
 Salida_Relay = 0;
 Lcd_Cmd(_LCD_CLEAR);
 estado = 0;
 }
}

void main() {
 Init();

 while(1) {

 tecla_pulsada = teclado();


 if (estado == 0) {
 Estado_Set();
 }
 else if (estado == 1) {
 Estado_Run();
 }
 else if (estado == 2) {
 Estado_Done();
 }
 }
}
