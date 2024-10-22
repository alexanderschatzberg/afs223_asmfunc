.global addOne

addOne: 
    # Prologue 
    addi sp, sp, -8
    sd ra, 0(sp)

    # Body
    addi a0, a0, 1

    # Epilogue 
    ld ra, 0(sp)
    addi sp, sp, 8
    ret
    