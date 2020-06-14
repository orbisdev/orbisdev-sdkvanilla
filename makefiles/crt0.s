.intel_syntax noprefix
.section ".text"

.global _start
.type _start, @function
_start:
push    rbp
mov     rbp, rsp
push    r15
push    r14
push    rbx
push    rax
mov     r14d, [rdi]
mov     rbx, rsi
lea     r15, [rdi+8]
call    _init_env
mov     rdi, rbx
call    atexit
xor     edx, edx       ;
mov     edi, r14d
mov     rsi, r15
call    main


# sceLibcParam
.align 0x8
.section ".data.rel.ro._sceLibcParam"
.global _sceLibcParam
_sceLibcParam: 
	.quad   0x90 		# Size 
	.quad 	0x10000000C	# Unknown?
	.quad	sceLibcHeapSize
	.quad	0
	.quad	sceLibcHeapExtendedAlloc
	.quad	0
	.quad	sceLibcMallocReplace
	.quad 	sceLibcNewReplace
	.quad	0
	.quad	0 			# Need_sceLibc
	.quad	0
	.quad	0
	.quad	sceLibcMallocReplaceForTls
	.quad 	0
	.quad 	0
	.quad 	0
	.quad	0
	.quad 	0

# sceKernelMemParam
.align 0x8
.section ".data.rel.ro._sceKernelMemParam"
.global _sceKernelMemParam
_sceKernelMemParam: 
	.quad   0x30		# Size
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0

# sceKernelFsParam
.align 0x8
.section ".data.rel.ro._sceKernelFsParam"
.global _sceKernelFsParam
_sceKernelFsParam:
	.quad 	0x10 		# Size
	.quad 	0

# sceLibcMallocReplace
.align 0x8
.section ".data.rel.ro._sceLibcMallocReplace"
.global sceLibcMallocReplace
sceLibcMallocReplace:
	.quad 	0x70 		# Size
	.quad 	1
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0

# sceLibcNewReplace
.align 0x8
.section ".data.rel.ro._sceLibcNewReplace"
.global sceLibcNewReplace
sceLibcNewReplace:
	.quad 	0x70 		# Size
	.quad 	2
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0

# sceLibcMallocReplaceForTls
.align 0x8
.section ".data.rel.ro._sceLibcMallocReplaceForTls"
.global sceLibcMallocReplaceForTls
sceLibcMallocReplaceForTls:
	.quad 	0x38		# Size
	.quad 	1
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0
	.quad 	0

# sce_process_param
.align 0x8
.section ".data.sce_process_param"
.global _sceProcessParam
_sceProcessParam:
	.quad 	0x50		# Size
	.long   0x4942524F	# Magic "ORBI"
	.long 	0x3 		# Entry count
	.quad 	0x4508101 	# SDK version
	.quad 	0
	.quad 	0
	.quad	sceUserMainThreadPriority
	.quad 	sceUserMainThreadStackSize
	.quad 	_sceLibcParam
	.quad 	_sceKernelMemParam
	.quad 	_sceKernelFsParam

# data globals
.align 0x8
.section ".data"
.global sceUserMainThreadPriority
sceUserMainThreadPriority:
	.quad	0
.global sceLibcHeapSize
sceLibcHeapSize:
	.quad	0xffffffffffffffff
.global sceLibcHeapExtendedAlloc
sceLibcHeapExtendedAlloc:
	.quad	1
.global sceUserMainThreadStackSize
sceUserMainThreadStackSize:
	.quad	0xffffffffffffffff
.global __dso_handle
__dso_handle:
	.quad 	0
.global _sceLibc
_sceLibc:
	.quad	0
