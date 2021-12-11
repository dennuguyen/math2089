% Q2

% pre-allocating
[h, forward_vec, error] = deal(ones(1, 19));

% PART A
% Smallest sensible stepsize is h = 1.00e-08

% PART B
syms x;
f = @(x) exp(x.^2/2)
F = matlabFunction(diff(f(x)))

% PART C
h = 10.^(0:-1:-18);

i = 1;
forward = @(x, h) (f(x+h) - f(x))/h;
while i <= 19
    forward_vec(i) = forward(1, h(i));
    i = i + 1;
end
forward_vec

% PART D
j = 1;
while j <= 19
    error(j) = abs(forward_vec(j) - F(1));
    j = j + 1;
end
error

% PART E
loglog(h, error)
xlabel('Finite Different Stepsize, h')
ylabel('Absolute Error')
title('Absolute Error in Forward Difference Approximation of f''(x)')
grid on

% PART F
h_minError = 1e-08
sqrt(eps)
% Therefore h_minError == sqrt(eps)

% PART G
% For h = [10^-16, 10^-18], the forward difference approximation of f'(x)
% becomes 0. Therefore the absolute error in f'(x) is constant i.e. = f'(1)

% PART H
fprintf('\n\nAbsolute Error in Forward Difference Approximation of f''(x)\n\n')
fprintf('\th\t\t\t f''(x)\t\tforward difference\t error\n')
fprintf('-----------------------------------------------------------\n')
fprintf('%0.2e\t\t%f\t\t%f\t\t%0.4e\n', [h; F(1)*ones(1, 19); forward_vec; error])