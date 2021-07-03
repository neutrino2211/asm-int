section .data

question db "What is your name : " ;Question to ask
len equ $ - question

response db "Your name is : " ;Reply
lenResp equ $- response

test_string dw 0x41,0x42,0x43
lenTS equ $- test_string

directory times 50 dw 0x0

nl db 0xa ;Newline
lenNL equ $- nl

myint times 10 dw 0x41

section .bss

num resb 30 ;Name buffer
wd resb 30 ;Directory buffer

section .text

global _start

%include "./constants.asm"
%include "./stdio.asm"

_start:
mov edx,len
mov ecx,question
call _M_print

mov eax,num
call _M_strlen
mov ecx,num
mov edx,eax
call _M_read

mov ecx,response
mov edx,lenResp
call _M_print

mov eax,num
call _M_strlen
mov ecx,num
mov edx,eax
call _M_print

mov ecx,test_string
mov edx,lenTS
call _M_println

call _M_getuid
mov ecx,eax
mov edx,0x2
call _M_print

call _M_exit