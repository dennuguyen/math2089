% MATH2089: File = tut03q2sol.m
% Solution to Week 03 Laboratory, Question 2
% Finite different approximation of derivatives
% Anonymous functions func and deriv must be specified
% to evaluate f(x) nd f'(x) for a vector of arguments x

format compact

% Turn echo of commands off
echo off

% Values for finite difference steps
% Smallest h used in this program is base^(-pmax)
% The smallest h that ensures that x+h (as stored on the computer)
% is different from x is h > |x|*eps where eps = 2^(-52) approx 2.2e-16.
% For smaller values of h, x+h is stored as x on the computer,
% so f(x+h) = f(x) and hence f(x+h)-f(x) = 0 so the estimate of f'(x) is 0.
% Base 10. 
base = 10; pmax = 18;
% base 2, 2^(-60) approx 10^(-18)
%base = 2; pmax = 60;


% Specify function using anonymous function
func = @(x) exp(x.^2/2);
% Specify derivative for calculating errors
deriv = @(x) x.*exp(x.^2/2);

% Point for derivative approximation
x0 = 1;

% Finite difference steps
p = [-pmax:0];   % h = base^p(i)
h = base.^p;
fprintf('\nErrors in finite difference approximation of derivative\n');
fprintf('Floating point relative precision = %.2e\n', eps)

% Evaluate function and derivative at base point
f0 = func(x0);
df0 = deriv(x0);

fprintf('\nForward difference approximation of first derivative\n')
xh = x0 + h;
fp = func(xh);
df = (fp - f0) ./ h;
fderr = df - df0;
[fdmin, imin] = min(abs(fderr));
fdhm = h(imin);
fprintf('Minimum error in forward difference approximation = %.2e\n', fdmin)
fprintf('Step giving smallest absolute error = %.2e\n', fdhm)
fprintf('Square root of machine precision = %.2e\n', sqrt(eps))

% Print Table of results
fprintf('\n   h          f''(x)    forward difference      error\n');
fprintf('--------------------------------------------------------\n')
for j = length(h):-1:1
    fprintf(' %.2e    %.6f       %9.6f         %11.4e\n', h(j), df0, df(j), fderr(j));
end;

% Plot of errors
figure(1)
loglog(h, abs(fderr))
title('Absolute error in forward difference approximation of f '' (x)')
xlabel('Finite difference stepsize  h')
ylabel('Absolute error')
xlim([1e-18 1])
grid on
