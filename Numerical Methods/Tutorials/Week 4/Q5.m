% Exercise 5

% PART B
x = linspace(-2, 2, 2001);
f = @(x) -exp(x + 1).*(x < 0) + (x.^2 - x + 1/2).*(x >= 0);

% PART C
plot(x, f(x))

% Create Discontinuity
i = find(x == 0);
F = f(x);
F(i) = NaN;
plot(x, F, -eps, f(-eps), 'ob', eps, f(eps), '.b')

% Label
grid on
xlabel('x')
ylabel('y')
title('f(x)')