org 100h

section .data 
; draw blinky in pacman 
Blinky db 0,0,0,0,0,0,0,0
       db 0,0,0,0,0,0,0,0
       db 0,0,0,0,0,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,1,1,1,1,0,0
       db 0,0,1,1,1,1,0,0
       db 0,0,1,1,1,1,0,0
       db 0,0,1,1,1,1,0,0
       db 0,0,1,1,1,1,0,0
       db 0,0,1,1,1,1,0,0
       db 0,0,1,1,1,1,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,1,1,0,0,0
       db 0,0,0,0,0,0,0,0
       db 0,0,0,0,0,0,0,0


section .text

; build pixel
mov ah, 00h
mov al, 13h
int 10h

call clearScreen
call printSprite



; we'll reset the screen to text mode
; wait for a keypress
mov ax, 0c01h
int 21h

; set back normal display mode
mov ax, 03
int 10h

; exit to dos
int 20h

clearScreen:

mov ax, 0xA000
mov es, ax
mov di, 0 
mov cx, 200*320
rep stosb
ret 

printSprite:
mov ax, 0xA000
mov es, ax
mov di, 0
mov si, Blinky
mov dx, 8
eachLine:
mov cx, 8
rep movsb
add di, 320-8
dec dx
jnz eachLine
ret

