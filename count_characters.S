
    .global short_press
short_press:
    inc r29   ; Increment character counter
    rjmp final      ;return back to where we relative called released

    .global long_press
long_press:
	
    inc r29 			; Increment r29 (chr counter)
    cpi r29, 0x01 		;if counter is 1
    breq l1 			;jump l1

    cpi r29, 0x02 		;if counter is 2
    breq l2 			;jump l2

    cpi r29, 0x03 		;if counter is 3
    breq l3 			;jump l3

    cpi r29, 0x04 		;if counter is 4
    breq l4 			;jump l4

    rjmp final


;;; The morse code being input is stored in r28
	
l1:
    ori r28, 0x01 
    rjmp final

l2:
    ori r28, 0x02 
    rjmp final

l3:
    ori r28, 0x04 
    rjmp final
    
l4:
    ori r28, 0x08 
    rjmp final

final:
    pop r16
    clr r19
    ret
