% MATH2089: File = tut09q1sol.m
% Solution to Tutorial Week 09, Question 1

format compact

% Interval of integration
a = 1, b = 2

% Integrand
f = @(x) 1./x

% Esact integral for computign error
Iexact = log(2)

% Step size
h = 1/8
% Number of equal width intervals)
% h = (b-a)/N  <==>  N = (b-a)/h
N = (b-a)/h

% Equally spaced quadratue nodes: mathematically x_0, x_1, ..., x_N
% but stored as elements of N+1 dimensional vecotr x
x = a + h*[0:N]

% Function valeus at equally spaced nodes
feq = f(x)

% Quadrature weights
% Trapezoidal rule
wtrap = h*[1/2 ones(1,N-1) 1/2]
Qtrap = sum(wtrap.*feq)
Etrap = Iexact - Qtrap;
fprintf('Estimate using Trapezoidal rule, h = %.3f, Q = %.12f, Error E = %.4e\n', ...
    h, Qtrap, Etrap);

% Simpson's rule (N must be even)
wsimp0 = [1 2*ones(1,N-1) 1];
I = 2:2:N;
wsimp0(I) = 4
wsimp = (h/3)*wsimp0
Qsimp = sum(wsimp.*feq)
Esimp = Iexact - Qsimp
fprintf('Estimate using Simpson''s rule, h = %.3f, Q = %.12f, Error E = %.4e\n', ...
    h, Qsimp, Esimp);

% Gauss-Legendre quadrature
N = 4
% Nodes and weights for [-1, 1]
[xgl, wgl] = gauleg(N)
% Transform y in [-1, 1]  to x in [1, 2]
% y = 3/2  + x/2, ==> dy = dx/2
ygl = (3/2) + xgl/2
vgl = wgl/2
fgl = f(ygl)
Qgl = sum(vgl.*fgl)
Egl = Iexact - Qgl
fprintf('Estimate using Gauss-Legendre, N = %d, Q = %.12f, Error E = %.4e\n', ...
    N, Qgl, Egl);
    
figure(1)
subplot(2,1,1)
xplt = linspace(a, b, 401);
fplt = f(xplt);
plot(xplt, fplt, x, feq, 'r*');
title('Integrand and function values at N = 8 equal width intervals')
grid on
subplot(2,1,2)
plot(xplt, fplt, ygl, fgl, 'mh');
grid on
title('Integrand and Gauss-Legendre nodes for N = 4');

