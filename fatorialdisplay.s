.intel_mnemonic
.intel_syntax noprefix
.data
store:
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


.text
.global _start
_start:read store,100
lea esi,store


       
       mov eax,[esi]
       mov ebx,0x30
       sub eax,ebx
       mov [edi],eax
      
      
     
mov ecx,[edi]
       call fat


lea esi,store
mov [esi],eax
call disp1

mov eax,1
int 0x80
fat:
mov eax,1
   up: mul ecx
loop up
ret

disp1:mov ecx,2
lea esi,store
lea edi,disp
repeat:mov al,[esi+1]

and al,0xf0
ror al,4
cmp al,0x0a
jc nt
add al,7
nt:
add al,0x30
mov [edi],al
inc edi
mov al,[esi+1]

and al,0x0f

cmp al,0x0a
jc nt1
add al,7
nt1:
add al,0x30
mov [edi],al
 dec esi
inc edi
loop repeat
display disp,100
ret









