section .text
    global rotp

rotp:
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; len

    ; initializes the counter with 0
    xor ebx, ebx

reversed_one_time_pad :
    ; determining the position of the index len - i - 1
    xor eax, eax
    add eax, ecx
    sub eax, ebx
    sub eax, 1
    
    ; accesing key[len - i - 1] character
    mov ah, byte [edi + 1 + eax - 1] 
    ; accesing p[i] character
    mov al, byte [esi + 1 + ebx - 1]
    ; application of the xor operation
    xor al, ah
    ; adding the result to register
    mov byte [edx + 1 + ebx - 1], al
    
    ; repeating the execution 
    inc ebx 
    ; compare the current counter with the length of the string
    cmp ecx,ebx 
    jg reversed_one_time_pad

    popa
    leave
    ret
    