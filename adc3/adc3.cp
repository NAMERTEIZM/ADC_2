#line 1 "C:/Users/Elnino/Desktop/Mikroiþlemci/örnekler/adc3/adc3.c"

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


unsigned int adc_rd;
char *text;
char *text1;

void main() {

INTCON = 0;
ANSEL = 0x04;
TRISA = 0x04;
ANSELH = 0;

Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);




delay_ms(20);

text = "Voltscale:";
Lcd_Out(1,1,text);

while (1) {
adc_rd = ADC_Read(2);

IntToStr(adc_rd,text);
Lcd_Out(1,11,text);

delay_ms(1);
}
}
