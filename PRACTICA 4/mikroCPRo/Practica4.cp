#line 1 "C:/Users/alber/OneDrive/Documentos/Pucmm/LAB MICROCONTROLADORES/PRACTICA 4/mikroCPRo/Practica4.c"





char tecla_actual = 0;
char tecla_anterior = 0;
char tecla_nueva = 0;
int contador = 0;
char texto_contador[6];
char estado = 0;

char buffer_teclas[5];
char indice_teclas = 0;
char direccion = 0;


sbit LCD_RS at LATB.B4;
sbit LCD_EN at LATB.B5;
sbit LCD_D7 at LATB.B3;
sbit LCD_D6 at LATB.B2;
sbit LCD_D5 at LATB.B1;
sbit LCD_D4 at LATB.B0;

sbit LCD_RS_Direction at TRISB.B4;
sbit LCD_EN_Direction at TRISB.B5;
sbit LCD_D7_Direction at TRISB.B3;
sbit LCD_D6_Direction at TRISB.B2;
sbit LCD_D5_Direction at TRISB.B1;
sbit LCD_D4_Direction at TRISB.B0;


sbit MOTOR_DER at LATB.B6;
sbit MOTOR_IZQ at LATB.B7;


sbit FILA1 at LATA.B0;
sbit FILA2 at LATA.B1;
sbit FILA3 at LATA.B2;
sbit FILA4 at LATA.B3;

sbit COL1 at PORTA.B4;
sbit COL2 at PORTA.B6;
sbit COL3 at PORTA.B7;


char Teclado() {
 char tecla = 0;

 FILA1 = 1;
 FILA2 = 0;
 FILA3 = 0;
 FILA4 = 0;
 Delay_ms(2);
 if (COL1 == 1){
 tecla = '1';
 }
 if (COL2 == 1){
 tecla = '2';
 }
 if (COL3 == 1){
 tecla = '3';
 }

 FILA1 = 0;
 FILA2 = 1;
 FILA3 = 0;
 FILA4 = 0;

 Delay_ms(2);

 if (COL1 == 1) {
 tecla = '4';
 }
 if (COL2 == 1) {
 tecla = '5';
 }
 if (COL3 == 1) {
 tecla = '6';
 }

 FILA1 = 0;
 FILA2 = 0;
 FILA3 = 1;
 FILA4 = 0;

 Delay_ms(2);

 if (COL1 == 1) {
 tecla = '7';
 }
 if (COL2 == 1) {
 tecla = '8';
 }
 if (COL3 == 1) {
 tecla = '9';
 }

 FILA1 = 0; FILA2 = 0; FILA3 = 0; FILA4 = 1;
 Delay_ms(2);
 if (COL1 == 1) {
 tecla = '*';
 }
 if (COL2 == 1) {
 tecla = '0';
 }
 if (COL3 == 1) {
 tecla = '#';
 }

 FILA1 = 0;
 FILA2 = 0;
 FILA3 = 0;
 FILA4 = 0;

 return tecla;
}


 void Pantalla_Principal() {
 Lcd_Out(1, 1, "Presione * ");
 Lcd_Out(2, 1, "Para ingresar  ");
 if (tecla_nueva == '*') {
 estado = 1;
 indice_teclas = 0;
 Lcd_Cmd(_LCD_CLEAR);
 }
}

void Solicitud_Clave_Principal() {
 Lcd_Out(1, 1, "Digite clave   ");
 Lcd_Out(2, 1, "Acceso: ");


 if (indice_teclas > 0) {
 Lcd_Chr(2, 9, '*'); }
 else {
 Lcd_Chr(2, 9, '_');}
 if (indice_teclas > 1) {
 Lcd_Chr(2, 10, '*');}
 else {
 Lcd_Chr(2, 10, '_');
 }
 if (indice_teclas > 2) {
 Lcd_Chr(2, 11, '*');}
 else {
 Lcd_Chr(2, 11, '_');
 }
 if (indice_teclas > 3) {
 Lcd_Chr(2, 12, '*');}
 else {
 Lcd_Chr(2, 12, '_');}

 if (tecla_nueva >= '0' && tecla_nueva <= '9') {
 buffer_teclas[indice_teclas] = tecla_nueva;
 indice_teclas++;
 if (indice_teclas == 4) {
 Delay_ms(300);
 Lcd_Cmd(_LCD_CLEAR);
 if (buffer_teclas[0]=='8' && buffer_teclas[1]=='0' && buffer_teclas[2]=='0' && buffer_teclas[3]=='8') {
 Lcd_Out(1, 1, "Acceso correcto");
 Lcd_Out(2, 1, "Espere...      ");
 Delay_ms(2000);
 estado = 2;
 } else {
 Lcd_Out(1, 1, "Clave incorrecta");
 Lcd_Out(2, 1, "Vuelva a iniciar");
 Delay_ms(2000);
 estado = 0;
 }
 indice_teclas = 0;
 Lcd_Cmd(_LCD_CLEAR);
 }
 }
}

