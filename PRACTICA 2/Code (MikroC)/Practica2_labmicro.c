// Student: ALBERT MATOS
// Signature: Laboratorio Microcontroladores Aplicados(IMC 1910)
// ID: 10163294
/* Description:
   Temporizador Programable con Teclado Analogico, Pausa y Buzzer selectivo
*/

// configuracion de la Lcd 16 x 2
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

// Salidas de Relay y Buzzer
sbit Salida_Relay at PORTC.B6;  // Relay
sbit Salida_Buzzer at PORTC.B7; // Buzzer

// Variables
int estado = 0;
int setpoint = 0;
int contador = 0;
int milisegundos = 0;
int paso_un_segundo = 0;
int en_pausa = 0;

char texto_numero[7];
char tecla_pulsada = 0;
char tecla_anterior = 0;

//Interrupcion de reloj -> ayuda de IA
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

// Funcion del Teclado
char teclado() {
    int lectura_adc;
    char tecla = 0;

    lectura_adc = ADC_Read(0);

    // Identificar boton presionado
    if (lectura_adc > 861) {
        tecla = 4; // boton STOP / SET
    }
    else if (lectura_adc > 581) {
        tecla = 1; // boton +
    }
    else if (lectura_adc > 351) {
        tecla = 2; // boton -
    }
    else if (lectura_adc > 101) {
        tecla = 3; // boton START
    }
    else {
        tecla = 0; // ningun boton
    }

    Delay_ms(20); // Anti rebote para estabilizar la señal

    // Si es la misma tecla de antes, no hacemos nada
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
    OSCCON = 0b01100111; // Oscilador 4MHz
    ANSEL = 0b00000001;
    ANSELH = 0x00;

    TRISA = 0b00000001;
    TRISB = 0x00;
    TRISC = 0x00;

    PORTA = 0x00;
    PORTB = 0x00;
    PORTC = 0x00;

    // configuracion Timer0 -> ayuda de IA
    OPTION_REG = 0b00000010;
    TMR0 = 131;
    INTCON.T0IE = 1;
    INTCON.GIE = 1;

    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
}

// Estados set, fin, run y stop

void Estado_Set() {
    Lcd_Out(1, 1, "Set:");
    Lcd_Out(2, 1, "Ajuste el tiempo");

    // botones + y - cambian el tiempo
    if (tecla_pulsada == 1 && setpoint < 999){
       setpoint++;
    }
    if (tecla_pulsada == 2 && setpoint > 0) {
       setpoint--;
    }

    // boton Start
    if (tecla_pulsada == 3 && setpoint > 0) {
        contador = 0;
        en_pausa = 0;
        Lcd_Cmd(_LCD_CLEAR);
        estado = 1; // Ir a RUN
    }

    // mostrar numero
    IntToStr(setpoint, texto_numero);
    Lcd_Out(1, 6, Ltrim(texto_numero));
    Lcd_Out_Cp(" s  ");
}

void Estado_Run() {
    // mostrar el tiempo (setpoint)
    Lcd_Out(1, 1, "Set:");
    IntToStr(setpoint, texto_numero);
    Lcd_Out(1, 6, Ltrim(texto_numero));
    Lcd_Out_Cp(" s  ");

    // pausa
    if (tecla_pulsada == 3) {
        if (en_pausa == 0){
           en_pausa = 1;
        }
        else {
           en_pausa = 0;
        }
    }

    //  stop
    if (tecla_pulsada == 4) {
        contador = 0;
        en_pausa = 0;
        Lcd_Cmd(_LCD_CLEAR);
        estado = 0; // Volver para el set
        return;
    }

    // mostrar palabra en pantalla segun el estado
    if (en_pausa == 0) {
        Lcd_Out(2, 1, "Run:   ");
    } else {
        Lcd_Out(2, 1, "Pausa: ");
    }

    // tiempo en la lcd
    IntToStr(contador, texto_numero);
    Lcd_Out(2, 8, Ltrim(texto_numero));
    Lcd_Out_Cp(" s  ");

    //
    if (paso_un_segundo == 1) {
        paso_un_segundo = 0;

        if (en_pausa == 0) {
            contador++;

            // logica de contador
            if (contador >= setpoint) {
                Salida_Relay = 1;
                Lcd_Cmd(_LCD_CLEAR);
                estado = 2;

                //3 beeps buzzer
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

    //  reinicia el sistema
    if (tecla_pulsada != 0) {
        Salida_Relay = 0; // Seguridad de relay
        Lcd_Cmd(_LCD_CLEAR);
        estado = 0; // volver a SET
    }
}

void main() {
    Init();

    while(1) {

        tecla_pulsada = teclado();

        // maquina de estado
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