function f = mixfsol(t, x)
% f = mixfsol(t, x)
% MATH2089: File = mixfsol.m
% RHS function f for IVP x' = f(t, x)
% for chemical mixing problem
% -- Input Arguments --
% t = time (minutes)
% x = vector of three state variables for chemical concentrations
% -- Output Arguments --
% f = vector of three function values defining IVP
%
% This version defines problem data inside function
% Ref: Schilling and Harris, "Applied Numerical Methods for Engineers"

% Problem data
q = 10;         % Flow rate(input and output) (m^3/min)
V = 2;          % Volume (m^3)
alpha = 2.6;    % Reaction rate (m^3/moles-min)
u1 = 3.2;       % Input concentration chemical 1 (moles/m^3)
u2 = 4.8;       % Input concentration chemical 2 (moles/m^3)

r = alpha*x(1)*x(2);
tmp = q / V;

f = [ tmp*(u1 - x(1)) - r;
      tmp*(u2 - x(2)) - r;
      -tmp*x(3) + r];
      
