.global m_fibonacci

m_fibonacci: 
    # Consider the base cases
    beq a0, x0, base_0 # if n == 0, go to base_0
    addi t0, x0, 1
    beq a0, t0, base_1 # if n == 1, go to base_1

    # Perform lookup in memo_table
    bge a0, a2, no_lookup 
    slli t1, a0, 3 
    add t1, t1, a1 
    ld t2, 0(t1) 
    bnez t2, memo_hit 

no_lookup:
    # Allocate space for saving registers
    addi sp, sp, -16 
    sw ra, 12(sp) 
    sw a0, 8(sp) 

    # Recursive cases: compute m_fibonacci(n - 2)
    addi a0, a0, -2 
    jal ra, m_fibonacci 
    sw a0, 0(sp) 

    # Compute m_fibonacci(n - 1)
    lw a0, 8(sp) 
    addi a0, a0, -1 
    jal ra, m_fibonacci 

    # Sum (n-1) and (n-2)
    lw t1, 0(sp) 
    add a0, a0, t1 

    # Update memo_table if n < size
    lw t0, 8(sp) 
    bge t0, a2, skip_update 
    slli t1, t0, 3 
    add t1, t1, a1 
    sd a0, 0(t1) 

skip_update:
    # Restore sp and return address 
    lw ra, 12(sp) # Restore return address
    addi sp, sp, 16 # Deallocate stack space

    ret

memo_hit:
    mv a0, t2
    ret

base_1:
    addi a0, x0, 1 
    ret

base_0: 
    addi a0, x0, 0
    ret 