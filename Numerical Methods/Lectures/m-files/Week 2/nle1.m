% MATH2089: File = nle1.m
% Nonlinear equations exmaple 1

format compact

% Define function
alpha = log(4)/5;
func = @(t, alpha) exp(alpha*t) - 2*sin(pi*t);

% Options to Matlab's fzero
% Use 'help optimset' or 'doc optimset' for more information
opt = optimset('Display', 'Iter');

% Starting point for root on [1/2, 1]
x0 = 0.75
% Starting point for root on [0, 1/2]
%x0 = 0.25
% Starting points for root(s) close to 2.5
%x0 = 2.4
%x0 = 2.6

% Call fzero
% Note passing alpha as extra parameter
% and multiple output argumentsedit 
[xs, fs, flag] = fzero(func, x0, opt, alpha)
