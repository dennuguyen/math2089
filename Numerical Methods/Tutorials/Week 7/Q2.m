% Question 2

% PART B
clear

% PART C
load west0156.dat
whos

% PART D
I = west0156(:,1);
J = west0156(:,2);
V = west0156(:,3);

% PART E
A = sparse(I, J, V);

% PART F
whos
size(A)
issparse(A)

% PART G
Aij = A(146:156, 1:5)

% PART H
A_symmetry_check = norm(A - A', Inf)

% PART I
figure(1);
spy(A);
title('Spy Plot of Non-Zero Elements in ''west0156'' Matrix');

% PART J
Annz = nnz(A)
A_sparsity = Annz/prod(size(A))*100

% PART K

B = A'*A;

% PART I
B_symmetry_check = norm(B - B', Inf)

% PART II
figure(2);
spy(B);
title('Spy Plot of Non-Zero Elements in B = A^T * A');

% PART III
B_sparsity = nnz(B)/prod(size(B))*100

% PART IV
p = symrcm(B);
figure(3);
spy(B(p,p));
title('Spy Plot of B(p,p) for p = symrcrm');

% PART V
% B(p,p) gives reordered matrix B with symmetry

% PART VI
[R, k] = chol(B);
k
% non-zero k indicates B is not positive definite so cannot use Cholesky
% Factorisation

% PART VII
eigval = min(eig(B))
% k is the 