% MATH2089: File = caellifit.m
% Fit Caelli data

format compact

gauss = @(t, pm, pv) exp( -pv*(t - pm).^2 );

load caelli.dat
tdat = caelli(:,1);
ydat = caelli(:,2);

alpha = 0.76
pv1 = 0.86; pv2 = 1.41; pv3 = 4.77;
pm1 = 2.41; pm2 = 4.57; pm3 = 5.67;
A = [exp(-alpha*tdat) gauss(tdat, pm1, pv1) ...
     gauss(tdat, pm2, pv2) gauss(tdat, pm3, pv3)];
szA =  size(A)
x = A \ ydat

tlo = min(tdat); thi = max(tdat);
tplt = linspace(tlo, thi, 501);
yplt = x(1)*exp(-alpha*tplt) + x(2)*gauss(tplt, pm1, pv1) + ...
       x(3)*gauss(tplt, pm2, pv2) + x(4)*gauss(tplt, pm3, pv3);
figure(1)
plot(tdat, ydat, 'r*', tplt, yplt)
grid on
xlabel('t')
title('Caelli data')
legend('Data', 'Linear least squares')