% MATH2089: File = tut01q3sol.m
% Numerical Methods Laboratory Week 01
% Question 3 solutions

% Remove extra lines
format compact

% Echo commands to screen
echo on

% Inf and -Inf are part of IEEE arithmetic
Q3ai = 1/0
Q3aii = -1/0
Q3aiii = log(0)
% Matlab understands complex numbers
Q3aiv = log(-1)

% NaN or "Not a Number" is also part of IEEE arithmetic
Q3bi = 0/0
Q3bii = Inf - Inf
Q3biii = 0*Inf
Q3biv = 0*NaN