void Menu_Ordenes() {
 Lcd_Out(1, 1, "Menu de ordenes");
 Lcd_Out(2, 1, "Acceso: ");

 if (indice_teclas > 0) {
 Lcd_Chr(2, 9, '*');}
 else {
 Lcd_Chr(2, 9, '_');}
 if (indice_teclas > 1) {
 Lcd_Chr(2, 10, '*');}
 else{
 Lcd_Chr(2, 10, '_');}
 if (indice_teclas > 2) {
 Lcd_Chr(2, 11, '*');}
 else{
 Lcd_Chr(2, 11, '_');}
 if (indice_teclas > 3) {
 Lcd_Chr(2, 12, '*');}
 else{
 Lcd_Chr(2, 12, '_');}

 if (tecla_nueva == '#' && indice_teclas == 0) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Sin orden valida");
 Lcd_Out(2, 1, "No se ejecuta   ");
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 }

 if (tecla_nueva >= '0' && tecla_nueva <= '9') {
 buffer_teclas[indice_teclas] = tecla_nueva;
 indice_teclas++;
 if (indice_teclas == 4) {
 Delay_ms(300);
 Lcd_Cmd(_LCD_CLEAR);
 if (buffer_teclas[0]=='1' && buffer_teclas[1]=='2' && buffer_teclas[2]=='3' && buffer_teclas[3]=='4') {
 direccion = 1; estado = 3;
 } else if (buffer_teclas[0]=='4' && buffer_teclas[1]=='3' && buffer_teclas[2]=='2' && buffer_teclas[3]=='1') {
 direccion = 2; estado = 4;
 } else {
 Lcd_Out(1, 1, "Orden invalida ");
 Lcd_Out(2, 1, "Intente otra vez");
 Delay_ms(2000);
 }
 indice_teclas = 0;
 Lcd_Cmd(_LCD_CLEAR);
 }
 }
}

void Control_Motor(char dir) {

 MOTOR_DER = 0;
 MOTOR_IZQ = 0;

 if (dir == 1) {
 Lcd_Out(1, 1, "Orden derecha   ");
 } else {
 Lcd_Out(1, 1, "Orden izquierda ");
 }
 Lcd_Out(2, 1, "Pulse #         ");


 if (tecla_nueva == '#') {
 Lcd_Cmd(_LCD_CLEAR);

 while(1) {

 tecla_actual = Teclado();
 if (tecla_actual != 0 && tecla_actual != tecla_anterior)
 tecla_nueva = tecla_actual;
 else
 tecla_nueva = 0;
 tecla_anterior = tecla_actual;


 if (dir == 1) {
 MOTOR_DER = 1; MOTOR_IZQ = 0;
 Lcd_Out(1, 1, "Motor derecha   ");
 } else {
 MOTOR_DER = 0; MOTOR_IZQ = 1;
 Lcd_Out(1, 1, "Motor izquierda ");
 }
 Lcd_Out(2, 1, "# para detener  ");


 if (tecla_nueva == '#') {
 MOTOR_DER = 0;
 MOTOR_IZQ = 0;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Sistema detenido");
 Lcd_Out(2, 1, "Volviendo menu  ");
 Delay_ms(5000);
 estado = 0;
 Lcd_Cmd(_LCD_CLEAR);
 break;
 }
 Delay_ms(20);
 }
 }
}

void Init_Sistema(){
 OSCCON = 0b01101000;
 ANSELA = 0x00;
 ANSELB = 0x00;
 TRISA = 0b11010000;
 TRISB = 0x00;
 LATA = 0x00;
 LATB = 0x00;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
}

void main() {
 Init_Sistema();
 while(1) {
 tecla_actual = Teclado();

 if (tecla_actual != 0 && tecla_actual != tecla_anterior) {
 tecla_nueva = tecla_actual;
 } else {
 tecla_nueva = 0;
 }
 tecla_anterior = tecla_actual;

 switch (estado) {
 case 0: Pantalla_Principal(); break;
 case 1: Solicitud_Clave_Principal(); break;
 case 2: Menu_Ordenes(); break;
 case 3: Control_Motor(1); break;
 case 4: Control_Motor(2); break;
 }
 Delay_ms(20);
 }
}
