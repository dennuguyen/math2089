% MATH2089: File = pltsin.m
% Plot sin function for calculating inverse function (arcsin)

format compact

f = @(x, y) sin(x) - y;

xlo = -pi/2; xhi = pi/2;
xp = linspace(xlo, xhi, 501);
yp = sin(xp);

y = 0.6
% Solve the nonlinear equation
x = fzero(@(x) f(x,y), 0.5)

figure(1)
%subplot(2,1,1)
plot(xp, yp, [xlo, xhi], y*[1, 1], x, sin(x), 'm.', 'MarkerSize', 18);
grid on
xlabel('x')
title('sine function')
xlim([xlo xhi]);
yl = [-1.1 1.1];
ylim(yl)
figure(2)
%subplot(2,1,2)
plot(xp, yp-y, x, 0, 'm.', 'MarkerSize', 18);
grid on
tstr = sprintf('f(x) = sin(x) - %.1f = 0', y)
title(tstr)
xlabel('x')
xlim([xlo xhi]);
ylim(yl-y);
