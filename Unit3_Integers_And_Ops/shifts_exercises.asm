; Base Author: Megan Avery Spring 2024
; Exercise Author: [YOUR NAME HERE]

; Purpose - to learn the following:
; 	- logical shifts
;	- arithmetic shifts
;	- rotate shifts

%include "asm_io.inc"

; initialized data
segment .data

; uninitialized data
segment .bss


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        ; 1 byte is 2 hex digits

        ; LOGICAL SHIFTS
	; second operand has to be an immediate value or the register cl

        ; This is 10 times 2 to the third power
        ; mov eax, 10
        ; shl eax, 3
        ; call print_int

        ; mov ebx, 2
        ; shl eax, ebx ; this has to be either a number or cl not ebx

        ; move eax, 080000045H ; This is a giant negative number
        ; call print_int
        ; call print_nl

        ; shl eax, 1 ; Shifted it a little and now it changed the number massively
        ; print_int

        ; This is trying to divide 23 by 4 but it doesn't divide nicely so it print 5
        ; mov eax, 23 
        ; shr eax, 2
        ; call print_int

        ; ARITHMETIC SHIFT
        ; SAL as long as sign doesn't change this works very well
        ; SAR doesn't shift the sign bit 

        ; ROTATE SHIFTS
        ; ROL bits shifted off the left get put on the right
        ; ROR bits shifted off the right get put on the left 

        ; BOOLEAN BITWISE OPERATIONS
        ; 1 is True and 0 is False
        ; AND compares bit positions both are 1 otherwise they are 0
        ; TEST preforms the AND but only sets a FLAGS register
        ; mov eax, 4 ; 0100
        ; mov ebx, 2 ; 0010
        ; test eax, ebx
        ; dump_regs 1 ; Raises the ZF flags which is the zeroes flag
        ; OR compares bits but if there is a 1 it stays others get 0
        ; XOR compares at most 1 but if two 1 it becomes 0 and others get 0
        ; NOT flips all the binary bits in a number

        ; if XOR a number into itself it will be 0 everytime
        ; Ones complemet not the number because it flips the numbers
        ; You or with the power of 2 the bit you want to turn on 
        ; mov ebx, 1
        ; shl ebx, 2
        ; mov eax, 11 
        ; or eax, ebx
        ; call print_int
        ; We added 4 to the number because that place was originally turned off
        ; Turn off you AND then NOT the rest of the number 
        ; Invert you XOR with the power of 2 for the bit you want to invert

        ; How to zero out the top 16 bits
        ; mov ebx, 0000FFFH
        ; mov eax, -1
        ; and eax, ebx
        ; dump_regs 1

        ; You compare the far left bit to see if you get a zero or a one and that tells you if you get positive or negative
        ; Perfect power of two you AND the number with itself then minus 1

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


