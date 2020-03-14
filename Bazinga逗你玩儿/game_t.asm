 .model	small
.386
data	segment
	ad59	equ	20h
	ad55	equ	210h
	ad53	equ	220h		;оƬѡַ
	ad09	equ	200h
	adled	equ	230h
	scale	equ	04h
	level	db	0
	N2		equ	1000		;������ʱ��N1*N2
	temp	dw	?
	count	db	?			;���ڱ���ADC���
	ledcode	db	3fh,	06h,	5bh,	4fh,	66h,	6dh,	7dh,	07h,	7fh,	67h,	77h,	7ch,	39h,	5eh,	79h,	71h

data	ends
ss_seg	segment
	dw	100	dup(?)
ss_seg	ends
;�ж��д�
code	segment
	assume	cs:code,	ds:data,	ss:ss_seg
	main	proc	far
	mov	ax,	data
	mov	ds,	ax
	cli						;���ж�
	;оƬ��ʼ��
	call	INIT8255
	call	INIT8253
	call	INTVECT
	sti
	;test
						;���ж�
	LOOP3:
	jmp	LOOP3			;��̬ͣ��
	
	mov	ax,	4c00h
	int	21h
	main	endp

INIT8255	proc
	mov	al,	90h;CW��A�����룬BC���������ʽ0.
	mov	dx,	ad55+3
	out	dx,	al
	ret
INIT8255	endp

INIT8253	proc
	mov	al,	16h
	mov	dx,	ad53+3
	out	dx,	al		;CNT0,������BCD�������ֻ�����ֽ�
	ret
INIT8253	endp

INTVECT	proc
	;������Ƭ�ж�������
	in	al,	ad59+1		;8259��ַ
	and	al,	11011111b		;��IR5��Ч
	out	ad59+1,	al
	;�����ж�������
	push	ds
	mov	ax,	0			;����ֱ�Ӷ�reg��ֵ
	mov	ds,	ax
	lea	ax,	cs:	INT1		;��ȡ�жϷ�������ַ
	mov	si,	35H			;�ж�������
	mov	cl,	2
	shl	si,	cl			;��ڵ�ַ�����ַ
	mov	ds:[si],	ax		;��ڵ�ַ�������ӳ����ַ
	push	cs				;cs������Դ������������Ҫ�ö�ջ
	pop	ax
	mov	ds:[si+2],	ax		;�ж��������csֵ
	pop	ds				;�ָ�ds
	ret
INTVECT	endp

delay1s	proc				;��Ƶ�Ƕ����Ҫ
	mov	al,	count
	mov	ah,	scale
	mul	ah
	mov	cx,	ax
	LOOP1:
	mov	temp,	cx
	mov	cx,		N2
	LOOP2:
	nop
	nop
	loop	LOOP2
	mov	cx,	temp
	loop	LOOP1
	ret
delay1s	endp

sound	proc
	mov	dx,	ad55+1
	in	al,	dx
	or	al,	01h
	out	dx,	al	;PB0=1
	ret
sound	endp

change1	proc
	call	ADC_con
	mov	dx,	ad53
	mov	al,	count
	out	dx,	al
	ret
change1	endp

stop	proc
	mov	dx,	ad55+1
	in	al,	dx
	and	al,	0FEh
	out	dx,	al	;PB0=0
	ret
stop	endp

INT1	proc	far
	;�����ֳ�
	push	ax
	push	cx
	push	dx
	push	si
	push	bx
	call	change1		;�ɵ�λ����������
	call	level_pro
	call	disp
	call	delay1s
	
	mov	dx,	ad55
	in	al,	dx		;��PA����
	and	al,	01H
	cmp	al,	01h
	je	stop1				;Ϊ1��������
	call	sound	
	jmp	next
	stop1:
	call	stop		
	next:
	;EOI
	mov	al,	20h
	mov	dx,	ad59
	out	dx,	al	
	;�ָ��ֳ�
	pop	bx
	pop	si
	pop	dx
	pop	cx
	pop	ax
	iret
INT1	endp
ADC_con	proc				;ת���������count.��λ�����������1.2v-4v
	;����ADC
	mov	dx,	ad09
	out	dx,	al
	;EOC
	mov	dx,	ad09+2
	l1:
	;��״̬���ж�ת��������
	in	al,	dx
	test	al,	01h
	jz	L1
	;������
	mov	dx,	ad09+1
	in	al,	dx
	mov	count,	al
	;CPU�ȴ�
	nop
	nop
	ret
ADC_con	endp

level_pro	proc
	mov	ax,	0
	mov	al,	count
	mov	bl,	100
	div	bl
	mov	level,	al
	mov	al,	03h
	sub	al,	level
	mov	level,	al
	ret
level_pro	endp

disp	proc
	lea	si,	ledcode
	mov	bx,	si
	mov	ah,	0
	add	bx,	ax
	mov	al,	[bx]
	mov	dx,	adled
	out	dx,	al
	mov	al,	02h
	inc	dx
	nop	
	out	dx,	al
	nop
	nop	
	ret
disp	endp

code	ends
end	main
