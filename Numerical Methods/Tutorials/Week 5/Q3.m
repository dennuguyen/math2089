% Exercise 3

% PART A
A = [0 3 -2; -1 -4 2; 5 14 26];
B = [-11/8 -53/48 -1/48; 3/8 5/48 1/48; 1/16 5/32 1/32];

I = A*B

% better practice
norm(A*B - eye(3), 1)

% norm ~= 0 iff A*B - identity matrix ~= zero matrix

% PART B
% k(A)_p = ||A||_p * ||A^-1||_p

% 1-norm condition number = norm(A, 1) * norm(B, 1)
cond1 = cond(A, 1)

% PART C
% infinite-norm condition number = norm(A, inf) * norm(B, inf)
condInf = cond(A, inf)

% PART D
eigenvalue_A = eig(A)
eigenvalue_A_inverse = eig(inv(A))
% eig(inv(A)) = 1./eig(A)

eigenvalue_ratio = abs(max(eig(A)))/abs(min(eig(A)))

cond2 = cond(A, 2)

% PART E
a = rref(A)

% PART F
[L, U] = lu(A)
P = A\L*U

E = P*A - L*U
norm(E)