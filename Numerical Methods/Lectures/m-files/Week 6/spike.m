% MATH2089: File = spike.m
% Numerical integration of integrand with Gaussian spike
% Using N+1 points (N equal width intervals) on [a, b]
% Numerical integration can always miss a narrow spike

format compact

a = 0; b = 1;

% Try N = 19 and N = 20
N = 19;
h = (b - a) / N;

x = a + h*[0:N];

% Choose standard deviation so peak is within an interval
%sig = h/10
sig = 0.005

func = @(x, a, b, sig) (1/(sig*sqrt(2*pi))) * exp( -(x - (a+b)/2).^2 / (2*sig^2) )

f = func(x, a, b, sig);
QNf = h*(sum(f)-f(1)/2-f(end)/2)

nplt = 100001;
xplt = linspace(a, b, nplt);
fplt = func(xplt, a, b, sig);
fmax = max(fplt)
hplt = xplt(2) - xplt(1);
% Trapezoidal rule
Qfplt = hplt*(sum(fplt)-fplt(1)/2-fplt(end)/2)
figure(1)
plot(xplt, fplt, x, f, 'r*')
grid on
xlabel('x')
ylabel('f(x)')
tstr = sprintf('Numerical integration of a spike with N = %d, Q = %.2e', N, QNf);
title(tstr)
