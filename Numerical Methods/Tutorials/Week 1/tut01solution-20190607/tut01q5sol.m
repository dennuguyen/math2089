% MATH2089: File = tut01q5sol.m
% Numerical Methods Laboratory Week 01
% Question 5 solutions
%
% Effect of initial condition on recurrence for
% Jn = integral from 0 to 1 of x^n * exp(x-1)
%
% Jn is integral of a non-negative function so Jn > 0 all n

clear
format compact
format long
echo off

% Number of terms to evaluate
% After a few terms error in 6 decimal digit approximation
% to exp(-1) shows up, but not in full double precision values
nmax = 10;
% After enough terms even error in double precision (15 decimal digits)
% evaluation of exp(-1) causes problems
%nmax = 20;

% Recurrence using approximate starting value for e^{-1}
Ja1 = 0.367879
Ja(1) = Ja1;
for n = 2:nmax
   Ja(n) = 1 - n*Ja(n-1);
end;
Ja
figure(1)
plot(Ja, 'r*')
grid on
xlabel('n')
ylabel('J(n)')
title('Recurrence J(n) = 1 - n*J(n-1), J(1) = 0.367879')
xlim([0 nmax+1]);

% Recurrence using accurate starting value for e^{-1}
J1 = exp(-1)
J(1) = J1;
for n = 2:nmax
   J(n) = 1 - n*J(n-1);
end;
J
figure(2)
plot(J, 'bd')
grid on
xlabel('n')
ylabel('J(n)')
title('Recurrence J(n) = 1 - n*J(n-1), J(1) = e^{-1}')
xlim([0 nmax+1]);
