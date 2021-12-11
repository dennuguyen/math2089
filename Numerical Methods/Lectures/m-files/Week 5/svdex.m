% MATH2089: File = svdex.m
% Example on SVD (Singular Value Decomposition)

clear
format compact
format short e
echo on

% Define matrix A
% Try other examples
A = [1 1; -1 1; 2 2]

% Number of rows and columns in A
[m, n] = size(A)

% Calculate QR factorization of A
[U, S, V] = svd(A)

% Extract singular values (or use sv = svd(A))
sv = diag(S)

% Check A = U * S * V'
USV = U * S * V'
chk = norm(USV - A, 1)

% Check orthogonality of U, V
UTU = U'*U
Uchk = norm(UTU-eye(m), 1)
VTV = V'*V
Vchk = norm(VTV-eye(n), 1)

echo off