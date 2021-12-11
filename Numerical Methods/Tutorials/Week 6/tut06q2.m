% MATH2089: File = tut06q2.m
format compact

A = [1  1  3  0; 1  3  0  0; -2  0  0  1; 3  0  0  2];
b = [0; 5; -6; 2];
 
[L1, U1, p1] = lu(A, 'vector')
chk = norm(A-L1*U1, 1)
x1 = U1 \ (L1 \ b(p1)); x1T = x1'
 
pc = colamd(A)
B = A(:,pc);
[L2, U2, p2] = lu(B, 'vector')
x2 = U2 \ (L2 \ b(p2)); x2T = x2'
