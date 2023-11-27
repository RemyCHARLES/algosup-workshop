section .data
    maze_data db "######################################",10
              db "#............##............##........#",10
              db "#.####.#####.##.####.#####.##.#####.#",10
              db "#o####.#####.##.####.#####.##.#####o#",10
              db "#....................................#",10
              db "#.####.##.########.##.########.##.####",10
              db "#......##....##....##....##....##....#",10
              db "######.##### ##.########.##.#####.####",10
              db "     #.##### ##.########.##.#####.#   ",10
              db "     #......  ....  ....  ....  ....  #",10
              db "######.##.####################.##.####",10
              db "#............##............##........#",10
              db "#.####.#####.##.####.#####.##.#####.#",10
              db "#o..##......................##....o#",10
              db "###.##.##.########.##.########.##.###",10
              db "#......##....##....##....##....##....#",10
              db "#.##########.##### ##.#####.########.#",10
              db "#............##............##........#",10
              db "######################################",10
    maze_width db 42 ; Width of each line in the maze, including newline character
    maze_height db 19 ; Total number of lines in the maze

section .bss
    pixel_x resb 1
    pixel_y resb 1

section .text

mov ah, 00h ; set video mode requirement
mov al, 13h ; set video mode option o 320 x 200 256 colors
int 10h

global _start

_start:
    ; Initialize graphics mode here (e.g., Mode 13h for 320x200 with 256 colors)
    ; ...

    ; Draw the maze
    call draw_maze

    ; Hang the system (or implement a game loop)
    jmp $

draw_maze:
    xor ebx, ebx ; EBX will keep track of the Y coordinate

    mov esi, maze_data ; ESI points to the start of the maze data
    mov ecx, maze_height ; ECX is the counter for the number of lines

draw_maze_line:
    mov edx, maze_width ; EDX is the counter for each character in the line

draw_maze_character:
    mov al, byte [esi] ; Load the current character from maze_data
    cmp al, 10 ; Check for newline character
    je next_line

    ; Call appropriate drawing routine based on character
    cmp al, '#'
    je draw_wall
    cmp al, '.'
    je draw_dot
    cmp al, 'o'
    je draw_power_pellet
    ; Space character implies path (black background)
    ; Other drawing logic...

next_character:
    inc esi ; Move to next character
    dec edx
    jnz draw_maze_character

next_line:
    inc ebx ; Move to the next line
    dec ecx
    jnz draw_maze_line

    ret

draw_wall:
    ; Code to draw a wall segment in blue
    ; This requires specific implementation based on the graphics mode
    ; Example: call set_pixel, x, y, blue_color_code
    ret

draw_dot:
    ; Code to draw a dot in white
    ; Example: call set_pixel, x, y, white_color_code
    ret

draw_power_pellet:
    ; Code to draw a power pellet (larger white dot)
    ; Example: call set_pixel, x, y, white_color_code
    ret

; Implement set_pixel routine based on the graphics mode
; set_pixel:
;   ; Set a pixel at a specific x, y coordinate with a given color
;   ret
