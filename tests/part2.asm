section .data

text db "Hello from PART2"
lenText equ $- text


section .text
%include "../stdio.asm"
%include "../constants.asm"

global _P2_METHOD

_P2_METHOD:
mov edx, lenText
mov ecx, text
call _M_println