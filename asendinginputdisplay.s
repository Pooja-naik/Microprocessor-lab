.intel_mnemonic
.intel_syntax noprefix
.data
store:
.ds 100

disp:
.ds 100
disp1:.ascii "sorted array:"
      .equ len,.-disp1
n1:.ascii "\n"
   .equ len1,.-n1 

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
call bub
lea esi,store

       display disp1,len
display n1,len1
display store,100
mov eax,1
int 0x80
     
bub: mov ecx,4
     again: lea esi,store
      mov edx,4
     repeat: mov al,[esi]
      mov bl,[esi+1]
      cmp al,bl
       jc nt
xchg al,bl
mov [esi],al
mov [esi+1],bl
nt:inc esi
    dec edx
  jnz repeat
loop again

ret






