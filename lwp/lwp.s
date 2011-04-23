	.file	"lwp.c"
.globl total_procs
	.bss
	.align 4
	.type	total_procs, @object
	.size	total_procs, 4
total_procs:
	.zero	4
	.comm	lwp_ptable,480,32
.globl lwp_procs
	.align 4
	.type	lwp_procs, @object
	.size	lwp_procs, 4
lwp_procs:
	.zero	4
.globl lwp_running
	.data
	.align 4
	.type	lwp_running, @object
	.size	lwp_running, 4
lwp_running:
	.long	-1
.globl stackToFree
	.bss
	.align 4
	.type	stackToFree, @object
	.size	stackToFree, 4
stackToFree:
	.zero	4
.globl lwp_sched
	.align 4
	.type	lwp_sched, @object
	.size	lwp_sched, 4
lwp_sched:
	.zero	4
	.comm	original_stack_pointer,4,4
	.text
.globl setRunning
	.type	setRunning, @function
setRunning:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	lwp_sched, %eax
	testl	%eax, %eax
	je	.L2
	movl	lwp_sched, %eax
	call	*%eax
	movl	%eax, lwp_running
	jmp	.L4
.L2:
	movl	lwp_running, %eax
	addl	$1, %eax
	movl	%eax, lwp_running
	movl	lwp_running, %edx
	movl	lwp_procs, %eax
	cmpl	%eax, %edx
	jl	.L4
	movl	$0, lwp_running
.L4:
	leave
	ret
	.size	setRunning, .-setRunning
.globl cleanup
	.type	cleanup, @function
cleanup:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	lwp_running, %eax
	movl	%eax, -4(%ebp)
	jmp	.L6
.L7:
	movl	-4(%ebp), %eax
	movl	-4(%ebp), %edx
	addl	$1, %edx
	sall	$4, %eax
	sall	$4, %edx
	movl	lwp_ptable(%edx), %ecx
	movl	%ecx, lwp_ptable(%eax)
	movl	lwp_ptable+4(%edx), %ecx
	movl	%ecx, lwp_ptable+4(%eax)
	movl	lwp_ptable+8(%edx), %ecx
	movl	%ecx, lwp_ptable+8(%eax)
	movl	lwp_ptable+12(%edx), %edx
	movl	%edx, lwp_ptable+12(%eax)
	addl	$1, -4(%ebp)
.L6:
	movl	lwp_procs, %eax
	cmpl	%eax, -4(%ebp)
	jl	.L7
	leave
	ret
	.size	cleanup, .-cleanup
.globl freeStack
	.type	freeStack, @function
freeStack:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	stackToFree, %eax
	movl	%eax, (%esp)
	call	free
	leave
	ret
	.size	freeStack, .-freeStack
	.section	.rodata
.LC0:
	.string	"malloc: stack"
	.text
.globl new_lwp
	.type	new_lwp, @function
new_lwp:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	lwp_procs, %eax
	cmpl	$29, %eax
	jle	.L12
	movl	$-1, %eax
	jmp	.L13
