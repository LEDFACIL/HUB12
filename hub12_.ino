// P10 HUB12 RG 1/4 scan matrix control by Damián G. Lasso www.LASSO-TECH.com 07/2024

#define oe_pin     13  // OE
#define a_pin      12  // A
#define b_pin      14  // B
#define clk_pin    27  // S
#define sclk_pin   26  // L
#define dato_pinR  25  // R
#define dato_pinG  33  // G

uint8_t mensaje[] = {0xE3, 0x94, 0x94, 0xE4, 0x94, 0x94, 0xE3, 0x0, 0x0, 0x89, 0x8A, 0x8A, 0xFA, 0x8A, 0x8A, 0x89, 0x3C, 0xA1, 0xA1, 0xA1, 0xA1, 0xA1, 0x21, 0x0, 0x0, 0xCF, 0x28, 0x28, 0x28, 0x28, 0x28, 0xC8, 0xCE, 0x29, 0x29, 0x29, 0x29, 0x29, 0x2E, 0x0, 0x0, 0xA2, 0x22, 0x3E, 0x22, 0x22, 0x14, 0x8, 0x31, 0x48, 0x49, 0x49, 0x49, 0x49, 0x31, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};

int fila = 0;
int bit = 0;
int i;
int x;

void setup() 
{  
  pinMode(oe_pin, OUTPUT);
  pinMode(a_pin, OUTPUT);
  pinMode(b_pin, OUTPUT);
  pinMode(clk_pin, OUTPUT);
  pinMode(sclk_pin, OUTPUT);
  pinMode(dato_pinR, OUTPUT);
  pinMode(dato_pinG, OUTPUT);
  digitalWrite(oe_pin, 0);
  digitalWrite(a_pin, 0);
  digitalWrite(b_pin, 0);
  digitalWrite(sclk_pin, 0);
  digitalWrite(clk_pin, 0);  
}

void loop() 
{
  digitalWrite(oe_pin, 0);
  
  if(fila == 0)
  {
    digitalWrite(a_pin, 0);
    digitalWrite(b_pin, 0);                    
  }

  if(fila == 1)
  {
    digitalWrite(a_pin, 1);
    digitalWrite(b_pin, 1);                 
  }

  if(fila == 2)
  {
    digitalWrite(a_pin, 0);
    digitalWrite(b_pin, 1); 
  }

  if(fila == 3)
  {
    digitalWrite(a_pin, 1);
    digitalWrite(b_pin, 0);            
  }
  
  for(i=0;i<=60;i+=4)
  {
    for(x=7;x>=0;x--)
    {
      bit = bitRead(mensaje[fila+i],x);
      digitalWrite(dato_pinR, bit);
      //digitalWrite(dato_pinG, bit);
      digitalWrite(clk_pin, 1);
      digitalWrite(clk_pin, 0);
    }
  }
  
  digitalWrite(sclk_pin, 1);
  digitalWrite(sclk_pin, 0);
  digitalWrite(oe_pin, 1);
  delay(2);
  if(fila==3) fila=-1;
  fila++;
}