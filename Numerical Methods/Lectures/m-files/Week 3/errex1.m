% MATH2089: File = vecnorms.m
% Illustrate vector errors

clear all
format compact

% Echo commands t command window
echo on

% True vector x
x = [-3.641; 0.7843]
xnrm = norm(x, inf)

% Approximation
xb = [-3.633; 0.7915]

% Error
xerr = x - xb

err_abs = norm(xerr, inf)
err_rel = norm(xerr, inf) / norm(x, inf)

% Function log gives log base e
% Function log2 gives log base 2
% Function log10 gives log base 10
k = -log10(err_rel)

echo off
