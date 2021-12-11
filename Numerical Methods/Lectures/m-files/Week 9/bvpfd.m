% MATH2089 File = bvpfd.m
% Finite difference method for BVP y'' = f(t, y, y') on (a, b)
% Boundary values y(a) = y_a, y(b) = y_b

format compact

% ODE
f = @(t,y,dy) dy./t - y./t.^2;
yex = @(t) 2*t + t.*log(t)/log(2);
fstr = 'y'''' - y''/t + y/t^2 = 0'

% Domain [a, b]
a = 1, b = 2

% Boundary values
ya = 2, yb = 6

% Space discretization
n = 10
h = (b-a)/(n+1)
t = linspace(a, b, n+2);

figure(1); clf;
plot([a b], [0 0], 'b-', t, zeros(size(t)), 'b.', 'MarkerSize', 18)
hold on
yp = [-0.2 0.2];
plot([a a], yp, 'k-')
plot([b b], yp, 'k-')
text(a, -0.25, 'a = t_0', 'HorizontalAlignment', 'Center')
text(b, -0.25, 't_{n+1} = b', 'HorizontalAlignment', 'Center')
hold off
axis off
ylim(4*yp)

% Discretization of ODE
% Internal grid points ti as column vector
ti = t(2:n+1); ti = ti(:);
d0 = 2 - (h^2)./(ti.^2); % beta_j
d1m = -1 - h./(2*ti(2:n)); % gamma_j
d1p = -1 + h./(2*ti(1:n-1)); % alpha_j
% Create tridiagonal coefficient matrix (full matrix)
A = diag(d0, 0) + diag(d1m,-1) + diag(d1p,1);
% Create sparse diagonal matrix
% Elements of sub diagonal taken from upper part of columns
% Elements of super diaginals taken from lower part of columns
ASP = spdiags([[d1m; 0] d0 [0; d1p]], [-1 0 1], n, n);
Achk = norm(A-ASP, 1)
rhs = zeros(n,1);
rhs(1) = (1 + h/(2*ti(1)))*ya;
rhs(n) = (1 - h/(2*ti(n)))*yb;
figure(2); clf
spy(A)
tstr = sprintf('Coefficient matrix A for n = %d', n);
title(tstr)

% Solve discretized problem
y = A \ rhs;

% Plot solution
figure(3)
plot(t, [ya; y; yb], t, yex(t), '*')
grid on
str1 = sprintf('Numerical solution %d grid points', n+2);
legend(str1, 'Exact solution', 'Location', 'NorthWest');
xlabel('t')
ylabel('y(t)')
tstr = sprintf('BVP: %s, y(%.2f) = %.4f, y(%.2f) = %.4f', fstr, a, ya, b, yb)
title(tstr)

% Plot error
err = yex(t) - [ya y' yb];
figure(4)
plot(t, err);
grid on
xlabel('t')
tstr4 = sprintf('Error for n = %d', n);
title(tstr4)