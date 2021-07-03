section .data
_C_stdio#nl db 0xa ;Newline
len_C_stdio#nl equ $- _C_stdio#nl

section .text

_M_print:
mov ebx,1
mov eax,4
int 0x80
ret

_M_exit:
mov eax,1
int 0x80
ret

_M_read:
mov ebx,2
mov eax,3
int 0x80
ret

_M_cwd:
mov eax,0x4f
int 0x80
ret

;;; STRLEN

_M_strlen:
mov ebx,eax ; Store the string in a temporary location
jmp _M_strlen#next_block ; Goto _M_strlen#next_block

_M_strlen#next_block:
cmp word [eax],_C_null ; Compare the string with null
jz _M_strlen#rollback_block ; If string is null the goto _M_strlen#rollback_block
add eax,_C_bytes#count ; Goto the next byte
jmp _M_strlen#next_block ; Repeat

_M_strlen#rollback_block:
sub eax,_C_bytes#count ; Remove the last character from the string
jmp _M_strlen#final_block ; Goto _M_strlen#final_block

_M_strlen#final_block:
cmp byte[eax], _C_null ; Check if the string is null
jz _M_strlen#exit ; Exit if it is
inc eax
jmp _M_strlen#final_block ; Repeat

_M_strlen#exit:
sub eax,ebx ; Get the differance between eax and ebx then store in eax
ret ; return

;;; to_string

_M_tostring:
mov ecx,0
call _M_tostring#int_pad

_M_tostring#int_pad:
cmp ecx,ebx
jz _M_tostring#exit
mov edx,eax
add edx,0x30
mov [eax],edx
add eax,0x2

_M_tostring#exit:
ret
;;; Println

_M_println:
call _M_print
mov ecx,_C_stdio#nl
mov edx,len_C_stdio#nl
call _M_print
ret

_M_getuid:
mov eax,102
int 0x80