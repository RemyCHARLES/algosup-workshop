org 100h

section .text
;set graphics mode 320x200 256 colors
mov ax, 13h
int 10h

mov ax, 0xA000
mov es, ax

mov di, 0
mov al, 0h

loopColor:
mov cx, 320
rep stosb

inc al

cmp al, 200
jb loopColor





; we'll reset the screen to text mode
; wait for a keypress
mov ax, 0c01h
int 21h

; set back normal display mode
mov ax, 03
int 10h

; exit to dos
int 20h
