% MATH2089: File = luex2.m
% LU factorization - Example 2 (Row swap needed)

format compact

% Define the matrix A
A = [1 2 3; -1 -2 2;  2 3 5]

n = size(A,1);

% Use row operations to get to upper triangular (row-echelon form) U

% Work with U so A is preserved
U = A;

% Initialize unit lower triangular matrix L to identity
L = eye(n);

% Row operations using A(1,1) as pivot element
j = 1;
% Make the (2,j) element zero
i = 2;
L(i,j) = A(i,j)/A(j,j);
U(i,:) = U(i,:) - L(i,j)*U(j,:)
% Make the (3,j) element zero
i = 3;
L(i,j) = A(i,j)/A(j,j);
U(i,:) = U(i,:) - L(i,j)*U(j,:)

% As U(2,2) = 0 cannot use it as pivot
% Needs to exchange Rows 2 and 3
% Permutation matrix
P = eye(n);
perm = [1; 3; 2];
P = P(perm,:)

U = P*U

% Also exchange non-diagonal elements of L 
tmp = L(2,1);
L(2,1) = L(3,1);
L(3,1) = tmp;

% Display L
L

% Check PA = L*U
Chk = P*A - L*U

% Compare with MATLAB's LU factorization
[LM, UM, PM] = lu(A)

% Check P*A - L*U
ChkM = PM*A - LM*UM
