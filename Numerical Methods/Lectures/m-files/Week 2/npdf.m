function [f, df] = npdf(x, mu, sigma)
% [f, df] = npdf(x, mu, sigma)
% MATH2089: File = npdf.m
% Calculate values of the normal probability density function
% with mean mu and standard deviation sigma at the values in x
% -- Input arguments --
% x     = value(s) where function is to be evaluated (can be vector/array)
% mu    = mean of distribution (scalar, default value mu = 0)
% sigma = standard deviation of distribution (scalar, default sigma = 1)
%         If you want mu = 0 but sigma ~= 1 then both must be specified
% -- Output arguments --
% f     = values of the normal PDF at the values in x
%         If the input x is a vector or an array the output f will be
%         a vector/array of the same size
% df    = values of derivative of normal PDF at the values in x
%         Derivative(s) only calculated if function is called with two
%         output arguments
%         If the input x is a vector or an array the output df will be
%         a vector/array of the same size

% Set default values for input arguments
if nargin < 3
    sigma = 1;
end;
if nargin < 2
    mu = 0;
end;

% Use local variables to evaluate function
const = 1/(sigma*sqrt(2*pi));
z = x - mu;
var = sigma^2;
f = const*exp(-z.^2/(2*var));

% If function is called with two output arguments also calculate derivative
if nargout > 1
    df = -(z/var).*f;
else
    df = [];
end;
