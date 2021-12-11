% MATH2089: File = tut07q2sol.m
% Sparse matrices based on Chemical plant model. Ref:
% http://math.nist.gov/MatrixMarket/data/Harwell-Boeing/chemwest/west0156.html

% Close all figure windows
close all
% Clear variables from workspace
clear 
% Remove extra whitespace (new lines)
format compact

% Load data file, after downloading from course web page
load west0156.dat

% Check there is a 156 by 3 array west0156
whos

% Sparse matrix storage: i, j, A(i,j) for non-zero values
% Row indices are stored in column 1, column indices in column 2
% and non-zero values are stored in column 3
I = west0156(:,1);
J = west0156(:,2);
V = west0156(:,3);

% Create sparse matrix
A = sparse(I, J, V);

% Check what has been created and that A is in sparse format
whos
size(A)
issparse(A)

% Spy plot of non-zero elements in A
figure(1)
spy(A)
title('Spy plot of non-zero elements in west0156 matrix')

% Find values of A(i,j) for i=146,...,156 and j = 1,..,5
% Note the use of vectors as indices to get a sub-matrix of A
% and that there are only a few non-zero values.
% Also the (p, q) element of Aij is the (146+p-1,q) element of A
Aij = A(146:156,1:5)

% Check if A is symmetric: || A - A^T || = 0  <==> A = A^T
Achksym = norm(A-A', inf)

% Number of non-zero elements and sparsity of A
Annz = nnz(A)
Asp = 100*nnz(A)/prod(size(A))

% Calculate B = A^T A
B = A'*A;

% Check symmetry of B
Bchksym = norm(B-B', inf)

% Spy plot of non-zero elements in matrix B
figure(2)
spy(B)
title('Spy plot of non-zero elements in B = A^T A')

% Number of non-zero elements and sparsity of B
% Note that B has a higher percentage of non-zeros than
% the original matrix A, an example of fill-in
Bnnz = nnz(B)
Bsp = 100*nnz(B)/prod(size(B))

% Calculate the Symmetric Reverse Cuthill-McKee reordering of B
% B(p,p) applies the same reordering to the rows and columns of B
% to preserve the symmetry of B. The aim is to reduce the fill-in
% when factoring the matrix, eg for LU or Cholesky factorization
p = symrcm(B);
figure(3)
spy(B(p,p));
title('Spy plot of B(p,p) for p = symrcm(B)')

% Try to calculate Cholesky factorization of B
% A non-zero value of k indicates B is not positive definite
% Cholesky factorization does not exist as B not positive definite
[R, k] = chol(B);
k

% Theoretically B = A^T A is symmetric and positive semi-definite,
% so all eigenvalues should be real and non-negative
% However rounding error can make smallest eigenvalue negative or
% less than machine precision. Positive or negative should be
% determined with respect to the relative machine precision eps
evmin = min(eig(B))
