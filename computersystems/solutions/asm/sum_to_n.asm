; int sum_to_n(n) {
;     int total = 0;

;     for (int i = 0; i <= n; i++)
;         total += i;

;     return total;
; }

section .text
global sum_to_n

sum_to_n:
	xor rax, rax ; total
	xor rsi, rsi; i, rdi = n
	jmp loop
	ret

loop:
	add rax, rsi
	inc rsi
	cmp rsi, rdi
	jle loop