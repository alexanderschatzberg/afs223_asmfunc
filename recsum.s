.global sum

sum: 
    # Base case: if (n == 0), return 0
    beq a0, zero, base_case

    # EPILOGUE 
    # Save return address and previous a0 (n) on the stack
    addi sp, sp, -8         # Allocate space for two words on the stack
    sw ra, 4(sp)            # Save return address
    sw a0, 0(sp)            # Save n

    #BODY
    # Recursive case: n + sum(n - 1)
    addi a0, a0, -1         # n = n - 1
    jal ra, sum            # Call sum(n - 1)

    # Restore n from stack and add it to the result
    lw t0, 0(sp)            # Load previous n into t0
    add a0, a0, t0          # a0 = a0 + t0 (result = n + sum(n - 1))

    #PROLOGUE 
    # Restore return address and stack pointer
    lw ra, 4(sp)            # Restore return address
    addi sp, sp, 8          # Deallocate stack space

    ret

base_case: 
    li a0, 0
    ret
