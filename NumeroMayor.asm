.data
num1: .word 5
num2: .word 15
num3: .word 20
result: .word 0
msg: .asciiz "El número mayor es: "

.text
main:
    # Cargar los tres valores
    lw $t0, num1       # Cargar el valor de num1 en $t0
    lw $t1, num2       # Cargar el valor de num2 en $t1
    lw $t2, num3       # Cargar el valor de num3 en $t2

    # Comparar los valores ingresados para encontrar el mayor
    ble $t0, $t1, skip_t0_t1
    ble $t0, $t2, skip_t0_t2
    move $t3, $t0      # Si num1 es mayor que num2 y num3, $t3 = num1
    j end

skip_t0_t2:
    move $t3, $t2      # Si num1 es menor que num3, $t3 = num3
    j end

skip_t0_t1:
    ble $t1, $t2, skip_t1_t2
    move $t3, $t1      # Si num2 es mayor que num1 y num3, $t3 = num2
    j end

skip_t1_t2:
    move $t3, $t2      # Si num2 es menor que num3, $t3 = num3

end:
    # Guardar el número mayor de los tres valores ingresados en result
    sw $t3, result     # Guarda el valor de $t3 (mayor) en result

    # Mostrar mensaje y el número mayor
    li $v0, 4          # Código de servicio 4 para imprimir cadena
    la $a0, msg        # Cargar la dirección de la cadena en $a0
    syscall            # Llamar al sistema para imprimir la cadena

    # Mostrar el número mayor
    li $v0, 1          # Código de servicio 1 para imprimir entero
    lw $a0, result     # Cargar el valor de result en $a0 para imprimirlo
    syscall            # Llamar al sistema para imprimir el número

    # Finalizar el programa
    li $v0, 10         # Terminar la ejecución
    syscall            # Llamar al sistema

