.intel_mnemonic
.intel_syntax noprefix
.data
store:
.ds 100
store1:
     .ds 100
store2:
.ds 100
store3:
.ds 100
store4:
.ds 100
disp:
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

.macro out
mov eax,1
int 0x80
.endm

.text

.global _start

_start:
read store1,100
read store2,100

lea edi,store3
lea esi,store1
mov ecx,4
pooja:
       
       mov eax,[esi]
       mov ebx,0x30
       sub eax,ebx
       mov [edi],eax
       inc esi
       inc edi
       loop pooja


lea edi,store4
lea esi,store2
mov ecx,4
poo:
       
       mov eax,[esi]
       mov ebx,0x30
       sub eax,ebx
       mov [edi],eax
       inc esi
       inc edi
       loop poo

lea esi,store3
mov eax,[esi]
mov ebx,eax
lea esi,store4
mov eax,[esi]
add eax,ebx

lea edi,store
mov [edi],eax

lea esi,store
lea edi,disp

mov ecx,4


repeat:mov al,[esi+0]

and al,0xf0

ror al,4
cmp al,0x0a
jc nxt
add al,7
nxt:add al,0x30

mov [edi],al

mov al,[esi+0]
and al,0x0f

cmp al,0x0a
jc nxt1
add al,7
nxt1:add al,0x30
mov [edi],al

inc edi
inc esi
loop repeat
int 0x80

display disp,100

out
