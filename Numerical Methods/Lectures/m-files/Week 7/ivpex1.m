% MATH2089: File = ivpex1.m
% Initial value Problen - Example 1
% Solve initial value problem y' = f(t, y)
% on the time interval [t0, tf] with
% initial conditions y(t0) = y0

format compact

% Define function f using an anonymous function
f = @(t, y) sin(y + t.^2)
fstr = 'sin(y + t^2)';

% Time interval
t0 = 0, tf = 10
%t0 = -4, tf = 4

% Initial value at t0
%y0 = 1
%y0 = [1 2]
%y0 = [1 1.5 2]
%y0 = [-4:0.2:4]
y0 = 0;
% Set options for ode45
opt = [];  % Default values RelTol = 1e-3, AbsTol = 1e-6
%opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);

% Solve using medium accuracy method
[ts, ys] = ode45(f, [t0, tf], y0, opt);

% Size of output
whos ts ys

% Plot solution
figure(1)
plot(ts, ys);
grid on
xlabel('t')
ylabel('y(t)')
tstr= sprintf('Solution to IVP y'' = %s', fstr)
title(tstr)

