// P10 HUB12 1/4 scan 32x16  de dos colores (R y G), matrix control by Damián G. Lasso www.LASSO-TECH.com 07/2024

#define oe_pin     13  // OE en conector IDC HUB12
#define a_pin      12  // A en conector IDC HUB12
#define b_pin      14  // B en conector IDC HUB12
#define clk_pin    27  // S o CLK en conector IDC HUB12
#define sclk_pin   26  // L o SCLK o STB o LAT en conector IDC HUB12
#define dato_pinR  25  // R o DATAR o DATA1 en conector IDC HUB12
#define dato_pinG  33  // G o DATAG o DATA2 en conector IDC HUB12

uint8_t mensaje[] = {0xE3, 0x94, 0x94, 0xE4, 0x94, 0x94, 0xE3, 0x0, 0x0, 0x89, 0x8A, 0x8A, 0xFA, 0x8A, 0x8A, 0x89, 0x3C, 0xA1, 0xA1, 0xA1, 0xA1, 0xA1, 0x21, 0x0, 0x0, 0xCF, 0x28, 0x28, 0x28, 0x28, 0x28, 0xC8, 0xCE, 0x29, 0x29, 0x29, 0x29, 0x29, 0x2E, 0x0, 0x0, 0xA2, 0x22, 0x3E, 0x22, 0x22, 0x14, 0x8, 0x31, 0x48, 0x49, 0x49, 0x49, 0x49, 0x31, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};

int fila = 0;
int bit = 0;

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
  digitalWrite(oe_pin, 0); // habilita la matriz, enciende los LEDs
  
  if(fila == 0) { digitalWrite(a_pin, 0); digitalWrite(b_pin, 0); } // Selectores de fila
  if(fila == 1) { digitalWrite(a_pin, 1); digitalWrite(b_pin, 1); }
  if(fila == 2) { digitalWrite(a_pin, 0); digitalWrite(b_pin, 1); }
  if(fila == 3) { digitalWrite(a_pin, 1); digitalWrite(b_pin, 0); }
  
  for(int i=0;i<=60;i+=4) // "for" para recorrer byte por byte del arreglo
  {
    for(int x=7;x>=0;x--) // "for" para recorrer bit por bit del byte actual
    {
      bit = bitRead(mensaje[fila+i],x); // lectura del bit dentro del byte actual
      digitalWrite(dato_pinR, bit);     // escritura del bit en la salida color Red o color único
      //digitalWrite(dato_pinG, bit);   // escritura del bit en la salida color Green o segundo color
      digitalWrite(clk_pin, 1); // primer movimiento para consolidar el bit
      digitalWrite(clk_pin, 0); // segundo movimiento para consolidar el bit
    }
  }
  
  digitalWrite(sclk_pin, 1); // primer movimiento para consolidar el byte
  digitalWrite(sclk_pin, 0); // segundo movimiento para consolidar el byte
  digitalWrite(oe_pin, 1); // deshabilita la matriz, apaga los LEDs
  delay(2); // estde delay genera una atenuación, es un detalle opcional
  
  fila++; // cambio de fila
  if(fila > 3) fila = 0; 
}
