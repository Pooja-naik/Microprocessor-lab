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
mov edx,\length
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



mov eax,1
int 0x80



