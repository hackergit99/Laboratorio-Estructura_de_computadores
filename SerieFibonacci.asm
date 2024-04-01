.data
prompt: .asciiz "Ingrese un número para generar la serie Fibonacci: "
result_msg: .asciiz "La serie Fibonacci hasta el número ingresado es:\n"
newline: .asciiz "\n"

.text
main:
    # Mostrar un mensaje para ingresar el número
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el número ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el número ingresado en $t0

    # Inicializar variables para la serie Fibonacci
    li $t1, 0  # Primer término de la serie
    li $t2, 1  # Segundo término de la serie
    li $t3, 0  # Contador para la serie

    # Mostrar mensaje de la serie Fibonacci
    li $v0, 4
    la $a0, result_msg
    syscall

    # Calcular e imprimir la serie Fibonacci
    loop:
        # Imprimir el término actual de la serie
        li $v0, 1
        move $a0, $t1
        syscall

        # Imprimir un espacio para separar los términos
        li $v0, 4
        la $a0, newline
        syscall

        # Calcular el siguiente término de la serie
        add $t4, $t1, $t2  # $t4 = $t1 + $t2 (siguiente término)
        move $t1, $t2      # Actualizar $t1 con el valor de $t2
        move $t2, $t4      # Actualizar $t2 con el valor calculado

        # Incrementar el contador y comparar con el número ingresado
        addi $t3, $t3, 1
        blt $t3, $t0, loop  # Saltar a 'loop' si el contador es menor que el número ingresado

    # Finalizar el programa
    li $v0, 10
    syscall
