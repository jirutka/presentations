# asmsyntax=as
 
# Testovaci program naprogramovany v assembleru GNU as
# - pocitana programova smycka
# - pouzita je "Intel" syntaxe.
#
# Autor: Pavel Tisnovsky
 
.intel_syntax noprefix
 
 
# Linux kernel system call table
sys_exit   = 1
sys_write  = 4
 
# Dalsi konstanty pouzite v programu - standardni streamy
std_input  = 0
std_output = 1

# pocet opakovani znaku
rep_count  = 40
 
 
 
#-----------------------------------------------------------------------------
.section .data
 
 
 
#-----------------------------------------------------------------------------
.section .bss
        .lcomm buffer, rep_count     # rezervace bufferu pro vystup
 
 
 
#-----------------------------------------------------------------------------
.section .text
        .global _start               # tento symbol ma byt dostupny i linkeru
 
_start:
        mov   ecx, offset buffer     # zapis se bude provadet do tohoto bufferu
        mov   ebx, rep_count         # pocet opakovani znaku
        mov   al,  '*'               # zapisovany znak
loop:
        mov   [ecx], al              # zapis znaku do bufferu
        inc   ecx                    # uprava ukazatele do bufferu
        dec   ebx                    # zmenseni pocitadla
        jnz   loop                   # pokud jsme se nedostali k nule, skok na zacatek smycky
 
        mov   eax, sys_write         # cislo syscallu pro funkci "write"
        mov   ebx, std_output        # standardni vystup
        mov   ecx, offset buffer     # adresa retezce, ktery se ma vytisknout
        mov   edx, rep_count         # pocet znaku, ktere se maji vytisknout
        int   0x80                   # volani Linuxoveho kernelu
 
        mov   eax, sys_exit          # cislo sycallu pro funkci "exit"
        mov   ebx, 0                 # exit code = 0
        int   0x80                   # volani Linuxoveho kernelu

