% MATH2089 File = h1d.m
% Discretization of 1-D heat equation on an interval

format compact

% Domain [a, b]
a = 0, b = 4

% Boundary values
Ua = 20, Ub = 100

% Esact solutions
uex = @(x) Ua + ((Ub-Ua)/(b-a))*x

% Space discretization
n = 25
x = linspace(a, b, n+2);
h = (b-a)/(n+1)

figure(1); clf;
plot([a b], [0 0], 'b-', x, zeros(size(x)), 'b.', 'MarkerSize', 18)
hold on
y = [-0.2 0.2];
plot([a a], y, 'k-')
plot([b b], y, 'k-')
text(a, -0.25, 'a = x_0', 'HorizontalAlignment', 'Center')
text(b, -0.25, 'x_{n+1} = b', 'HorizontalAlignment', 'Center')
hold off
axis off
ylim(4*y)

e = ones(n,1);
d0 = 2*e;
d1 = -e;
A = spdiags([d1 d0 d1], [-1 0 1], n, n);
figure(2); clf
spy(A)
tstr = sprintf('Coefficient matrix A for n = %d', n);
title(tstr)

% RHS vector for steady stat heat equation
rhs = zeros(n,1);
rhs(1) = rhs(1) + Ua;
rhs(n) = rhs(n) + Ub;

% Solve sparse linear system
U = A \ rhs;

% Plot solutions
figure(3)
plot(x, [Ua; U; Ub], x, uex(x), 'm--', ...
    [a b], [Ua Ub], 'r.', 'MarkerSize', 18);
grid on
legend('Numerical solution', 'Exact solution', ...
    'Boundary values', 'Location', 'NorthWest');
xlabel('x');
xlim([a-0.2 b+0.2])
ylim([Ua-2 Ub+2])
str = sprintf('Steady state heat equation: %d points, U_a = %.1f, U_b = %.2f', n+2, Ua, Ub);
title(str)
