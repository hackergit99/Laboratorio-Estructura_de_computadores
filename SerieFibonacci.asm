.data
prompt: .asciiz "Ingrese un n�mero para generar la serie Fibonacci: "
result_msg: .asciiz "La serie Fibonacci hasta el n�mero ingresado es:\n"
newline: .asciiz "\n"

.text
main:
    # Mostrar un mensaje para ingresar el n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el n�mero ingresado en $t0

    # Inicializar variables para la serie Fibonacci
    li $t1, 0  # Primer t�rmino de la serie
    li $t2, 1  # Segundo t�rmino de la serie
    li $t3, 0  # Contador para la serie

    # Mostrar mensaje de la serie Fibonacci
    li $v0, 4
    la $a0, result_msg
    syscall

    # Calcular e imprimir la serie Fibonacci
    loop:
        # Imprimir el t�rmino actual de la serie
        li $v0, 1
        move $a0, $t1
        syscall

        # Imprimir un espacio para separar los t�rminos
        li $v0, 4
        la $a0, newline
        syscall

        # Calcular el siguiente t�rmino de la serie
        add $t4, $t1, $t2  # $t4 = $t1 + $t2 (siguiente t�rmino)
        move $t1, $t2      # Actualizar $t1 con el valor de $t2
        move $t2, $t4      # Actualizar $t2 con el valor calculado

        # Incrementar el contador y comparar con el n�mero ingresado
        addi $t3, $t3, 1
        blt $t3, $t0, loop  # Saltar a 'loop' si el contador es menor que el n�mero ingresado

    # Finalizar el programa
    li $v0, 10
    syscall
