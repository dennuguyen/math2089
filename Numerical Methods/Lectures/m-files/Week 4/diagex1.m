% MATH2089: File = diagex1.m
% Example on MATLAB diag command and matrix diagonals

clear all
format compact

% Echo commands to command window
echo on

% Define vector u
u = [2 1 0 -1 2]

% Use diag command
A = diag(u)
B= diag(u, 1)
C =diag(u, -1)

% Define matrix X
X = [11 12 13; 21 22 23; 31 32 33]

% Use diag command 
diag(X)

% Use diag command twice
diag(diag(X))

echo off

