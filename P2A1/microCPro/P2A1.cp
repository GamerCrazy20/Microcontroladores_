#line 1 "C:/Users/alber/OneDrive/Documentos/Code/Micro/P2A1/microCPro/P2A1.c"
#line 24 "C:/Users/alber/OneDrive/Documentos/Code/Micro/P2A1/microCPro/P2A1.c"
 int valor_adc;
 int activo = 1;



 void Init_Sistema() {


 OSCCON = 0b01100111;



 ANSEL = 0b00000001;
 ANSELH = 0x00;

 TRISA = 0b00000001;
 TRISB = 0x00;
 TRISC = 0b00100000;

 PORTA = 0x00;
 PORTB = 0x00;
 PORTC = 0x00;

 ADC_Init();
 }

 void main() {
 Init_Sistema();

 while(1) {



 if ( PORTC.B5  == 1) {
 Delay_ms(100);
 activo = !activo;
 while ( PORTC.B5  == 1);
 }

 if (activo == 1) {
 valor_adc = ADC_Read(0);


 PORTC = 0b11100000;

 if (valor_adc < 205) {
  PORTC.B0  = 1;
 }
 else if (valor_adc < 410){
  PORTC.B1  = 1;}
 else if (valor_adc < 615){
  PORTC.B2  = 1;}
 else if (valor_adc < 820){
  PORTC.B3  = 1;}
 else {
  PORTC.B4  = 1;
 }

 } else {

 PORTC = 0b11100000;
 }

 Delay_ms(20);
 }
 }
