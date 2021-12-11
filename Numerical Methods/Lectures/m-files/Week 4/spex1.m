% MATH2089: File = spex1.m
% Creating and displaying sparse matrices

clear 
format compact

% Choose matrix size
n = 20;

% Coumn vector of n elements all equal to one
e = ones(n,1);

% Create tridaigonal matrix using diag command
A = diag(-e(1:n-1), -1) + diag(2*e, 0) + diag(-e(1:n-1),1);

% A is also a Toeplitz matrx (constant along diagonals)
% A = toeplitz([2 -1 ones(1,n-2)]);

% Create as a sparse matrix
Asp = spdiags([-e 2*e -e], [-1 0 1], n, n);

% Check Asp is the same matrix as A
Achk = norm(A-Asp, 1)

% Plot non-zero elements of A
figure(1)
spy(A)
title('Non-zero elements in A')

% Calculate sparsity of A as a percentage
sparsity = 100*nnz(A)/numel(A)

% Display storage used
whos

% Display elements in rosw 1 to 4, columns 1 to 4
Asp(1:4,1:4)

% Check A is symmetric
Asym = norm(Asp-Asp',1)

% Calculate and plot eigenvalues of A
% Try changing A to Asp
ev = eig(A);
evs = sort(ev);
evmin = min(ev)
evmax = max(ev)
Acond = evmax / evmin
cond(A, 2)

figure(2)
plot(ev, '*')
grid on
title('Eigenvalues of A')

% Plot non-zero entries in the inverse
figure(3)
AI = inv(A);
spy(AI)
title('Non-zero elements in A^{-1}')

% Plot non-zero elements in the Cholesky factor
figure(4)
[R, k] = chol(A);
k
spy(R)
title('Non-zero elements in Cholesky factor R')
