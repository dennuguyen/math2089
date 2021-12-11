% MATH2089: File = intdef.m
% Illustrate definition of an intergral

format compact

% Define integrand
f = @(x) (1/sqrt(2*pi))*exp(-x.^2/2)

% Define interval of integration
a = -2, b = 3

% Define grid points
N = 10
x = linspace(a, b, N+1);
F = f(x);

% Plot function and grid points
figure(1)
xp = linspace(a, b, 1001);
yp = f(xp);
plot(xp, yp, x, F, 'r*');
hold on
for j = 1:N
    plot(x(j:j+1), F(j)*[1 1], 'm-', x(j)*[1 1], [0 F(j)], 'm-',  x(j+1)*[1 1], [0 F(j)], 'm-');
end;
hold off
grid on
tstr = sprintf('Integrand over interval [%.2f, %.2f])', a, b);
title(tstr)
ylim([0 0.45])