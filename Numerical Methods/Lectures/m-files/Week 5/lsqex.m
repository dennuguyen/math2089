% MATH2089: File = lsqex.m
% Data fitting in least squares sense

format compact

% Sample points
tdat = [0:0.5:2]; % or tdat = linspace(0,2,5);
ydat = [1.0 0.6 0.4 0.1 0.08];

% Force to be a column vector
tdat = tdat(:);
ydat = ydat(:);
  
% (a) Line of best fit
A = [ones(size(tdat)) tdat];
x = A \ ydat
t = linspace(0,2,100);
y = x(1) + x(2)*t;
figure(1)
plot(t,y,'b-',tdat,ydat,'m*');
title('Line of best bit')
  
% (b) Quadratic of best fit
A = [ones(size(tdat)) tdat tdat.^2];
x = A \ ydat
t = linspace(0,2,100);
y = x(1) + x(2)*t + x(3)*t.^2;
figure(2)
plot(t,y,'b-',tdat,ydat,'m*');
title('Quadratic of best bit')
  
% (c) Polynomial interpolation of degree 4
A = [ones(size(tdat)) tdat tdat.^2 tdat.^3 tdat.^4];
x = A \ ydat
t = linspace(0,2,100);
y = x(1) + x(2)*t + x(3)*t.^2 + x(4)*t.^3 + x(5)*t.^4;
figure(3)
plot(t,y,'b-',tdat,ydat,'m*');
title('Polynomial interpolation')
  
% (d) Approximation by exponential function
%     Converted to a linear problem by taking logs
A = [ones(size(tdat)) tdat];
x = A \ log(ydat)
lam = exp(x(1))
mu = x(2)
t = linspace(0,2,100);
y = lam * exp(mu*t);
figure(4)
plot(t,y,'b-',tdat,ydat,'m*');
title('Exponential approximation')
  