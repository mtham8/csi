	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	leaq	L_.str(%rip), %rdi
	callq	_opendir$INODE64
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB0_2
## %bb.1:
	leaq	L_.str.1(%rip), %rdi
	callq	_perror
	movl	$1, -12(%rbp)
	jmp	LBB0_3
LBB0_2:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -56(%rbp)                 ## 8-byte Spill
	callq	_readdir$INODE64
	movq	-56(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rsi
	callq	_count_files
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %ecx
	movq	%rsp, %rdx
	movq	%rdx, -40(%rbp)
	imulq	$280, %rcx, %rax                ## imm = 0x118
	movq	%rcx, -64(%rbp)                 ## 8-byte Spill
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	movq	-64(%rbp), %rcx                 ## 8-byte Reload
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rdi
	movq	%rax, -72(%rbp)                 ## 8-byte Spill
	callq	_rewinddir$INODE64
	movq	-24(%rbp), %rdi
	movq	-24(%rbp), %rax
	movq	%rdi, -80(%rbp)                 ## 8-byte Spill
	movq	%rax, %rdi
	callq	_readdir$INODE64
	movq	-80(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rsi
	movq	-72(%rbp), %rdx                 ## 8-byte Reload
	callq	_populate_file_entries
	movl	-28(%rbp), %esi
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-24(%rbp), %rdi
	movl	%eax, -84(%rbp)                 ## 4-byte Spill
	callq	_closedir
	movl	%eax, -12(%rbp)
	movq	-40(%rbp), %rcx
	movq	%rcx, %rsp
LBB0_3:
	movl	-12(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -88(%rbp)                 ## 4-byte Spill
	jne	LBB0_5
## %bb.4:                               ## %SP_return
	movl	-88(%rbp), %eax                 ## 4-byte Reload
	movq	%rbp, %rsp
	popq	%rbp
	retq
LBB0_5:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function count_files
_count_files:                           ## @count_files
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rdi
	callq	_readdir$INODE64
	movq	%rax, -16(%rbp)
	cmpq	$0, %rax
	je	LBB1_3
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB1_1
LBB1_3:
	movl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function populate_file_entries
_populate_file_entries:                 ## @populate_file_entries
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rdi
	callq	_readdir$INODE64
	movq	%rax, -16(%rbp)
	cmpq	$0, %rax
	je	LBB2_6
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rax
	addq	$21, %rax
	movq	%rax, %rsi
	movl	$255, %edx
	callq	___strcpy_chk
	movq	-16(%rbp), %rcx
	addq	$21, %rcx
	movq	%rcx, -176(%rbp)
	movq	-176(%rbp), %rdi
	leaq	-168(%rbp), %rsi
	movq	%rax, -192(%rbp)                ## 8-byte Spill
	callq	_stat$INODE64
	movq	-72(%rbp), %rcx
                                        ## kill: def $ecx killed $ecx killed $rcx
	movl	%ecx, -180(%rbp)
	movslq	-180(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	%rdx, 256(%rsi)
	movw	-164(%rbp), %r8w
	movq	-24(%rbp), %rdx
	movw	%r8w, 264(%rdx)
	movl	-152(%rbp), %ecx
	movq	-24(%rbp), %rdx
	movl	%ecx, 268(%rdx)
	movq	-120(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	%rdx, 272(%rsi)
	movzwl	-164(%rbp), %ecx
	andl	$61440, %ecx                    ## imm = 0xF000
	cmpl	$16384, %ecx                    ## imm = 0x4000
	jne	LBB2_4
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	movl	268(%rax), %esi
	movq	-24(%rbp), %rax
	movzwl	264(%rax), %edx
	movq	-24(%rbp), %rax
	movq	256(%rax), %rcx
	movq	-24(%rbp), %r8
	movq	-24(%rbp), %rax
	movq	272(%rax), %r9
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB2_5
LBB2_4:                                 ##   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	movl	268(%rax), %esi
	movq	-24(%rbp), %rax
	movzwl	264(%rax), %edx
	movq	-24(%rbp), %rax
	movq	256(%rax), %rcx
	movq	-24(%rbp), %r8
	movq	-24(%rbp), %rax
	movq	272(%rax), %r9
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB2_5:                                 ##   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	addq	$280, %rax                      ## imm = 0x118
	movq	%rax, -24(%rbp)
	jmp	LBB2_1
LBB2_6:
	addq	$192, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"."

L_.str.1:                               ## @.str.1
	.asciz	"Unable to read directory"

L_.str.2:                               ## @.str.2
	.asciz	"Total Files: %d\n"

L_.str.3:                               ## @.str.3
	.asciz	"%3u dirt %4hu %8lld bytes %8s %10ld\n"

L_.str.4:                               ## @.str.4
	.asciz	"%3u file %4hu %8lld bytes %8s %10ld\n"

.subsections_via_symbols
