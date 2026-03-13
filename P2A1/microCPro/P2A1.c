/* Student: Albert Alfredo Matos Abreu
// Signature: Microcontroladores Aplicados 1910
// Teacher: Andrickson Vicente
// ID:  10163294
// Description: P2A1
  - El circuito debe controlar 5 leds.
  - Debe tener una entrada analógica.
  - Debe tener un pulsador en una entrada digital.
  El circuito enciende un LED0 cuando el voltaje está entre 0V y 1V, enciende un LED1 cuando el voltaje está entre 1 y 2V, enciende un LED2 cuando el voltaje está entre 2 y 3V, enciende un LED3 cuando el voltaje está entre 3V y 4V, enciende un LED4 cuando el voltaje está entre 4V y 5V.

  Al presionar el pulsador deben apagarse todos los LED, si se presiona de nuevo encenderse los que corresponden.
*/

  // Definiciones

  #define LED0 PORTC.B0
  #define LED1 PORTC.B1
  #define LED2 PORTC.B2
  #define LED3 PORTC.B3
  #define LED4 PORTC.B4
  #define BOTON PORTC.B5

  // Variables
   int valor_adc;
   int activo = 1;
  //Sub-Routines
  
  // Initialization
  void Init_Sistema() {

    //Frequency Config
      OSCCON = 0b01100111; // Clock 4MHz

      // Configuración de puertos

      ANSEL = 0b00000001;
      ANSELH = 0x00;

      TRISA = 0b00000001;
      TRISB = 0x00;
      TRISC = 0b00100000; // El RC5 sea entrada

      PORTA = 0x00;
      PORTB = 0x00;
      PORTC = 0x00;

      ADC_Init();
  }
   // Main Program
  void main() {
      Init_Sistema();

      while(1) {
           // Code:
           
          // Logica para el boton de START Y STOP
          if (BOTON == 1) {
              Delay_ms(100);
              activo = !activo;
              while (BOTON == 1);
          }
           //Logica para encender los led
          if (activo == 1) {
              valor_adc = ADC_Read(0); // Lectura del ADC


              PORTC = 0b11100000;

              if (valor_adc < 205) { // 0 a 1 V
              LED0 = 1;
              }
              else if (valor_adc < 410){  // 1 a 2 V
              LED1 = 1;}
              else if (valor_adc < 615){  // 2 a 3V
              LED2 = 1;}
              else if (valor_adc < 820){  // 3 a 4V
               LED3 = 1;}
              else  {        // 4 a 5 V
                 LED4 = 1;
                 }

          } else {

              PORTC = 0b11100000; // Para apagar todo
          }

          Delay_ms(20);
      }
  }