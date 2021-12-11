function x = tridiag(a, b, c, d)
% x = tridiag(a, b, c, d)
% MATH2089: Fle = tridiag.m
% Solves T*x = d where
% T = diag(a,-1) + diag(b,0) + diag(c,1)
% Vector b has length n, while a and c have length n-1, 

n = length(b);
x = zeros(n,1);

% Gaussian elimination
for k = 1:n-1

   p = a(k)/b(k);
   b(k+1) = b(k+1) - p*c(k);
   d(k+1) = d(k+1) - p*d(k);

end

% Backsubstitution
x(n) = d(n)/b(n);
for k = n-1:-1:1

   x(k) = (d(k) - c(k)*x(k+1)) / b(k);

end

