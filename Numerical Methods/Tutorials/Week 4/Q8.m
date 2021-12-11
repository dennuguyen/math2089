% Exercise 8
% MATLAB Implementation of Fixed-Point Iteration

% PART E

% Check Root Exists
range = linspace(0, 1, 1001);
f = @(x) 2*x - cos(x);
below = f(range) < 0;
above = f(range) >= 0;

if below .* above ~= zeros(size(range))
    display('\nError: Root does not exist\n\n')
end

% Checking Convergence of g(x)
g = @(x) cos(x)/2;
if sum(find(abs(diff(g(range))) >= 1)) ~= 0;
    display('\nError: Does not converge\n\n')
end

% Fixed-Point Iteration
x(1) = 1/2;
i = 1;
while i < 3
    x(i + 1) = g(x(i));
    i = i + 1;
end