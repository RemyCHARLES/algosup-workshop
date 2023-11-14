org 100h

section .data
    hello db 'Hello, World!', 0

section .text
 
    mov si, hello    

print_string:

    lodsb       
    cmp al, 0          
    je end_print         
    mov ah, 0Eh          
    int 10h                            
    jmp print_string     

end_print:

    mov ah, 4Ch          
    xor al, al           
    int 21h             
