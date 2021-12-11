% Exercise 2

% PART A
A = [3 -4 2; 0 4 -5; 2 -2, 3];
b = [3; 3; 3];

% matrix 1-norm = max(sum(abs(A)))
% matrix 2-norm = max(sqrt(eig(A'*A)))
% matrix infinite-norm = max(sum(abs(A')))

% PART B
one_norm = norm(A, 1)
two_norm = norm(A, 2)
infinite_norm = norm(A, inf)

% PART C
x = A\b         % if dimension doesn't fit, it will solve least squares

% PART D
r = b - A*x     % not [0, 0, 0] due to rounding error
norm(r)         % norm is small therefore, accepting x as solution

% PART E
[lower, upper] = lu(A)