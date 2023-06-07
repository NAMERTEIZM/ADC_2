// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections

unsigned int adc_rd; // Declare variables
char *text; //

void main() {

INTCON = 0; // All interrupts disabled
ANSEL = 0x04; // Pin RA2 is configured as an analog input
TRISA = 0x04;
ANSELH = 0; // Rest of pins are configured as digital

Lcd_Init(); // LCD display initialization
Lcd_Cmd(_LCD_CURSOR_OFF); // LCD command (cursor off)
Lcd_Cmd(_LCD_CLEAR); // LCD command (clear LCD)
delay_ms(20);

text = "Voltscale:";
Lcd_Out(1,1,text);

while (1) {
adc_rd = ADC_Read(2);
IntToStr(adc_rd,text);
Lcd_Out(1,11,text); 
//Lcd_Chr_CP('V');
delay_ms(1);
}
}