% Question 1

ti = 0:0.5:3;
yi = [1.2 1.5 1.9 2.4 3.2 4.3 5.4];
tdat = ti';
ydat = yi';
plot(tdat, ydat, 'k*');
hold on

% PART A
% Model 1: ydat = a + b*tdat

% PART I
% Using \ Operator
A1 = [ones(size(tdat)) tdat];
x1 = A1\ydat;
tplot = linspace(0, 3);
yplot1 = x1(1) + x1(2)*tplot;

% PART II
% Using Normal Equation A'y = A'Ax
AtA = A1'*A1;
x2 = inv(AtA)*A1'*ydat;
% This method has larger condition number due to transposing matrix

% PART III
% Using QR Factorisation
[Q, R] = qr(A1);
Y1 = Q(:,1:end);
R = R(1:end,1:end);
x3 = R \ (Y1'*ydat);

% PART IV
A1cond = cond(A1);
AtAcond = cond(AtA);
Qcond = cond(Q);
Rcond = cond(R);

r1 = A1*x1 - ydat;
r2 = A1*x2 - ydat;
r3 = A1*x3 - ydat;

% PART V
plot(tplot, yplot1, 'g');

% PART B
% Model 2: ydat = a + b*tdat + c*tdat^2
A2 = [ones(size(tdat)) tdat tdat.^2];
xq = A2\ydat;
yplotq = xq(1) + xq(2)*tplot + xq(3)*tplot.^2;
plot(tplot, yplotq, 'b');

% PART C
% Model 3: ydat = lambda*exp(mu*tdat)
%          ln(ydat) = ln(lambda) + mu*tdat

% PART I
A3 = [ones(size(tdat)) tdat];
param = A3\log(ydat);
x3 = [exp(param(1)); param(2)];

% PART II
yplot3 = x3(1) * exp(x3(2)*tplot);

% PART III
rexp = norm(A3*x3 - ydat);

% PART IV
plot(tplot, yplot3, 'r');

% Plotcc
legend('Location', 'northwest');
legend("Data", "Linear Approximation", "Quadratic Approximation", ...
    "Exponetial Approximation");
xlabel('t');
ylabel('y');
grid on;

hold off