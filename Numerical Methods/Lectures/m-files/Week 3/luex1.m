% MATH2089: File = luex1.m
% LU factorization - Example 1 (No row swaps)

format compact

% Define the matrix A
A = [1 2 3; -1 -3 2;  2 4 5]

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

% No iterations using A(2,2) as pivot required for this example
% As (3,2) elelemt is already zero

% Display L
L

% Check A = L*U
Chk = A - L*U