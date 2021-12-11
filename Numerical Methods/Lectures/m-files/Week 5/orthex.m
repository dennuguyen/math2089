% MATH2089: File = orthex.m
% Example on orthogonal matrices

clear
format compact

echo on

% Define matrix Q
Q = [1/sqrt(2)  1/sqrt(6);
    1/sqrt(2) -1/sqrt(6);
    0          2/sqrt(6)]

% Number of rows, number of columns in Q
size(Q)

% Check Q is orthogonal
QTQ = Q'*Q
QQT = Q*Q'

% Check individual columns are orthonormal
i = 1, j = 2

% Extract columns i and j
qi = Q(:,i)
qj = Q(:,j)
qiTqj = qi'*qj

echo off