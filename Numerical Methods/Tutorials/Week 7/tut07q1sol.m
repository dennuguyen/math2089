% MATH2089: File = tut07q1sol.m
% Solutions to Numerical Methods laboratory Week 7, Question 1
% Least squares fit by linear, quadratic and exponential

close all
clear
format compact
format long

% Define data
tdat = [0:0.5:3];
ydat = [1.2 1.5 1.9 2.4 3.2 4.3 5.4];

% Force data to be column vectors (could also use transpose)
tdat = tdat(:);
ydat = ydat(:);

% Plot data
figure(1)
plot(tdat, ydat, 'r*');
grid on
xlabel('t')
ylabel('y')

% Define the coefficient matrix A
A = [ones(size(tdat)) tdat];
% Number of data points and number of variables
[m, n] = size(A)

% Solve least squares problem using \ operator
fprintf('Solution using backslash\n');
x1 = A \ ydat
Acnd = cond(A)
r1 = A*x1 - ydat;
% By default norm calculates 2-norm
r1norm = norm(r1)

% Solve least square problem using normal equations
fprintf('Solution using normal equations\n');
B = A'*A;
x2 = B \ (A'*ydat)
ATAcnd = cond(B)
r2 = A*x2 - ydat;
r2norm = norm(r2)

% Solve least squares problem using QR factorization
fprintf('Solution using QR factorization\n');
[Q, R] = qr(A);
Y = Q(:,1:n);
R = R(1:n,1:n);
x3 = R \ (Y'*ydat)
% Condition number of orthogonal matrix is 1
Qcnd = cond(Q)
Rcnd = cond(R)
r3 = A*x3 - ydat;
r3norm = norm(r3)

% All three methods are essentially equivalent here as cond(A) is small
% Note that cond(R) = cond(A) and cond(ATA) = cond(A)^2
alpha = x1(1)
beta = x1(2)

% Add linear approximation to plot
hold on
plot(tdat, alpha + beta*tdat, 'b-');
hold off

% Fit a quadratic function y = a0 + a1*t + a2*t^2 to data
fprintf('Approximating data by quadratic\n')
AQ = [ones(m,1) tdat tdat.^2];
xq = AQ \ ydat
rq = AQ*xq - ydat;
rqnorm = norm(rq)

% Add quadratic approximation to plot using find grid of points
tp = linspace(min(tdat), max(tdat), 1001);
yq = xq(1) + xq(2)*tp + xq(3)*tp.^2;
hold on
plot(tp, yq, 'm-.');
hold off

% Fit exponential function z = lambda*exp(mu*t)
% Taking log (base e) of both sides gives
% log(z) = log(lambda) + mu*t = log(y)
% Thus parameters are  x = [log(lambda) mu]
% Coefficient matrix is the same, but lambda = exp(x(1)), mu = x(2)
fprintf('Approximating data by exponential\n')
x = A \ log(ydat)
lambda = exp(x(1))
mu = x(2)

% Residuals and their 2-norm
rlog = lambda*exp(mu*tdat) - ydat;
rlognorm = norm(rlog)

% Add to plot
hold on
plot(tp, lambda*exp(mu*tp), 'k--');
hold off
title('Data, linear, quadratic and exponential approximations')
legend('Data', 'Linear approximation', 'Quadratic approximation', ...
       'Exponential approximation', 'Location', 'NorthWest')
