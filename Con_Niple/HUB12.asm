;------------------------------------------------------------
; Código assembler generado por Niple V6.7.0
; Proyecto: HUB12
; Autor: LEDFACIL
; Fecha: 29/03/2024
; PIC: 16F628A
; Velocidad de reloj: 20 Mhz
; Descripcion: 
;------------------------------------------------------------


 LIST    P=PIC16F628A


_HS_OSC               equ  0x3FEE
_WDT_OFF              equ  0x3FFB
_PWRTE_ON             equ  0x3FF7
_MCLRE_OFF            equ  0x3FDF
_BODEN_OFF            equ  0x3FBF
_LVP_OFF              equ  0x3F7F
_CPD_OFF              equ  0x3F7F
_CP_OFF               equ  0x3FFF

 __config _HS_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_OFF & _BODEN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF


;------------------------------------------------------------
;                  Declaración de Registros
;------------------------------------------------------------
w                     equ  0x0000
pcl                   equ  0x0002
status                equ  0x0003
fsr                   equ  0x0004
porta                 equ  0x0005
portb                 equ  0x0006
pclath                equ  0x000a
cmcon                 equ  0x001f
_np_temp1             equ  0x0023
_np_temp2             equ  0x0024
_np_temp3             equ  0x0025
_np_temp4             equ  0x0026
_np_indice            equ  0x0028
_np_resultado         equ  0x0029
_np_tiempo            equ  0x002a
_np_tiempo1           equ  0x002b
_np_tiempo2           equ  0x002c
_np_tiempo3           equ  0x002d
basura                equ  0x002f
desguace              equ  0x0030
elemento_l            equ  0x0031
elemento_h            equ  0x0032
fila                  equ  0x0033
i                     equ  0x0034
x                     equ  0x0035
opcion                equ  0x0081
trisa                 equ  0x0085
trisb                 equ  0x0086


;------------------------------------------------------------
;                  Declaración de Bits
;------------------------------------------------------------
a_pin                 equ  0   ;
b_pin                 equ  2   ;
c                     equ  0   ;
clk_pin               equ  7   ;
dato_pinr             equ  6   ;
oe_pin                equ  1   ;
psa                   equ  3   ;
rp0                   equ  5   ;
rp1                   equ  6   ;
sclk_pin              equ  3   ;
to                    equ  4   ;
z                     equ  2   ;
bit                   equ  0   ;
bit_0                 equ  0   ;
bit_1                 equ  1   ;
bit_2                 equ  2   ;
bit_3                 equ  3   ;
bit_4                 equ  4   ;
bit_5                 equ  5   ;
bit_6                 equ  6   ;
bit_7                 equ  7   ;


;------------------------------------------------------------
;               Declaración de Registros EEPROM
;------------------------------------------------------------


;------------------------------------------------------------
;                        Inicio
;------------------------------------------------------------

   org 0x00
   bsf status,rp0                   ;cambiar a banco 1
   bcf opcion,psa
   goto paso2


tabla_show

   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   movf _np_indice,0
   clrf _np_resultado
   sublw .63
   btfss status,c
   goto tabla_show_s
   movf _np_indice,0
   movwf _np_temp1
   movlw low tabla_show_tbl
   addwf _np_temp1,1
   movlw high tabla_show_tbl
   btfsc status,c
   addlw .1
   movwf pclath
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   movf _np_indice,0
   call tabla_show_tbl
   movwf _np_resultado
tabla_show_s
   return
