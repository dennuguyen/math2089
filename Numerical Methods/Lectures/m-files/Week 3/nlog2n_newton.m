% MATH2089
% Solve  x*log2(x) = const using Newton's method
%  Let f(x) = x*log2(x) - const
% Nee to convert f(x) = 0 into the form g(x) = x

const = 100;

f = @(x) x.*log(x)/ log(2) - const;
df = @(x) (log(x) + 1)/log(2);

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
   % Newton's iteration
   xnew = xk - f(xk)/df(xk);
   semilogx(xk, f(xk), 'mo')
   if (abs(xnew-xk)< tolx)
      converged = 1;
   end
   xk = xnew;
   k = k + 1
   pause;
end


