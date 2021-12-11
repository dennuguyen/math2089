function p = horner(a, x)
% MATH2089: File = horner.m
% p = horner(a, x)
% Horner's method to evaluate the polynomial
% p(x) = a(1) + a(2)*x + a(3)*x^2 + .... + a(n)*x^(n-1) + a(n+1)*x^n
% at every point in the input array x.
% The output array p has the same size as x.

% Degree of polynomial is implicitly defined by the length of
% the coefficient vector a
n = length(a)-1;

% Initialize p, giving the constant a(1) if n = 0
% Just setting p = a(n+1) will not produce output
% of the correct size if n = 0 (constant polynomial)
% and x contains more than one value
p = a(n+1)*ones(size(x));

% Loop to get higher degree terms
for k = n : -1 : 1

   p = x .* p + a(k);

end;