.L12:
	movl	lwp_procs, %eax
	sall	$4, %eax
	addl	$lwp_ptable, %eax
	movl	%eax, -12(%ebp)
	movl	total_procs, %eax
	addl	$1, %eax
	movl	%eax, total_procs
	movl	total_procs, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	16(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L14
	movl	$.LC0, (%esp)
	call	perror
	movl	$-1, %eax
	jmp	.L13
.L14:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	$-559038737, (%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	subl	$1, %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	leal	-4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	$lwp_exit, %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	leal	-4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	leal	-4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	leal	-28(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	movl	lwp_procs, %eax
	addl	$1, %eax
	movl	%eax, lwp_procs
	movl	total_procs, %eax
.L13:
	leave
	ret
	.size	new_lwp, .-new_lwp
.globl lwp_exit
	.type	lwp_exit, @function
lwp_exit:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	lwp_procs, %eax
	subl	$1, %eax
	movl	%eax, lwp_procs
	movl	lwp_running, %eax
	sall	$4, %eax
	movl	lwp_ptable+4(%eax), %eax
	movl	%eax, stackToFree
	movl	lwp_procs, %eax
	testl	%eax, %eax
	jne	.L17
	movl	original_stack_pointer, %eax
#APP
# 122 "lwp.c" 1
	movl  %eax,%esp
# 0 "" 2
#NO_APP
	call	freeStack
	call	lwp_stop
.L17:
	call	cleanup
	call	setRunning
	call	freeStack
	movl	lwp_running, %eax
	sall	$4, %eax
	movl	lwp_ptable+12(%eax), %eax
#APP
# 134 "lwp.c" 1
	movl  %eax,%esp
# 0 "" 2
# 135 "lwp.c" 1
	popl  %ebp
# 0 "" 2
# 135 "lwp.c" 1
	popl  %edi
# 0 "" 2
# 135 "lwp.c" 1
	popl  %esi
# 0 "" 2
# 135 "lwp.c" 1
	popl  %edx
# 0 "" 2
# 135 "lwp.c" 1
	popl  %ecx
# 0 "" 2
# 135 "lwp.c" 1
	popl  %ebx
# 0 "" 2
# 135 "lwp.c" 1
	popl  %eax
# 0 "" 2
# 135 "lwp.c" 1
	movl  %ebp,%esp
# 0 "" 2
#NO_APP
	leave
	ret
	.size	lwp_exit, .-lwp_exit
.globl lwp_getpid
	.type	lwp_getpid, @function
lwp_getpid:
	pushl	%ebp
	movl	%esp, %ebp
	movl	lwp_running, %eax
	sall	$4, %eax
	movl	lwp_ptable(%eax), %eax
	popl	%ebp
	ret
	.size	lwp_getpid, .-lwp_getpid
.globl lwp_yield
	.type	lwp_yield, @function
lwp_yield:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
#APP
# 144 "lwp.c" 1
	pushl %eax
# 0 "" 2
# 144 "lwp.c" 1
	pushl %ebx
# 0 "" 2
# 144 "lwp.c" 1
	pushl %ecx
# 0 "" 2
# 144 "lwp.c" 1
	pushl %edx
# 0 "" 2
# 144 "lwp.c" 1
	pushl %esi
# 0 "" 2
# 144 "lwp.c" 1
	pushl %edi
# 0 "" 2
# 144 "lwp.c" 1
	pushl %ebp
# 0 "" 2
#NO_APP
	movl	lwp_running, %edx
#APP
# 145 "lwp.c" 1
	movl  %esp,%eax
# 0 "" 2
#NO_APP
	sall	$4, %edx
	movl	%eax, lwp_ptable+12(%edx)
	call	setRunning
	movl	lwp_running, %eax
	sall	$4, %eax
	movl	lwp_ptable+12(%eax), %eax
#APP
# 150 "lwp.c" 1
	movl  %eax,%esp
# 0 "" 2
# 151 "lwp.c" 1
	popl  %ebp
# 0 "" 2
# 151 "lwp.c" 1
	popl  %edi
# 0 "" 2
# 151 "lwp.c" 1
	popl  %esi
# 0 "" 2
# 151 "lwp.c" 1
	popl  %edx
# 0 "" 2
# 151 "lwp.c" 1
	popl  %ecx
# 0 "" 2
# 151 "lwp.c" 1
	popl  %ebx
# 0 "" 2
# 151 "lwp.c" 1
	popl  %eax
# 0 "" 2
# 151 "lwp.c" 1
	movl  %ebp,%esp
# 0 "" 2
#NO_APP
	leave
	ret
	.size	lwp_yield, .-lwp_yield
.globl lwp_start
	.type	lwp_start, @function
lwp_start:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
#APP
# 158 "lwp.c" 1
	pushl %eax
# 0 "" 2
# 158 "lwp.c" 1
	pushl %ebx
# 0 "" 2
# 158 "lwp.c" 1
	pushl %ecx
# 0 "" 2
# 158 "lwp.c" 1
	pushl %edx
# 0 "" 2
# 158 "lwp.c" 1
	pushl %esi
# 0 "" 2
# 158 "lwp.c" 1
	pushl %edi
# 0 "" 2
# 158 "lwp.c" 1
	pushl %ebp
# 0 "" 2
# 159 "lwp.c" 1
	movl  %esp,%eax
# 0 "" 2
#NO_APP
	movl	%eax, original_stack_pointer
	movl	lwp_procs, %eax
	testl	%eax, %eax
	jne	.L24
	movl	original_stack_pointer, %eax
#APP
# 164 "lwp.c" 1
	movl  %eax,%esp
# 0 "" 2
# 165 "lwp.c" 1
	popl  %ebp
# 0 "" 2
# 165 "lwp.c" 1
	popl  %edi
# 0 "" 2
# 165 "lwp.c" 1
	popl  %esi
# 0 "" 2
# 165 "lwp.c" 1
	popl  %edx
# 0 "" 2
# 165 "lwp.c" 1
	popl  %ecx
# 0 "" 2
# 165 "lwp.c" 1
	popl  %ebx
# 0 "" 2
# 165 "lwp.c" 1
	popl  %eax
# 0 "" 2
# 165 "lwp.c" 1
	movl  %ebp,%esp
# 0 "" 2
#NO_APP
	jmp	.L26
.L24:
	call	setRunning
	movl	lwp_running, %eax
	sall	$4, %eax
	movl	lwp_ptable+12(%eax), %eax
#APP
# 172 "lwp.c" 1
	movl  %eax,%esp
# 0 "" 2
# 173 "lwp.c" 1
	popl  %ebp
# 0 "" 2
# 173 "lwp.c" 1
	popl  %edi
# 0 "" 2
# 173 "lwp.c" 1
	popl  %esi
# 0 "" 2
# 173 "lwp.c" 1
	popl  %edx
# 0 "" 2
# 173 "lwp.c" 1
	popl  %ecx
# 0 "" 2
# 173 "lwp.c" 1
	popl  %ebx
# 0 "" 2
# 173 "lwp.c" 1
	popl  %eax
# 0 "" 2
# 173 "lwp.c" 1
	movl  %ebp,%esp
# 0 "" 2
#NO_APP
	nop
.L26:
	leave
	ret
	.size	lwp_start, .-lwp_start
.globl lwp_stop
	.type	lwp_stop, @function
lwp_stop:
	pushl	%ebp
	movl	%esp, %ebp
	movl	lwp_procs, %eax
	cmpl	$1, %eax
	jne	.L28
#APP
# 179 "lwp.c" 1
	pushl %eax
# 0 "" 2
# 179 "lwp.c" 1
	pushl %ebx
# 0 "" 2
# 179 "lwp.c" 1
	pushl %ecx
# 0 "" 2
# 179 "lwp.c" 1
	pushl %edx
# 0 "" 2
# 179 "lwp.c" 1
	pushl %esi
# 0 "" 2
# 179 "lwp.c" 1
	pushl %edi
# 0 "" 2
# 179 "lwp.c" 1
	pushl %ebp
# 0 "" 2
#NO_APP
	movl	lwp_running, %edx
#APP
# 180 "lwp.c" 1
	movl  %esp,%eax
# 0 "" 2
#NO_APP
	sall	$4, %edx
	movl	%eax, lwp_ptable+12(%edx)
.L28:
	movl	original_stack_pointer, %eax
#APP
# 183 "lwp.c" 1
	movl  %eax,%esp
# 0 "" 2
# 184 "lwp.c" 1
	popl  %ebp
# 0 "" 2
# 184 "lwp.c" 1
	popl  %edi
# 0 "" 2
# 184 "lwp.c" 1
	popl  %esi
# 0 "" 2
# 184 "lwp.c" 1
	popl  %edx
# 0 "" 2
# 184 "lwp.c" 1
	popl  %ecx
# 0 "" 2
# 184 "lwp.c" 1
	popl  %ebx
# 0 "" 2
# 184 "lwp.c" 1
	popl  %eax
# 0 "" 2
# 184 "lwp.c" 1
	movl  %ebp,%esp
# 0 "" 2
#NO_APP
	popl	%ebp
	ret
	.size	lwp_stop, .-lwp_stop
.globl lwp_set_scheduler
	.type	lwp_set_scheduler, @function
lwp_set_scheduler:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	%eax, lwp_sched
	popl	%ebp
	ret
	.size	lwp_set_scheduler, .-lwp_set_scheduler
	.ident	"GCC: (GNU) 4.4.1 20090725 (Red Hat 4.4.1-2)"
	.section	.note.GNU-stack,"",@progbits
