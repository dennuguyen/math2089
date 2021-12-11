% MATH2089: File = npdfex.m
% Anonymous function for normal PDF
npdf = @(x, mu, sig) (1/(sig*sqrt(2*pi)))*exp(-(x-mu).^2/(2*sig^2))

% Usage to plot normal PDF
figure(1)
x = linspace(-10,10,1001);
f = npdf(x, 1, 3);
plot(x, f);
grid on
title('Plot of bell shaped curve')