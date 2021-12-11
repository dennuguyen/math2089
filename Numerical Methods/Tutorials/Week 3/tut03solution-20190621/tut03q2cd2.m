% Approximation second derivative by the central difference
format compact
clear all
close all

% Function to be approximated
f = @(x) sqrt(x);
ddf = @(x) -x.^(-3/2) / 4; % f''(x)
a = 1; % point where derivative is computed

% (a) Central difference
h = 10.^([-18:0]);
h = h(:); % change to column vector
ddf_app = (f(a+h) - 2*f(a) + f(a-h)) ./ (h.^2);

% (b) Absolute error
ddf_ext = ddf(a); % exact value f''(a)
ddf_err = abs(ddf_app-ddf_ext);
loglog(h,ddf_err)
xlabel('x')
title('Error in central difference approximation of second derivative')
grid on

[ddfmin, imin] = min(abs(ddf_err));
fdhm = h(imin);
fprintf('Minimum error in central difference approximation = %.2e\n', ddfmin)
fprintf('Step giving smallest absolute error = %.2e\n', fdhm)
fprintf('Fourth root of machine precision = %.2e\n', eps^(1/4))
