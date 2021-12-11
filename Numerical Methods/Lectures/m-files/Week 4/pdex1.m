% MATH2089: File = pdex1.m
% Checking symmetric positive definite

clear all
format compact

% Echo commands to command window
echo on

% Define matrix
A = [5 -7 -6; -7 13 2; -6 2 20]
%A = [6 -7 -6; -7 14 2; -6 2 21]
%A = [4 -7 -6; -7 13 2; -6 2 20]

% Checks for symmetric
S1 = A' == A
S2 = A' - A
S3 = norm(A'-A, 1)

% Check if Cholesky factorization exists
[R, p] = chol(A)
% Cholesky exists <==> p == 0

% Check eigenvalues are all positive
ev = eig(A)

echo off
