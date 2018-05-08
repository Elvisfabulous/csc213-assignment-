.data
msg:.asciiz "Input value of A\n"
msg1:.asciiz "Input value of B\n"
msg2:.asciiz "Input value of C\n"
msg3:.asciiz "Complex roots"
msg4:.float 4.0
msg5:.float 2.0
msg6:.asciiz "Your first root is :"
msg7:.asciiz "\nYour second root is :"
.text
main:
li $v0,4
la $a0,msg
syscall

li $v0,6 
syscall
mov.s $f1, $f0 #f1 stores a

li $v0,4
la $a0,msg1
syscall

li $v0, 6
syscall
mov.s $f2,$f0 #f2 stores b

la $a0,msg2
li $v0, 4
syscall

li $v0,6
syscall
mov.s $f3,$f0 #f3 stores c
l.s $f4, msg4 #f4 store 4

#solving for d
mul.s $f5,$f2,$f2 #this multiplies b*b
mul.s $f4,$f4,$f1 #this stores 4*a  
mul.s $f4,$f4,$f3 #this store 4*a*c
sub.s $f7,$f5,$f4 #this solves b*b-4ac
mfc1 $t1,$f7

li $t0,0
ble $t1,$t0,complex
neg.s $f8,$f2 #f8 stores -b
sqrt.s $f9, $f7 #f9 stores sqrt of d 
l.s $f10,msg5
mul.s $f11, $f10,$f1 #f11 stores 2*a
add.s $f15, $f8,$f9
div.s $f20, $f15,$f11 #this solves -b+sqrt d/2a

li $v0,4
la $a0,msg6
syscall

li $v0,2
mov.s $f12,$f20
syscall

li $v0,4
la $a0,msg7
syscall

sub.s $f16, $f8, $f9
div.s $f16, $f16,$f11
mov.s $f21, $f16

li $v0,2
mov.s $f12,$f21
syscall

b exit

complex:
la $a0,msg3
li $v0, 4
syscall

exit:
li $v0,10
syscall
