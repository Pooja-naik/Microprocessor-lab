.intel_mnemonic
.intel_syntax noprefix
.data
str:.ascii "ab"
    .equ len,.-str

.ds 100
store1:
.ds 100


.macro display address,length
lea ecx,\address
mov edx,1
mov eax,[ecx]
mov esi,eax
shr eax,4
and al,0x0f
add eax,0x30
mov [ecx],eax
mov eax,4
mov ebx,1
int 0x80

mov eax,esi
and al,0x0f
add eax,0x30
mov [ecx],eax
mov eax,4
mov ebx,1
int 0x80
.endm

.macro read address,length
lea ecx,\address
mov edx,\length
mov eax,3
mov ebx,2
int 0x80
.endm

.text
.global _start
_start:mov ecx,2
lea esi,str
mov al,0
up:mov bl,byte ptr[esi]
add al,bl
inc esi
loop up

display str,100



mov eax,1
int 0x80



