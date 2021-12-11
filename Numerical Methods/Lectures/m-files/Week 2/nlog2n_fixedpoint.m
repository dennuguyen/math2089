% MATH2089
% Solve  n*log2(n) = const using fixed point iteration
%  Let f(x) = n*log2(n) - const
% Nee to convert f(x) = 0 into the form g(x) = x

const = 100;

%f = @(x) x.*log(x)/ log(2) - const;
f = @(x) x.*log2(x) - const;
g = @(x) const*log(2)./log(x);

% for plotting 
xplt = linspace(1, const, 4001);
fplt = f(xplt);
semilogx(xplt,fplt,'-');
grid on;

hold on;
% maximal number of iterations
kmax = 34;

% initial guess
xk = 50;

% tolerance
tolx = 10*eps;

k = 1;
converged = 0;
while (k <= kmax & ~converged)
   xnew = g(xk);
   semilogx(xk, f(xk), 'mo')
   if (abs(xnew-xk)< tolx)
      converged = 1;
   end
   xk = xnew;
   k = k + 1
   pause;
end


