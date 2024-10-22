.global opt_tail_fibonacci

opt_tail_fibonacci: 
    # Consider the base cases
    beq a0, x0, base_0 # if n == 0, go to base_0
    addi t0, x0, 1
    beq a0, t0, base_1 # if n == 1, go to base_1

fib_loop:
    beq a0, t0, end_loop # If n == 1, end the loop
    add a3, a1, a2 # a3 = a + b (next Fibonacci number)
    mv a1, a2 # Move b into a (previous b becomes new a)
    mv a2, a3 # Move the new sum into b (new b)
    addi a0, a0, -1 # Decrement n
    j fib_loop # Repeat the loop

end_loop:
    mv a0, a2 # Return the result (stored in b)

    ret

base_1:
    mv a0, a2
    ret

base_0:
    mv a0, a1 
    ret