; includes all character definitions for the 7 segment display
#include "display.S"
; includes all morse code definitions
#include "morse_def.S"

    .global get_morse_code

get_morse_code:
	cpi r29, 0x0 ;check if there are no letters being inputted
	breq waiting ;go to standby mode

;;; checks to see if the morse is 1,2,3 or 4 bits long
    cpi r29, 0x1 
    breq bit

    cpi r29, 0x2 
    breq two_bit

    cpi r29, 0x3 
    breq three_bit

    cpi r29, 0x4 
    breq four_bit

	rjmp error ;if mpre than 4 bits, give error

waiting:
	rjmp final ;rjmp to final

bit:
	ldi r30, chr_e	
	cpi r28, M_E	; compare the morse code value in r28 with the morse code value of E
	breq buff1

	ldi r30, chr_t
	cpi r28, M_T	; compare the morse code value in r28 with the morse code value of T
	breq buff1			

	rjmp error  ; if the signal is not identifiable as a letter
                ; throw an error

buff1:
	rjmp final ; The buffer is needed as the branch (+- 64 ) instruction cannot jump as far as a rjmp (+- 2k words) / jmp (anywhere within the program memory)

two_bit:
	ldi r30, chr_i
	cpi r28, M_I	; compare the morse code value in r28 with the morse code value of I
	breq buff2

	ldi r30, chr_a
	cpi r28, M_A	; compare the morse code value in r28 with the morse code value of A
	breq buff2

    ldi r30, chr_n	
	cpi r28, M_N	; compare the morse code value in r28 with the morse code value of N
	breq buff2

	ldi r30, chr_m
	cpi r28, M_M	; compare the morse code value in r28 with the morse code value of M 
	breq buff2

	rjmp error  ; if the signal is not identifiable as a letter
                ; throw an error

buff2:
	rjmp final ; The buffer is needed as the branch (+- 64 ) instruction cannot jump as far as a rjmp (+- 2k words) / jmp (anywhere within the program memory)

three_bit:
	ldi r30, chr_d 
	cpi r28, M_D	; compare the morse code value in r28 with the morse code value of D
	breq buff3

	ldi r30, chr_g
	cpi r28, M_G	; compare the morse code value in r28 with the morse code value of G 
	breq buff3

    ldi r30, chr_k	
	cpi r28, M_K	; compare the morse code value in r28 with the morse code value of K
	breq buff3

	ldi r30, chr_o 
	cpi r28, M_O	; compare the morse code value in r28 with the morse code value of O
	breq buff3	

	ldi r30, chr_r
	cpi r28, M_R	; compare the morse code value in r28 with the morse code value of R
	breq buff3

	ldi r30, chr_s
	cpi r28, M_S	; compare the morse code value in r28 with the morse code value of S 
	breq buff3

    ldi r30, chr_u 
	cpi r28, M_U	; compare the morse code value in r28 with the morse code value of U
	breq buff3

	ldi r30, chr_w
	cpi r28, M_W	; compare the morse code value in r28 with the morse code value of W 
	breq buff3

	rjmp error  ; if the signal is not identifiable as a letter
                ; throw an error	

buff3:				
	rjmp final ; The buffer is needed as the branch (+- 64 ) instruction cannot jump as far as a rjmp (+- 2k words) / jmp (anywhere within the program memory)

four_bit:
	ldi r30, chr_b
	cpi r28, M_B	; compare the morse code value in r28 with the morse code value of B
	breq final

	ldi r30, chr_c
	cpi r28, M_C	; compare the morse code value in r28 with the morse code value of C 
	breq final			

    ldi r30, chr_f
	cpi r28, M_F	; compare the morse code value in r28 with the morse code value of F
	breq final

	ldi r30, chr_h
	cpi r28, M_H	; compare the morse code value in r28 with the morse code value of H 
	breq final	

    ldi r30, chr_j
	cpi r28, M_J	; compare the morse code value in r28 with the morse code value of J
	breq final

	ldi r30, chr_l
	cpi r28, M_L	; compare the morse code value in r28 with the morse code value of L 
	breq final	

    ldi r30, chr_p	
	cpi r28, M_P	; compare the morse code value in r28 with the morse code value of P
	breq final

	ldi r30, chr_q
	cpi r28, M_Q	; compare the morse code value in r28 with the morse code value of Q
	breq final	

    ldi r30, chr_v 
	cpi r28, M_V	; compare the morse code value in r28 with the morse code value of V
	breq final

	ldi r30, chr_x
	cpi r28, M_X	; compare the morse code value in r28 with the morse code value of X 
	breq final	

    ldi r30, chr_y	
	cpi r28, M_Y	; compare the morse code value in r28 with the morse code value of Y
	breq final

	ldi r30, chr_z
	cpi r28, M_Z	; compare the morse code value in r28 with the morse code value of Z
	breq final	

	rjmp error  ; if the signal is not identifiable as a letter
                ; throw an error	

final:
    clr r29 ; clear the morse code length 
    clr r28 ; clear the morse code signal
    ret     ; return to where we relative called get_morse_code
    
error:
	ldi r30, chr_error ; output the ERROR character
	rjmp final
