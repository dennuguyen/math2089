% MATH2089: File = tut01q1sol.m
% Numerical Methods Laboratory Week 01
% Question 1 solutions

% Default format
format
% Remove extra white space
format compact

% Echo command lines to screen
echo on

% Question 1 a)
% Value of Built-in constant pi
pi

% Question 1 b)
% Increase number of figures displayed
% The format command ONLY changes what is displayed on the screen
% not the value stored on the computer or used in calculations
format long
pi

% Question 1 d)
% Calculate absolute and relative error
% Even though Matlab may display 15 digits
% ONLY the power and at most the leading 2 digits are important
p = 3.1416
aerr = abs(p - pi)
rerr = aerr / pi

% Question 1 e)
% Evaluate sin of a very large value
x = 2e30
y = sin(x)
% The correct value is approximately 0.1795
% Calculated using MuPAD (or Maple) and 50 digits of precision
y_corr = 0.17950046751493908795061
% You get nothing like this using floating point arithmetic
% To evaluate sin(x), first multiples of 2*pi are added/subtracted
% until the argument is in a standard interval, like [-pi, pi]
% Any errors in the computer representation of pi accumulate which
% can produce inaccurate results for arguments of large magnitude.

