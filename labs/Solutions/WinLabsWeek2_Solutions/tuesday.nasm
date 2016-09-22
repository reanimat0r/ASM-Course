bits 32

global _copy_string, _get_cpu_string@4, _set_flags

section .text


_copy_string:
;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	This method takes 3 params:
;
;	Param 1: An empty buffer
;
;	Param 2: A NULL-terminated string
;
;	Given these two inputs, 
;	1.) Find the length of the string provided in
;	param 2
;	2.) Copy the string from param 2, to the empty buffer
;	provided in param 1.
;
;	void __cdecl copy_string(char* dest, char* src);
;
; BEGIN STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;
	push ebp
	mov ebp, esp
	push edi
	push esi
	mov edi, [ebp + 12]
	mov ecx, -1
	xor eax, eax
	repne scasb
	not ecx
	mov edi, [ebp + 12]
	mov esi, [ebp + 8]
	rep movsb
	pop esi
	pop edi
	pop ebp
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;
; END STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;

_get_cpu_string@4:
;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	This function takes 1 param:
;
;	Param 1: A zero'd character buffer, containing
;	13 elements.
;
;	The following steps must be performed:
;	1.) Call CPUID and get the vendor string
;	2.) Copy from ASCII bytes returned into the buffer
;	provided.
;	
;	void __stdcall get_cpu_string(char* buf);
;
;
; BEGIN STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;
	xor eax, eax
	mov ecx, [esp + 4]
	push edi
	mov edi, ecx
	cpuid
	push ecx
	mov eax, ebx
	stosd
	mov eax, edx
	stosd
	pop eax
	stosd
	pop edi
	ret 4
;;;;;;;;;;;;;;;;;;;;;;;;;;
; END STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;


