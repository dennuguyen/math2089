% Exercise 1

% PART A
x = [5, -4, 0, -6]';

% 1-norm = sum(abs(x));
% 2-norm = sqrt(sum(x.^2));
% 3-norm = max(abs(x));

% PART B
% Using MATLAB in-built function
one_norm = norm(x, 1);
two_norm = norm(x, 2);
infinite_norm = norm(x, inf);