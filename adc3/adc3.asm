
_main:

;adc3.c,20 :: 		void main() {
;adc3.c,22 :: 		INTCON = 0; // All interrupts disabled
	CLRF       INTCON+0
;adc3.c,23 :: 		ANSEL = 0x04; // Pin RA2 is configured as an analog input
	MOVLW      4
	MOVWF      ANSEL+0
;adc3.c,24 :: 		TRISA = 0x04;
	MOVLW      4
	MOVWF      TRISA+0
;adc3.c,25 :: 		ANSELH = 0; // Rest of pins are configured as digital
	CLRF       ANSELH+0
;adc3.c,27 :: 		Lcd_Init(); // LCD display initialization
	CALL       _Lcd_Init+0
;adc3.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // LCD command (cursor off)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;adc3.c,29 :: 		Lcd_Cmd(_LCD_CLEAR); // LCD command (clear LCD)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;adc3.c,34 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;adc3.c,36 :: 		text = "Voltscale:"; // Define the third message
	MOVLW      ?lstr1_adc3+0
	MOVWF      _text+0
;adc3.c,37 :: 		Lcd_Out(1,1,text); // Write the first message in the first line
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;adc3.c,39 :: 		while (1) {
L_main1:
;adc3.c,40 :: 		adc_rd = ADC_Read(2); // A/D conversion. Pin RA2 is an input.
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_rd+0
	MOVF       R0+1, 0
	MOVWF      _adc_rd+1
;adc3.c,42 :: 		IntToStr(adc_rd,text);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVF       _text+0, 0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;adc3.c,43 :: 		Lcd_Out(1,11,text); // Write result in the second line
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;adc3.c,45 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;adc3.c,46 :: 		}
	GOTO       L_main1
;adc3.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
