% MATH2089: File = tut01q4sol.m
% Numerical Methods Laboratory Week 01
% Question 4 solutions

% Remove extra lines
format compact

% Echo commands to screen
echo on

% Largest finite number
realmax
% Largest t such that exp(t) finite
tmax = log(realmax)
% Check
exp(tmax)
exp(tmax+1)

% Smallest positive number is realmin
realmin

% Largest value such that exp(-t) positive
tmin = -log(realmin)
% Check 
exp(-tmin)

% However IEEE arithmetic has gradual underflow to zero
format short e
t = floor(tmin) + [0:40]
f = exp(-t)
% find gives elements of vector satisfying condition
% find with 'last' gives last index satisfying condition
% See MATLAB documentation (help or doc) for find
imin = find(f > 0, 1, 'last')
tmin = t(imin)
fmin = f(imin)
fchk = f(imin+1)


