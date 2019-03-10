.intel_mnemonic
.intel_syntax noprefix
.data
table:.byte 0,1,4,9,0x16,0x25,0x36,0x49,0x64,0x81
store:.ds 100
str:.ds 100

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
_start:
read str,100
mov ecx,1
lea edi,store
lea esi,str
pooja:
       
       mov eax,[esi]
       mov ebx,0x30
       sub eax,ebx
       mov [edi],eax
       inc esi
       inc edi
       loop pooja
mov esi,[edi]
lea ebx,table
lea esi,str
mov al,[esi]
xlat
mov ecx,1
lea edi,store
mov bl,al
repeat:and al,0xf0
ror al,4
cmp al,0x30
jc nt
add al,7
nt:add al,0x30
mov [edi],al
inc edi
mov al,bl
and al,0x0f

cmp al,0x30
jc nt1
add al,7
nt1:add al,0x30
mov [edi],al
inc edi
loop repeat

display store,100
mov eax,1
int 0x80





