% MATH2089: File = nthroot.m
% Set up a polynomial equations to find the n the root
% x = a^(1/n)  <==> f(x) = x^n - a = 0

% Set diplay options
format compact
format short e

% Specify integer n > 1 for n th root
n = 2;

% Value a > 1
a = 8;

% Exact soluion for checking
xs = a^(1/n);

% Anonymous function f
% Uses valueso f n and a defined before this
f = @(x) x.^n - a;

% Starting point for iterative method
x1 = a;
% Maximum number of iterations
maxit = 10;

% Derivative for Newton's method
fd = @(x) n*x.^(n-1)

% Newton's method starting at x1
X(1) = x1;
for k = 1:maxit
    X(k+1) = X(k) - f(X(k))/fd(X(k));
end;
X
F = f(X)
E = xs - X
    
% Plot the function and n th root
xplt = linspace(0, a, 401);
fplt = f(xplt);
figure(1)
plot(xplt, fplt,  X, F, 'ch', xs, 0, 'r*');
grid on
str = sprintf('f(x) = x^{%d} - %.2f', n, a);
title(str)
xlabel('x');
legend('f(x)', 'Newton''s method', 'Location', 'NorthWest', 'Solution to f(x) = 0');