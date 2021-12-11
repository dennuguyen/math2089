% MATH2089: File = vecnorms.m
% Illustrate different vector norms

clear all
format compact

% Echo commands t command window
echo on

% Example 1 - Column vector 
v = [-1; 2; -3; 2];
% Another column vector to try
%v = [3; 0; -4; 5; 0; 4]

% Example 2 - vector with random elements
%n = 1000
%v = randn(n,1);

size(v)

% 2-norm
n2 = norm(v)
n2 = sqrt(v'*v)

% p-norm
p = 3
np = norm(v, p)
np = sum(abs(v).^p)^(1/p)

% 1-norm
n1 = norm(v,1)
n1 = sum(abs(v))

% Infinity norm
ni = norm(v,inf)
ni = max(abs(v))

echo off
