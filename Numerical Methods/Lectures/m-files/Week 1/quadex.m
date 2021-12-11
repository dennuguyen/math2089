% MATH2089: File = quadex.m
% Example on roots of a quadratic and catastrophic cancellation

format compact
format long e

% Anonymous function to evaluate quadratic
%q = @(x, a, b, c) a*x.^2 + b*x + c
% Horner's method
q = @(x, a, b, c) (a*x + b).*x + c

% Example quadratic a*x^2 + b*x + c
a = -1, b = 2, c = -1e-8

% Solutions using standard quadratic formula
x1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a)
x2 = (-b - sqrt(b^2 - 4*a*c)) / (2*a)

% Check values of quadratic are zero
q1 = q(x1, a, b, c)
q2 = q(x2, a, b, c)

% Solution using alternate formula
x1a = (-2*c) / (b + sqrt(b^2 - 4*a*c))
x2a = (2*c) / (-b + sqrt(b^2 - 4*a*c))

% Check values of quadratic are zero
q1a = q(x1a, a, b, c)
q2a = q(x2a, a, b, c)

% Visual check: plot quadratic and roots
x = linspace(-1, 3, 1001);
qx = q(x, a, b, c);
figure(1)
plot(x, qx, x1, q1, 'r.', x2, q2, 'r.');
grid on
title('Roots of a quadratic')
xlabel('x')
ylim([-3.5 1.5])
