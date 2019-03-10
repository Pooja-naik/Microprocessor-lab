.intel_mnemonic
.intel_syntax noprefix
.data
str1:
.ds 100
str2:
.ds 100
str:
.ds 100
str4:
.ds 100
store:
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
_start:

read str1,100
read str2,100
read str,100

lea esi,str1
lea edi,store
mov ecx,5
rep movsb

lea esi,str2
lea edi,store
add edi,5
mov ecx,4
rep movsb
display str1,5
display str2,4
display str,3
mov eax,1
int 0x80



