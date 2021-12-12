
; the structure of the date
struc  my_date
    .day: resw 1
    .month: resw 1
    .year: resd 1
endstruc

section .text
    global ages
    extern printf

ages:
    push    ebp
    mov     ebp, esp
    pusha
    
    mov     edx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; present
    mov     edi, [ebp + 16] ; dates
    mov     ecx, [ebp + 20] ; all_ages

    sub edx, 1
    
label:
    mov  eax, [esi + 4]
    mov  ebx, [edi + my_date_size * edx + my_date.year]
    sub eax, ebx
    mov [ecx + 4 * edx], eax

    xor eax, eax
    mov  eax, [esi + 2]
    xor ebx, ebx
    mov  ebx, [edi + my_date_size * edx + my_date.month]

    cmp bx, ax
    jg label_decrement

    cmp bx, ax
    je label_ceva

    dec edx
    cmp edx, 0
    jge label
    jl ending
   
    
label_ceva:

    xor eax, eax
    mov  eax, [esi]
    xor ebx, ebx
    mov  ebx, [edi + my_date_size * edx + my_date.day]

    cmp word [ecx + 4 * edx], 0
    je possible_jump

    cmp bx, ax
    jg label_decrement
    
    ;PRINTF32 `%hd\n\x0`, eax
    ;PRINTF32 `%hd\n\x0`, ebx

    cmp ax, bx
    jl gunoi_0

    dec edx
    cmp edx, 0
    jge label

    cmp edx, 0
    jl ending

gunoi_0:
    mov word [ecx + 4 * edx], 0
    dec edx
    cmp edx, 0
    jge label

label_decrement:
    xor eax, eax
    mov eax, [ecx + 4 * edx]
    sub eax, 1
    mov [ecx + 4 * edx], eax
    dec edx
    cmp edx, 0
    jge label

possible_jump:
    dec edx
    cmp edx, 0
    jge label

ending:
    popa
    leave
    ret