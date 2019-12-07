/* r0 - int *array */
/* r1 - int len */
/* r2 - int i */
/* r3 - max number */
/* r12 - second value */

main:
    mov sp, #128
    sub sp, sp, #24
    mov r0, #1
    str r0, [sp]
    mov r0, #2
    str r0, [sp, #4]
    mov r0, #3
    str r0, [sp, #8]
    mov r0, #4
    str r0, [sp, #12]
    mov r0, #5
    str r0, [sp, #16]
    mov r0, sp
    mov r1, #5
    bl find_max_a

end:
    b end

find_max_a:
    mov r2, #0
    /* Store the value at r0 in r3 */
    ldr r3, [r0]
        
loop:
    /* Compare the len to the index */
    cmp r2, r1
    /* When they are equal, exit to the end of the program */
    beq endloop
    ldr r12, [r0]
    /* Compare the first value in the array to the maximum number r3 */
    cmp r12, r3
    blt r3_max
    mov r3, r12  
    /* Increment i */
    add r2, r2, #1
    /* Skip to next space in array */
    add r0, r0, #4
    b loop

r3_max:
    /* Increment i */
    add r2, r2, #1
    /* Skip to next space in array */
    add r0, r0, #4
    b loop

    
endloop:
    mov r0, r3
    bx lr