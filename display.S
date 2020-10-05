
#include <avr/io.h> 				

	;;lists all the outpit bits from port d to the corresping section of the display board
	;; to make it easier for us to read
	
	top = 7					
	top_right = 1 		
	bot_right = 2		
	bot = 3	        	
	bot_left= 4		
	top_left = 5		
	center = 6		

	;; bit mask to turn the whole display board on
	all = _BV(top) | _BV(top_right) | _BV(bot_right) | _BV(bot) | _BV(bot_left) | _BV(top_left) | _BV(center) 

	;; The following lists the bit mask for each character in the english alphabet
	;; The display board uses inverse logic, meaning that a 0 turns a section on and
	;; a 1 turns the section off. To overcome this we use (~) to invert the bit masks
	
	chr_a = ~(_BV(top) | _BV(top_right) | _BV(bot_right) | _BV(center) | _BV(bot_left) | _BV(top_left))
	chr_b = ~(_BV(top_left) | _BV(center) | _BV(bot_left) | _BV(bot_right) | _BV(bot))
	chr_c = ~(_BV(top) | _BV(top_left) | _BV(bot_left) | _BV(bot))
	chr_d = ~(_BV(top_right) | _BV(center) | _BV(bot_left) | _BV(bot_right) | _BV(bot))
	chr_e = ~(_BV(top) | _BV(top_left) | _BV(bot_left) | _BV(bot) | _BV(center))
	chr_f = ~(_BV(top) | _BV(top_left) | _BV(bot_left) | _BV(center))
	chr_g = ~(_BV(top) | _BV(top_right) | _BV(bot_right) | _BV(bot) | _BV(top_left) | _BV(center))
	chr_h = ~(_BV(bot_left) | _BV(top_right) | _BV(bot_right) | _BV(top_left) | _BV( center))
	chr_i = ~(_BV(top_right) | _BV(bot_right))
	chr_j = ~(_BV(top_right) | _BV(bot_right) | _BV(bot) |  _BV(bot_left))
	chr_k = ~(_BV(top_left) | _BV(center)| _BV(bot_left))
	chr_l = ~(_BV(top_left) | _BV(bot_left) | _BV(bot))
	chr_m = ~(_BV(top) | _BV(bot_left) | _BV(bot_right))
	chr_n = ~(_BV(bot_left) | _BV(center)| _BV(bot_right))
	chr_o = ~(_BV(top) | _BV(top_right) | _BV(bot_right) | _BV(bot) | _BV(bot_left) | _BV(top_left))
	chr_p = ~(_BV(top) | _BV(top_right) | _BV(center)| _BV(bot_left) | _BV(top_left))
	chr_q = ~(_BV(top) | _BV(top_right) | _BV(center)| _BV(bot_right) | _BV(top_left))
	chr_r = ~(_BV(bot_left) | _BV(center))
	chr_s = ~(_BV(top) | _BV(top_left) | _BV(center)| _BV(bot_right) | _BV(bot))
	chr_t = ~(_BV(top_right) | _BV(center)| _BV(bot_right))
	chr_u = ~(_BV(bot_right) | _BV(bot) | _BV(bot_left))
	chr_v = ~(_BV(bot_left) | _BV(bot) | _BV(bot_right) | _BV(top_right) | _BV(top_left))
	chr_w = ~(_BV(top_left) | _BV(bot) | _BV(top_right))
	chr_x = ~(_BV(top_right) | _BV(bot_right) | _BV(top_left) | _BV(bot_left))
	chr_y = ~(_BV(top_left) | _BV(top_right) | _BV(center)| _BV(bot_right) | _BV(bot))
	chr_z = ~(_BV(top) | _BV(top_right) | _BV(center)| _BV(bot_left) | _BV(bot))
	chr_error = ~(_BV(center))


