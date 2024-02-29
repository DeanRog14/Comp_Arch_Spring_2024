; Author: Megan Avery Spring 2024 

%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;
message db "Happy UnBirthday!", 0
flame db "   🔥", 0
candle_body db "   #", 0

cake db "*******", 0

plate db "-------", 0

segment .bss
;
; uninitialized data is put in the bss segment
;


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
       pusha

;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;
		mov ecx, $ + 7	; getting us ready for the return address
		jmp short print_candle

		mov ecx, post_cake	; this sets us to be ready to return to post_cake
		jmp short print_cake

post_cake:
		mov ecx, $ + 7
		jmp short print_plate

		call print_nl
		mov eax, message
		call print_string
		
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

print_candle:
		mov eax, flame
		call print_string
		call print_nl

		mov eax, candle_body
		call print_string
		call print_nl
		call print_string
		call print_nl

		jmp ecx ; end of program 

print_cake:	; Subprogram
		mov eax, cake

		mov ebx, ecx ; saves off the return address

		mov ecx, 3
print_cake_row:	; For loop inside sub program
		call print_string
		call print_nl
		
		loop print_cake_row

		mov ecx, ebx	; easy to get a segfault if you dont restore ecx correctly
		jmp ecx	; end of program
	
print_plate:
		mov eax, plate
		call print_string
		call print_nl

		jmp ecx	; end of program
