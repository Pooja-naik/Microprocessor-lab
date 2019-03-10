.intel_mnemonic
.intel_syntax noprefix
.data
str:
.ds 100
store1:
.ds 100
rstr:
.ds 100
sg1:.ascii "palin"
.equ len1,.-sg1
sg2:.ascii " not palin"
.equ len2,.-sg2
n1:.ascii "\n"
   .equ len3,.-n1 

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
_start:read str,100
display str,100

mov ecx,5
lea esi,str
lea edi,rstr
add edi,5
dec edi
cld
up:movsb
sub edi,2
loop up

display rstr,5
mov ecx,5
lea esi,str
lea edi,rstr
repe cmpsb
jnz nt1
display n1,len3
display sg1,len1
jmp skip
nt1:display sg2,len2

skip:nop
int 0x80
mov eax,1
int 0x80



