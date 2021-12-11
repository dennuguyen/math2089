% MATH2089
% Solve  x*log2(x) = const using bisection method
%  Let f(x) = x*log2(x) - const

const = 100;

f = @(x) x.*log(x)/ log(2) - const;

% for plotting 
xplt = linspace(1, const, 4001);
fplt = f(xplt);
semilogx(xplt,fplt,'-');
grid on;

hold on;
% maximal number of iterations
kmax = 34;

% initial guess
a = 1;
b = 100;
xk = (a+b)/2;

% tolerance
tolx = 10*eps;

k = 1;
converged = 0;
while (k <= kmax & ~converged)
   % bracket the root 
   if (f(a)*f(xk)<0)
       b = xk;
       xnew = (a+b)/2;
   else
       a = xk;
       xnew = (a+b)/2;
   end
   semilogx(xk, f(xk), 'mo')
   if (abs(xnew-xk)< tolx)
      converged = 1;
   end
   xk = xnew;
   k = k + 1
   pause;
end


