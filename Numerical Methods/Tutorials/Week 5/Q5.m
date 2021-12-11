% Exercise 5

% Vector Norms are Related by:
% 2-norm <= 1-norm <= sqrt(n)*2-norm
% inf-norm <= 2-norm <= sqrt(n)*inf-norm
% inf-norm <= 1-norm <= n*inf-norm

% PART A
% e_j is jth unit vector
% 1-norm of e_j = 1
% 2-norm of e_j = 1
% inf-norm of e_j = 1
% Lower bounds cannot be improved

% PART B
e = [1 1 1]
norm(e, 1)      % = n
norm(e, 2)      % = sqrt(n)
norm(e, inf)    % = 1

% PART C
% relative error in x using inf-norm = 3.4e-7
% 3.4e-7 < 0.34e-6 < 0.5e-6
% Therefore x is accurate to 6 sig figs
% If inf-norm = 100, magnitude of largest element is around 100
% x is correct to 3 d.p. i.e. x = 100.yyy
% Other elements of x may be more accurate since inf-norm is the element of
% largest magnitude