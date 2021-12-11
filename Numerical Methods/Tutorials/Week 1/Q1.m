% QUESTION 1

% PART A
format
pi
% pi = 3.1416

% PART B
format long
pi
% pi = 3.141592653589793

% PART C
% 8 sig fig
% pi = 3.1415926

% PART D
p = 3.1416;
abs_err = abs(pi - p)
rel_err = abs_err/abs(pi)

% PART E
x = 2e30;
y = sin(x)
% ans = 2.2204e-16 != 0.1795 due to rounding error

% PART F
k = 1:100;
y(k) = sin(pi*10.^k);
plot(k, y)
% for large k, y is not 0 due to rounding error