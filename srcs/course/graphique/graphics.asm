org 100h

section .text
;set graphics mode 320x200 256 colors
mov ax, 13h
int 10h



; we'll reset the screen to text mode
; wait for a keypress
mov ax, 0c01h
int 21h

; set back normal display mode
mov ax, 03
int 10h

; exit to dos
int 20h
`