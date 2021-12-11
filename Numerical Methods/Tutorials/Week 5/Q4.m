% Exercise 4

% A*x = b where A is known 'exactly'
% norm(A - A') = 9.3e-16
% rcond(A) = 1e-12
% min(eig(A)) = 1.3e-7
% max(eig(A)) = 2.7e6

% PART A
% norm(A-A') = 0
% norm of the 0 matrix is 0
% Therefore A is symmetric i.e. A = A'

% PART B
% A*v = lambda*v
% (A'*A)*v = A'*(A*v) = lambda*A'*v = lambda*A*v = lambda^2*v

% PART C
% 2-norm condition number of A = max(eig(A))/min(eig(A))
kappa2 = 2.7e6/1.3e-7
% Very large condition number is ill-conditioned

% PART D
kappa1 = 1/1e-12
% rcond is not consistent with kappa2 as rcond is using 1-norm
% choice of norm affects precise value but both indicates ill condition

% PART E
% relative error of x = k(A) [p_A + p_B]
error = kappa2 * (0.5*10^-4 + eps)

% PART F
% for x to be accurate to 4 sig figs
b = 0.5*10^-4/kappa2 - eps
abs(b) <= eps
% b is smaller than eps, therefore x cannot be accurate to 4 sig figs
% no matter how accurate b is (error in b would have to be negative!)