tabla_show_tbl
   addwf pcl,1
   retlw 0xf3                       ; 
   retlw 0x94                       ; 
   retlw 0x94                       ; 
   retlw 0xe4                       ; 
   retlw 0x94                       ; 
   retlw 0x94                       ; 
   retlw 0x94                       ; 
   retlw 0xe3                       ; 
   retlw 0x0                        ; 
   retlw 0x89                       ; 
   retlw 0x8a                       ; 
   retlw 0x8a                       ; 
   retlw 0xfa                       ; 
   retlw 0x8a                       ; 
   retlw 0x8a                       ; 
   retlw 0x89                       ; 
   retlw 0x3c                       ; 
   retlw 0xa1                       ; 
   retlw 0xa1                       ; 
   retlw 0xa1                       ; 
   retlw 0xa1                       ; 
   retlw 0xa1                       ; 
   retlw 0xa1                       ; 
   retlw 0x21                       ; 
   retlw 0x0                        ; 
   retlw 0xcf                       ; 
   retlw 0x28                       ; 
   retlw 0x28                       ; 
   retlw 0x28                       ; 
   retlw 0x28                       ; 
   retlw 0x28                       ; 
   retlw 0xc8                       ; 
   retlw 0xcc                       ; 
   retlw 0x2a                       ; 
   retlw 0x29                       ; 
   retlw 0x29                       ; 
   retlw 0x29                       ; 
   retlw 0x29                       ; 
   retlw 0x2a                       ; 
   retlw 0x2c                       ; 
   retlw 0x0                        ; 
   retlw 0xa2                       ; 
   retlw 0x22                       ; 
   retlw 0x3e                       ; 
   retlw 0x22                       ; 
   retlw 0x22                       ; 
   retlw 0x14                       ; 
   retlw 0x8                        ; 
   retlw 0x31                       ; 
   retlw 0x48                       ; 
   retlw 0x49                       ; 
   retlw 0x49                       ; 
   retlw 0x49                       ; 
   retlw 0x49                       ; 
   retlw 0x49                       ; 
   retlw 0x31                       ; 
   retlw 0x0                        ; 
   retlw 0xa8                       ; 
   retlw 0x0                        ; 
   retlw 0x0                        ; 
   retlw 0x0                        ; 
   retlw 0x0                        ; 
   retlw 0x0                        ; 
   retlw 0x0                        ; 



;------------------------------------------------------------
;                      programa principal
;------------------------------------------------------------
paso2
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   clrf _np_temp1
   clrf _np_temp2
   clrf _np_temp3
   clrf _np_temp4
   clrf _np_indice
   clrf _np_resultado
   clrf _np_tiempo
   clrf _np_tiempo1
   clrf _np_tiempo2
   clrf _np_tiempo3
   clrf basura
   clrf desguace
   clrf elemento_l
   clrf elemento_h
   clrf fila
   clrf i
   clrf x
   clrf porta
   movlw b'00100000'                ;configurar el puerto a como xxesssss
   bsf status,rp0                   ;cambiar a banco 1
   movwf trisa
   movlw b'00000111'                ;puerto a = e/s digital
   bcf status,rp0                   ;cambiar a banco 0
   movwf cmcon
   clrf portb
   movlw b'00000000'                ;configurar el puerto b como ssssssss
   bsf status,rp0                   ;cambiar a banco 1
   movwf trisb
   movlw d'7'
   bcf status,rp0                   ;cambiar a banco 0
   movwf x
inicio
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   bcf porta,oe_pin

   movf fila,w                      ;si fila = d'0'
   xorlw d'0'
   btfss status,z
   goto paso30
   bcf porta,a_pin
   bcf porta,b_pin
paso10
continuando
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1



   clrf elemento_l
   clrf elemento_h
   movf i,w                         ;elemento=fila+i, 
   addwf fila,w
   movwf elemento_l
   btfsc status,c
   goto slt_1_no
   goto slt_1_si
slt_1_no
   incf elemento_h,1
   goto slt_1_s
slt_1_si
   nop
slt_1_s
   movf elemento_l,w                ;consultar la tablatabla_show
   movwf _np_indice
   call tabla_show                  ;llamada a rutina tabla_show
   movf _np_resultado,w
   movwf desguace

   movf x,w                         ;si x = d'0'
   xorlw d'0'
   btfss status,z
   goto paso38
   btfsc desguace,bit_0
   goto slt_3_no
   goto slt_3_si
slt_3_no
   bsf basura,bit
   goto slt_3_s
slt_3_si
   bcf basura,bit
slt_3_s
paso15
continuando_1
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   btfsc basura,bit
   goto slt_4_no
   goto slt_4_si
slt_4_no
   bsf portb,dato_pinr
   goto slt_4_s
slt_4_si
   bcf portb,dato_pinr
slt_4_s
   bsf portb,clk_pin
   bcf portb,clk_pin

   movf x,w                         ;si x = d'0'
   xorlw d'0'
   btfss status,z
   goto paso51
   movlw d'7'
   movwf x

   movf i,w                         ;si i = d'60'
   xorlw d'60'
   btfss status,z
   goto paso53
   clrf i
   bsf porta,sclk_pin
   bcf porta,sclk_pin
   bsf porta,oe_pin

   movlw .1
   call tmp_100_mc                  ;llamada a rutina tmp_100_mc

   movf fila,w                      ;si fila = d'3'
   xorlw d'3'
   btfss status,z
   goto paso54
   clrf fila
   goto inicio
   goto inicio
