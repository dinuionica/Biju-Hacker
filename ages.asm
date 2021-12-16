
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
    
    mov     edx, [ebp + 8]      ; len
    mov     esi, [ebp + 12]     ; present
    mov     edi, [ebp + 16]     ; dates
    mov     ecx, [ebp + 20]     ; all_ages

    ; decreases the value of the counter by 1   
    sub edx, 1   
    
calculate_age:
    ; accessing the current year
    mov  eax, [esi + 4]
    ; accessing the year of the date
    mov  ebx, [edi + my_date_size * edx + my_date.year]   
    ; the difference between the two years
    sub eax, ebx
    ; adding the result in the final register
    mov [ecx + 4 * edx], eax


    xor eax, eax
    ; accessing the current month
    mov ax, word [esi + 2]
    xor ebx, ebx
    ; accessing the month of the date
    mov bx, word [edi + my_date_size * edx + my_date.month]

    ; if the month of the date is greater than 
    ; the current month, apply a decrement
    cmp bx, ax
    jg apply_decrement

    ; compare the two months, and if they are equal go to update_date
    cmp bx, ax
    je update_date

    ; continuation of the iteration
    jmp update_iteration
    jmp ending
   
update_date:
    xor eax, eax
    ; accessing the current day
    mov ax, word [esi]
    xor ebx, ebx
    ; accessing the day of the date
    mov bx, word [edi + my_date_size * edx + my_date.day]

    ; if the difference between the years is 0, continue the iteration
    cmp word [ecx + 4 * edx], 0
    je update_iteration

    ; if the day of the date is greater than the current day apply a decrement
    cmp bx, ax
    jg apply_decrement

    ; after applying the decrement, if the day of the date is
    ; greater than the current day, it means that the date is invalid
    cmp bx, ax
    jg invalid_date

    jmp update_iteration

    ; if the contor has reached the end, execution stops
    cmp edx, 0
    jl ending

invalid_date:
    ; adds value 0 to registry for invalid date
    mov word [ecx + 4 * edx], 0
    jmp update_iteration

apply_decrement:
    xor eax, eax
    ; accessing the year value
    mov eax, [ecx + 4 * edx]
    ; decreases the value by 1 
    sub eax, 1
    ; adding the result in the final register
    mov [ecx + 4 * edx], eax
    jmp update_iteration

update_iteration:
    ; decreases the value of register by 1  
    dec edx 
    ; compare the current value with 0, and if
    ; it is greater, continue the iteration
    cmp edx, 0
    jge calculate_age

ending:
    popa
    leave
    ret
    