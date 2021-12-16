section .data
    extern len_cheie, len_haystack
    index dd 0
    counter_key dd 0
    counter_haystack dd 0

section .text
    extern printf   
    global columnar_transposition

columnar_transposition:
    push    ebp
    mov     ebp, esp
    pusha 

    mov edi, [ebp + 8]      ; key
    mov esi, [ebp + 12]     ; haystack
    mov ebx, [ebp + 16]     ; ciphertext
    

    ; initialization of the index specific of characters from the final string
    mov dword [index], 0

    ; determining the value of the number of lines by dividing the two lengths
    mov eax, [len_haystack]
    mov ecx, [len_cheie]
    xor edx, edx
    div ecx
    add eax, 1

    ; initialization of the counter used for the key iteration
    xor ecx, ecx 

for_key:
    ; accessing the counter value specific to the key iteration
    mov [counter_key], ecx

    xor edx, edx
    ; offset determination by key
    mov edx, [edi + 4 * ecx] 
    mov ecx, edx

    ; initialization of the counter used for the haystack iteration
    xor edx, edx

for_haystack:
    ; accessing the counter value specific to the haystack iteration
    mov [counter_haystack], edx
    ; adding registers to the stack so that values ​​can be changed
    push eax
    push ecx

    ; multiplying the key length by the value of
    ; the current index in the haystack-specific iteration
    mov eax, [len_cheie]
    mov ecx, edx
    xor edx, edx
    mul ecx

    pop ecx 
    ; determining the final offset for accessing the character
    add eax, ecx

    ; if the calculated offset exceeds the length of the haystack,
    ; the iteration continues without changing the final current character
    cmp eax, [len_haystack]
    jge update_iterrations

    push ecx

    xor ch, ch
    ; accessing the desired character based on the determined offset
    mov ch, [esi + eax]
    ; accessing the index of character-specific from the final string
    xor edx, edx
    mov edx, [index]
    ; adding the resulting character to the final string
    mov [ebx + edx], ch
    ; index update
    add edx, 1
    mov [index], edx

    pop ecx
    
update_iterrations:
    
    pop eax
    ; determines the value of the haystack-specific counter
    xor edx, edx
    mov edx, [counter_haystack]
    ; increases the value
    inc edx
    ; if the contour has not reached the end, continue the iteration
    cmp eax, edx
    jg for_haystack
    
    ; determines the value of the key-specific counter
    xor ecx, ecx
    mov ecx, [counter_key]
    ; increases the value
    inc ecx
    cmp [len_cheie], ecx
    ; if the contour has not reached the end, continue the iteration
    jg for_key

ending:
    popa
    leave
    ret
