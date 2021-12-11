function p = polyeval(a,x)
% MATH2089
% p = polyeval(a,x)
% Evaluate the polynomial
%   p(x) = a(1) + a(2)*x + a(3)*x^2 + .... + a(n)*x^(n-1) + a(n+1)*x^n
% at every point in the input array x.
% The output array p has the same size as x.

% the coefficient vector a
n = length(a)-1;
p = a(1)*ones(size(x));
for k=2:n+1
   p = p + a(k)*x.^(k-1);
end
