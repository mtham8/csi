; total
; get length of string
; loop over string
; for each character
; total += value * 2^(length-index)

section .text
global binary_convert
binary_convert:
	xor rax, rax ; total
	xor rsi, rsi ; length of string; rdi = string
	jmp string_length
	ret

; string length
; size_t strlen(const char *c) {
; 	long length = 0;
; 	while (*s != '\0') {
; 		s++;
; 		length++
; 	}
; 	return length
; }
string_length:
; still figuring out this
	inc rsi
	inc rcx
	; how to get string[i]?
	cmp rcx, 0
	jne string_length
