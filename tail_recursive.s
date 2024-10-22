.global tail_r_fibonacci

tail_r_fibonacci: 
    # Consider the base cases 
    beq a0, x0, base_0
    addi t0, x0, 1
    beq a0, t0, base_1

    # Allocate space for two words 
    addi sp, sp, -8 #Allocate 4 words on the stack 
    sw ra, 4(sp) # Save ret address

    #Recursive cases 

    addi a0, a0, -1
    mv t0, a2
    add a2, a1, a2
    mv a1, t0
    jal ra, tail_r_fibonacci

    #Restore sp and return address 
    lw ra, 4(sp)
    addi sp, sp, 8
    ret

base_1:
    mv a0, a2
    ret

base_0: 
    mv a0, a1
    ret 
