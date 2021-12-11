% MATH2089: File = matnorms.m
% Illustrate different matrix norms

clear all
format compact

% Echo commands t command window
echo on

% Define matrix
A = [1 -3 2; -2 2 4]

size(A)

% 1-norm
n1 = norm(A,1)
n1 = max(sum(abs(A)))

% 2-norm
n2 = norm(A)
B = A'*A
Bev = eig(B)
n2 = sqrt(max(Bev))

% Infinity norm
ni = norm(A,inf)
ni = max(sum(abs(A),2))

% Frobenius norm
nF = norm(A, 'fro')
nF = sqrt(sum(sum(A.^2)))

echo off
