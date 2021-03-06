# asmsyntax=as

# Makro pro tisk zpravy na standardni vystup.
# - pro zapis je pouzita "Intel" syntaxe.
#
# Autor: Pavel Tisnovsky

# Linux kernel system call table
sys_write  = 4
std_output = 1



# Deklarace makra pro vytisteni zpravy na standardni vystup
.macro writeMessage message,messageLength
        mov   ecx, offset \message   # adresa retezce, ktery se ma vytisknout
        mov   edx, \messageLength    # pocet znaku, ktere se maji vytisknout
        call  write_message          # vytisknout zpravu "Zero flag not set"
.endm



# Podprogram pro vytisteni zpravy na standardni vystup
# Ocekava se, ze v ecx bude adresa zpravy a v edx jeji delka
write_message:
        mov   eax, sys_write         # cislo syscallu pro funkci "write"
        mov   ebx, std_output        # standardni vystup
        int   0x80
        ret



# Deklarace makra pro vytisteni znaku konce radku (provede se tedy odradkovani)
.macro println
        writeMessage printlnMessage,printlnLength
.endm



#-----------------------------------------------------------------------------
.section .data
# Miniretezec pouzivany makrem println
printlnMessage:
        .string "\n"
printlnLength = $ - printlnMessage