paso30


   movf fila,w                      ;si fila = d'1'
   xorlw d'1'
   btfss status,z
   goto paso33
   bsf porta,a_pin
   bsf porta,b_pin
   goto continuando
paso33


   movf fila,w                      ;si fila = d'2'
   xorlw d'2'
   btfss status,z
   goto paso36
   bcf porta,a_pin
   bsf porta,b_pin
   goto continuando
paso36
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   bsf porta,a_pin
   bcf porta,b_pin
   goto continuando
paso38


   movf x,w                         ;si x = d'1'
   xorlw d'1'
   btfss status,z
   goto paso40
   btfsc desguace,bit_1
   goto slt_6_no
   goto slt_6_si
slt_6_no
   bsf basura,bit
   goto slt_6_s
slt_6_si
   bcf basura,bit
slt_6_s
   goto continuando_1
paso40


   movf x,w                         ;si x = d'2'
   xorlw d'2'
   btfss status,z
   goto paso42
   btfsc desguace,bit_2
   goto slt_7_no
   goto slt_7_si
slt_7_no
   bsf basura,bit
   goto slt_7_s
slt_7_si
   bcf basura,bit
slt_7_s
   goto continuando_1
paso42


   movf x,w                         ;si x = d'3'
   xorlw d'3'
   btfss status,z
   goto paso44
   btfsc desguace,bit_3
   goto slt_8_no
   goto slt_8_si
slt_8_no
   bsf basura,bit
   goto slt_8_s
slt_8_si
   bcf basura,bit
slt_8_s
   goto continuando_1
paso44


   movf x,w                         ;si x = d'4'
   xorlw d'4'
   btfss status,z
   goto paso46
   btfsc desguace,bit_4
   goto slt_9_no
   goto slt_9_si
slt_9_no
   bsf basura,bit
   goto slt_9_s
slt_9_si
   bcf basura,bit
slt_9_s
   goto continuando_1
paso46


   movf x,w                         ;si x = d'5'
   xorlw d'5'
   btfss status,z
   goto paso48
   btfsc desguace,bit_5
   goto slt_10_no
   goto slt_10_si
slt_10_no
   bsf basura,bit
   goto slt_10_s
slt_10_si
   bcf basura,bit
slt_10_s
   goto continuando_1
paso48


   movf x,w                         ;si x = d'6'
   xorlw d'6'
   btfss status,z
   goto paso50
   btfsc desguace,bit_6
   goto slt_11_no
   goto slt_11_si
slt_11_no
   bsf basura,bit
   goto slt_11_s
slt_11_si
   bcf basura,bit
slt_11_s
   goto continuando_1
paso50
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   btfsc desguace,bit_7
   goto slt_12_no
   goto slt_12_si
slt_12_no
   bsf basura,bit
   goto slt_12_s
slt_12_si
   bcf basura,bit
slt_12_s
   goto continuando_1
paso51

   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   movf x,w
   btfss status,z
   decf x,1
   movf x,w
   goto continuando
   goto continuando
paso53


   movlw d'4'                       ;i=i+d'4', 
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   addwf i,w
   movwf i
   goto continuando
   goto continuando
paso54

   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   incf fila,1
paso54_s
   goto inicio
   goto inicio


;------------------------------------------------------------
;                  Declaración de Subrutinas
;------------------------------------------------------------

tmp_100_mc
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   movwf _np_tiempo
   goto tmp_100_mc_1
tmp_100_mc_bucle2

tmp_100_mc_1
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   movlw .22
   movwf _np_tiempo1
tmp_100_mc_bucle1
   nop
   movlw .112
   movwf _np_tiempo2
tmp_100_mc_bucle
   nop
   decfsz _np_tiempo2,1
   goto tmp_100_mc_bucle
   decfsz _np_tiempo1,1
   goto tmp_100_mc_bucle1
   nop
   decfsz _np_tiempo,1
   goto tmp_100_mc_bucle2
   bcf status,rp0                   ;cambiar a banco 0
   bcf status,rp1
   return


;------------------------------------------------------------
;                  DATOS EN MEMORIA EEPROM
;------------------------------------------------------------
   org  0x2100
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff
   data   0xff

 End