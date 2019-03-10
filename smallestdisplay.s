.intel_mnemonic
.intel_syntax noprefix
.data
store:
.ds 100
store1:
.ds 100
store2:
.ds 100
msg1: .ascii "sall is:"
      .equ len,.-msg1
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

.text
.global _start
_start:read store,100
read (store+1),100
read (store+2),100
read (store+3),100
read (store+4),100
display store,100

lea esi,store
lea edi,disp
mov ecx,4
     mov al,[esi]
    repeat: mov bl,[esi+1]
     cmp al,bl
      jc nt
     mov al,bl
nt:inc esi
   loop repeat 
mov [edi],eax
display msg1,len

display disp,100
    



mov eax,1
int 0x80
