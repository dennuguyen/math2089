% MATH2089: File = nle2.m
% Nonlinear equations example 2 - finding minimum

format compact

% Define function
func = @(x) exp(-x.^2) .* sin(2*pi*x);
deriv = @(x) (-2*x).*exp(-x.^2).*sin(2*pi*x) + (2*pi)*exp(-x.^2).*cos(2*pi*x);

% Starting point for root on [0.5, 1]
x0 = 0.75
x1 = fzero(deriv, x0)
f1 = func(x1)
df1 = deriv(x1)

% Starting point for root on [1.5, 2]
x0 = 1.75
x2 = fzero(deriv, x0)
f2 = func(x2)
df2 = deriv(x2)

xplt = linspace(0, 2, 401);
fplt = func(xplt);
dfplt = deriv(xplt);
figure(1)
plot(xplt, fplt, x1, f1, 'r*', x2, f2, 'mh', 'MarkerSize', 10)
grid on
xlabel('x')
title('Function f(x) = e^{-x^2} sin(2\pi x)')
figure(2)
plot(xplt, dfplt, x1, df1, 'r*', x2, df2, 'mh', 'MarkerSize', 10)
grid on
xlabel('x')
title('Derivative f''(x) = 2 e^{-x^2} (-x sin(2\pi x) + \pi cos(2\pi x)')

