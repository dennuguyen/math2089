% MATH2089: File = tut01q2sol.m
% Numerical Methods Laboratory Week 01
% Question 2 solutions

% Remove extra lines
format compact

% Echo command lines to screen
echo on

% Question 2 a)
% In exact arithmetic the answer should be zero
Q2a = 0.75*0.2 - 0.15

% Question 2, b)
% In exact arithmetic, both answers should be 6
% Remember 0.1 does not have a finite binary representation
Q2b1 = floor(6/1)
Q2b2 = floor(0.6/0.1)

% Question 2 c)
% h is just big enough so that 100 + h is not stored as 100
% The threshold is around 100*eps
h = 1e-14, Q2c = 100 + h - 100
% The calculated value of 100_h-100 only agrees with h to 1 significant figure

% Question 2 d)
% h is so small that 100 + h is stored as 100 on the computer
h = 1e-15, Q2d = 100 + h - 100

% Question 2 e)
eps, realmax, realmin

% Question 2 f)
% Logical values are 1 for true and 0 for false
eps
Q2f1 = 1 + eps > 1
Q2f2 = 1 + eps/2 > 1
