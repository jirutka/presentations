# asmsyntax=as

# Program pro otestovani instrukce BSWAP
# - pro zapis je pouzita "Intel" syntaxe.
#
# Autor: Pavel Tisnovsky

.intel_syntax noprefix



# Nacteni definice makra pro ukonceni aplikace
.include "exit.s"

# Nacteni maker pro (opakovany) tisk zpravy i prislusne subrutiny
.include "writeMessage.s"

# Nacteni makra pro vytisteni hexadecimalni 32bitove hodnoty
# spolecne s makrem je nactena i prislusna subrutina
.include "printHexNumber.s"



#-----------------------------------------------------------------------------
.section .data



#-----------------------------------------------------------------------------
.section .bss



#-----------------------------------------------------------------------------
.section .text
        .global _start               # tento symbol ma byt dostupny i linkeru

_start:
        mov eax, 0x12345678
        printHexNumber eax           # vytiskneme puvodni hodnotu
        bswap eax
        printHexNumber eax           # vytiskneme slovo s prohozenymi bajty
        bswap eax
        printHexNumber eax           # vytiskneme puvodni hodnotu
        println

        mov eax, 0x000000ff
        printHexNumber eax           # vytiskneme puvodni hodnotu
        bswap eax
        printHexNumber eax           # vytiskneme slovo s prohozenymi bajty
        bswap eax
        printHexNumber eax           # vytiskneme puvodni hodnotu
        println

        exit                         # ukonceni aplikace

