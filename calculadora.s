@Calculadora Julian Henao Marin

.data
.balign 4
intro:		.asciz "Aplicacion: Calculadora\n"
.balign 4
menu:		.asciz "Para usar la calculadora digite:\n1 para Suma\n2 para Resta\n3 para Multiplicacion\n4 para Division \n5 para finalizar\nSeleccione la operacion a calcular:"
.balign 4
mensaje1:	.asciz "Ingrese el primer numero: "
.balign 4
mensaje2:	.asciz "Ingrese el segundo numero: "
.balign 4
mensaje3:	.asciz "%d multiplicado por %d es igual a %d\n"
.balign 4
mensaje4:	.asciz "%d dividido por %d es igual a %d y su residuo es %d \n"
.balign 4
mensaje5:	.asciz "%d sumado con %d es igual a %d\n"
.balign 4
mensaje6:	.asciz "%d restado con %d es igual a %d\n"
.balign 4
patron:		.asciz "%d"
.balign 4
patron2:	.asciz "%d"
.balign 4
num_leido:	.word 0
.balign 4
opcion:		.word 0
.balign 4
num_leido2:	.word 0
.balign 4
opSuma:		.word 1
.balign 4
opResta:	.word 2
.balign 4
opMult:		.word 3
.balign 4
opDiv:		.word 4
.balign 4
opSalida:	.word 5


zero:      	.word 0
increment: 	.word 1
result: 	.space 4
residue: 	.space 4
suma: 		.space 4
resta: 		.space 4
.text
sum:
	ldr 	r0,=mensaje1
	bl	printf
	ldr	r0,=patron
	ldr	r1,=num_leido
	bl	scanf
	ldr 	r0,=mensaje2
	bl	printf
	ldr	r0,=patron2
	ldr	r1,=num_leido2
	bl	scanf
	ldr	r0,=num_leido
	ldr	r0,[r0]
	ldr	r1,=num_leido2
	ldr	r1,[r1]
 	ldr 	r2, =suma 
 	add 	r3, r0, r1
 	str 	r3, [r2]
	ldr	r1,=num_leido
	ldr	r1,[r1]
	ldr	r2,=num_leido2
	ldr	r2,[r2]
	mov 	r3,r3
	ldr	r0,=mensaje5
	bl	printf
	bl	calculadora
rest:
	ldr 	r0,=mensaje1
	bl	printf
	ldr	r0,=patron
	ldr	r1,=num_leido
	bl	scanf
	ldr 	r0,=mensaje2
	bl	printf
	ldr	r0,=patron2
	ldr	r1,=num_leido2
	bl	scanf
	ldr	r0,=num_leido
	ldr	r0,[r0]
	ldr	r1,=num_leido2
	ldr	r1,[r1]
 	ldr 	r2, =resta 
 	sub 	r3, r0, r1
 	str 	r3, [r2]
	ldr	r1,=num_leido
	ldr	r1,[r1]
	ldr	r2,=num_leido2
	ldr	r2,[r2]
	mov 	r3,r3
	ldr	r0,=mensaje6
	bl	printf
	bl	calculadora
mult:
 	ldr 	r0,=mensaje1
	bl	printf
	ldr	r0,=patron
	ldr	r1,=num_leido
	bl	scanf
	ldr 	r0,=mensaje2
	bl	printf
	ldr	r0,=patron2
	ldr	r1,=num_leido2
	bl	scanf
	ldr	r0,=num_leido
	ldr	r0,[r0]
	ldr	r1,=num_leido2
	ldr	r1,[r1]
	ldr 	r2, =zero
 	ldr 	r2, [r2]
 	ldr 	r3, =zero
 	ldr 	r3, [r3]
 	ldr 	r4, =increment
 	ldr 	r4, [r4]
 loop:
 	cmp 	r1, r2
 	ble	endLoop
 	add 	r3, r3, r0
 	add 	r2, r2, r4
 	b 	loop
 endLoop: 
	ldr	r1,=num_leido
	ldr	r1,[r1]
	ldr	r2,=num_leido2
	ldr	r2,[r2]
	mov 	r3,r3
	ldr	r0,=mensaje3
	bl	printf
	bl	calculadora
div:
 	ldr 	r0,=mensaje1
	bl	printf
	ldr	r0,=patron
	ldr	r1,=num_leido
	bl	scanf
	ldr 	r0,=mensaje2
	bl	printf
	ldr	r0,=patron2
	ldr	r1,=num_leido2
	bl	scanf
	ldr	r0,=num_leido
	ldr	r0,[r0]
	ldr	r1,=num_leido2
	ldr	r1,[r1]
 	ldr 	r2, =result
 	ldr 	r3, =residue
 	ldr 	r4, =zero
 	ldr	 r4, [r4]
 	ldr 	r5, =increment
 	ldr 	r5, [r5]
 	mov 	r6, r4
 loopDiv:
 	cmp 	r0, r1
 	blt 	endLoopDiv
 	sub 	r0, r0, r1
 	add 	r6, r6, r5
 	b 	loopDiv
 endLoopDiv:
	str 	r0, [r3]
 	str 	r6, [r2]

	
	ldr	r1,=num_leido
	ldr	r1,[r1]
	ldr	r2,=num_leido2
	ldr	r2,[r2]
	ldr	r3,=result
	ldr	r3,[r3]
	ldr	r7,=residue
	ldr	r7,[r7]
	ldr	r0,=mensaje4
	bl	printf
	bl	calculadora
.global main
calculadora: 
	ldr 	r0,=menu
	bl	printf
	ldr	r0,=patron
	ldr	r1,=opcion
	bl	scanf
	ldr 	r0, =opcion
	ldr	r0, [r0] 	
	ldr 	r1, =opSuma
	ldr	r1, [r1]
	ldr 	r2, =opResta
	ldr	r2, [r2]
	ldr 	r3, =opMult
	ldr	r3, [r3]
	ldr 	r4, =opDiv
	ldr	r4, [r4]
	ldr 	r5, =opSalida
	ldr	r5, [r5]
	@Condicional
	cmp 	r0,r1
	beq	sum
	cmp	r0,r2
	beq 	rest
	cmp 	r0,r3
	beq 	mult
	cmp 	r0,r4
	beq 	div
	cmp 	r0,r5
	beq 	salida


main:	
	ldr 	r0,=intro
	bl	printf	
	bl 	calculadora


salida: 
	mov 	r0,r2
	mov	r7,$1
	swi	$0
.global printf
.global scanf