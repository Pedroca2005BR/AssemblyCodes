#$s0 ? r
#$s1 ? m
#$s2 ? n
#$s3 ? o
#$s4 ? p

addi $s1, $zero, 16
addi $s2, $zero, 6
addi $s3, $zero, 11
addi $s4, $zero, 15

#r = m + n
add $s0, $s1, $s2 #r = 16 + 6 = 22

#r = m – (n + o)
add $t0, $s2, $s3 #t0 = 6 + 11 = 17
sub $s0, $s1, $t0 #r = 16 - 17

#r = (m – n) – (o + p)
add $t0, $s3, $s4 #t0 = 11 + 15 = 26
sub $t1, $s1, $s2 #t1 = 16 - 6 = 10
sub $s0, $t1, $t0 #r = 10 - 26 = -16

#r = m – (n + 2)
addi $t0, $s2, 2 #t0 = 6 + 2 = 8
sub $s0, $s1, $t0 #r = 16 - 8 = 8

# r = [m – (2 – n)] – (o + p + 3)
add $t0, $s3, $s4 # t0 = 11 + 15 = 26
addi $t0, $t0, 3 # t0 = 26 + 3 = 29
addi $t1, $zero, 2 #t1 = 0 + 2 = 2
sub $t1, $t1, $s2 #t1 = 2 - 6 = -4
sub $t1, $s1, $t1 #t1 = 16 - (-4) = 16 + 4 = 20
sub $s0, $t1, $t0 #r = 20 - 29 = -9