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

    xor ebx, ebx

reversed_one_time_pad :
    ; determining the position of the index len - i - 1
    xor eax, eax
    add eax, ecx
    sub eax, ebx
    sub eax, 1
    
    mov ah, byte [edi + 1 + eax - 1]    ; accesing key[len - i - 1] character
    mov al, byte [esi + 1 + ebx - 1]    ; accesing p[i] character
    xor al, ah                          ; application of the xor operation
    mov byte [edx + 1 + ebx - 1], al    ; adding the result to register
    
    ; repeating the execution 
    inc ebx 
    cmp ecx,ebx 
    jg reversed_one_time_pad

    popa
    leave
    ret