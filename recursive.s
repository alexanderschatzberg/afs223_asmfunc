.global r_fibonacci

r_fibonacci: 
    # Consider the base cases 
    beq a0, x0, base_0
    addi t0, x0, 1
    beq a0, t0, base_1

    # Allocate space for two words 
    addi sp, sp, -16 #Allocate 4 words on the stack 
    sw ra, 12(sp) # Save ret address
    sw a0, 8(sp) # Save n 

    #Recursive cases 

    # Compute n-2
    addi a0, a0, -2
    jal ra, r_fibonacci
    sw a0, 0(sp)

    #compute n - 1
    lw a0, 8(sp)
    addi a0, a0, -1
    jal ra, r_fibonacci

    #Sum (n-1) and (n-2)
    lw t1, 0(sp)
    add a0, a0, t1


    #Restore sp and return address 
    lw ra, 12(sp)
    addi sp, sp, 16
    ret


base_1:
    addi a0, x0, 1
    ret

base_0: 
    addi a0, x0, 0
    ret 
    