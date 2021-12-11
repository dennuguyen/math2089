% MATH2089: File = fdiff.m
% Finite difference approximations of first derivative
% Anonymous functions func and deriv must be specified
% to evaluate f(x) and f'(x) for a vector of arguments x

format compact

% Values for finite difference steps
% Smallest h is base^(-pmax)
% Base 10
base = 10;
pmax = 20;
% Base 2
%base = 2;
%pmax = 60;

% Specify function using anonymous function
func = @(x) log(1 + x);
% Specify derivative for calculating errors
deriv = @(x) 1 ./ (1 + x);

% Point for derivative approximation
x0 = 2;

% Finite difference steps
p = [-pmax:0];   % h = base^p(i)
h = base.^p;
fprintf('\nErrors in finite difference approximation of derivatives\n');
fprintf('Floating point relative precision = %.2e\n', eps)

% Evaluate function and derivative at base point
f0 = func(x0);
df0 = deriv(x0);

fprintf('\nForward difference approximation of first derivative\n')
x = x0 + h;
fp = func(x);
df = (fp - f0) ./ h;
fderr = abs(df - df0);
[fdmin, imin] = min(fderr);
fdhm = h(imin);
fprintf('Minimum error in forward difference approximation = %.2e\n', fdmin)
fprintf('Step giving smallest absolute error = %.2e\n', fdhm)
fprintf('Square root of machine precision = %.2e\n', sqrt(eps))

% Font size for plot labels
fs =10;
figure(1)
subplot(211)
loglog(h, abs(fderr))
set(gca,'FontSize',fs)
title('Forward difference approximation of f '' (x)','FontSize',fs)
xlabel('Difference h','Fontsize',fs)
ylabel('Absolute error','FontSize',fs)
set(gca,'YLim', [1e-15 1])
grid

fprintf('\nCentral difference approximation of first derivative\n')
x = x0 - h;
fm = func(x);
df = (fp - fm) ./ (2*h);
cderr = abs(df - df0);
[cdmin, imin] = min(cderr);
cdhm = h(imin);
fprintf('Minimum error in central difference approximation = %.2e\n', cdmin)
fprintf('Step giving smallest absolute error = %.2e\n', cdhm)
fprintf('Cube root of machine precision = %.2e\n', eps^(1/3))

subplot(212)
loglog(h, abs(cderr))
set(gca,'FontSize',fs)
title('Central difference approximation to f '' (x)','Fontsize',fs)
xlabel('Difference h','Fontsize',fs)
ylabel('Absolute error','FontSize',fs)
set(gca,'YLim', [1e-15 1])
grid
