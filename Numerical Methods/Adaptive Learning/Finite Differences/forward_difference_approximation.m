% Forward Difference Approximation

f = @(x) exp(x.^2/2);
df = @(x) x.*exp(x.^2/2);
h = 10.^[-18:0];
fd = (f(1+h) - f(1))./h;
err = abs(fd  - df(1));

loglog(h, err);
title('Absolute error in forward difference approximation of df(1)');
xlabel('Step size h'); ylabel('Absolute error');

[emin, imin] = min(err);
% min abs error is emin
% step size giving min abs error is h(imin)