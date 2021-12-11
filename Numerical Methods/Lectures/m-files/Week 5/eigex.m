% MATH2089: File = eigex.m
% Examples on eigenvalues of real n by n matrix

clear
format compact
echo on

% Size of matrix
n = 20;

% Randomly distrbuted entries from N(0,1)
A = randn(n,n);

% Eigenvalues
ev1 = eig(A);
figure(1)
plot(real(ev1), imag(ev1), '*');
grid on
title('Eigenvalues of A');
disp('Press any key to continue ...'); pause

% B = A + A' is symmetric
B = A + A';
ev2 = eig(B);
figure(2)
plot(real(ev2), imag(ev2), '*');
grid on
title('Eigenvalues of B = A + A''');
disp('Press any key to continue ...'); pause

% C = A'*A is symmetric, positive semi-definite
C = A'*A;
ev3 = eig(C);
figure(3)
plot(real(ev3), imag(ev3), '*');
grid on
title('Eigenvalues of C = A''*A');

echo off