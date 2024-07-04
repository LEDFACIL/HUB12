// P10 HUB12 RG 1/4 scan matrix control by Damián G. Lasso www.LASSO-TECH.com 07/2024
#include <xc.h>

#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator: High-speed crystal/resonator on RA6/OSC2/CLKOUT and RA7/OSC1/CLKIN)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config MCLRE = OFF      // RA5/MCLR/VPP Pin Function Select bit (RA5/MCLR/VPP pin function is digital input, MCLR internally tied to VDD)
#pragma config BOREN = OFF      // Brown-out Detect Enable bit (BOD disabled)
#pragma config LVP = OFF        // Low-Voltage Programming Enable bit (RB4/PGM pin has digital I/O function, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EE Memory Code Protection bit (Data memory code protection off)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

#define _XTAL_FREQ 20000000

#define oe_pin RA1    // OE
#define a_pin RA0     // A
#define b_pin RA2     // B
#define clk_pin RB7   // S
#define sclk_pin RA3  // L
#define dato_pinR RB6 // R
#define dato_pinG RB5 // G

uint8_t mensaje[] = {0xF3, 0x94, 0x94, 0xE4, 0x94, 0x94, 0x94, 0xE3, 0x0, 0x89, 0x8A, 0x8A, 0xFA, 0x8A, 0x8A, 0x89,
                     0x3C, 0xA1, 0xA1, 0xA1, 0xA1, 0xA1, 0xA1, 0x21, 0x0, 0xCF, 0x28, 0x28, 0x28, 0x28, 0x28, 0xC8,
                     0xCC, 0x2A, 0x29, 0x29, 0x29, 0x29, 0x2A, 0x2C, 0x0, 0xA2, 0x22, 0x3E, 0x22, 0x22, 0x14, 0x8,
                     0x31, 0x48, 0x49, 0x49, 0x49, 0x49, 0x49, 0x31, 0x0, 0xA8, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};

int fila = 0;
int bit = 0;
int i;
int x;

void main(void) 
{
    TRISA = 0b00000000; // Configura los pines de salida
    TRISB = 0b00000000; 
    CMCON = 0x07;

    oe_pin = 0;
    a_pin = 0;
    b_pin = 0;
    sclk_pin = 0;
    clk_pin = 0;
    dato_pinR = 0;
    dato_pinG = 0;

    while(1) 
    {
        oe_pin = 0;
  
        if(fila == 0) 
        { 
            a_pin = 0; 
            b_pin = 0; 
        }

        if(fila == 1) 
        {
            a_pin = 1;
            b_pin = 1;               
        }

        if(fila == 2) 
        {
            a_pin = 0;
            b_pin = 1; 
        }

        if(fila == 3) 
        {
            a_pin = 1;
            b_pin = 0;            
        }
  
        for(i=0; i<=60; i+=4) 
        {
            for(x=7; x>=0; x--) 
            {
                bit = (mensaje[fila+i] >> x) & 0x01;
                dato_pinR = bit;
                //dato_pinG = bit;
                clk_pin = 1;
                clk_pin = 0;
            }
        }
        
        sclk_pin = 1;
        sclk_pin = 0;
        oe_pin = 1;
        __delay_ms(2);
        if(fila == 3) fila = -1;
        fila++;
    }    
    return;
}