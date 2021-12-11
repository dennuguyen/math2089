% MATH2089: File = bvpex1.m
% Boundary value Problen - Example 1
% Solve initial value problem y'' = g(t, y, y')
% on the interval [a, b] with
% boundary values y(a) = ya, y(b) = yb

format compact

% Define function f using an anonymous function
% As first order system x = [y, y']
f = @(t, x) [x(2); (-1./t).*x(2) - 2.5]
fstr = 'y'''' - (1/t)y'' -2.5 = 0';
%f = @(t, x) [x(2); -x(2)./t - 2]
%fstr = 'y'''' - y''/t -2 = 0';

% Interval
a = 0.5, b = 1.5

% Boundary values
ya = 0, yb = 0

% Set options for ode45
%opt = [];  % Default values RelTol = 1e-3, AbsTol = 1e-6
opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);

% Guess for eta = y'(a)
%eta = 1
%eta = 2
% Value of eta from linear interpolation between eta = 1, 2
eta = 1.6506

% Solve using medium accuracy method with step-size control
[ts, ys] = ode45(f, [a, b], [ya; eta], opt);

% Plot solution
figure(1)
plot(ts, ys);
grid on
xlabel('t')
ylabel('y(t)')
tstr= sprintf('BVP %s, y(%.1f) = %.2f, y(%.1f) = %.2f, y''(a) = %.4f', ...
    fstr, a, ya, b, yb, eta)
title(tstr)
legend('x_1 = y', 'x_2 = y''')

