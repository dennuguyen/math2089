% MATH2089 -- File = taylor2.m
% Plot Taylor approximations to log(1+h) about h = 0

% Equally spaced points on [-1, 1], so 1+h is on [0, 2]
h = linspace(-1, 1, 401);

% Exact function values
f = log(1+h);

% Taylor approximations
f0 = zeros(size(h));
f1 = h;
f2 = f1 - h.^2/2;
f3 = f2 + h.^3/3;
f4 = f3 - h.^4/4;
f5 = f4 + h.^5/5;

figure(1)
plot(h, f, h, f0, h, f1, h, f2, h, f3, h, f4, h, f5);
grid on
xlabel('h')
title('Taylor approximations to log(1+h)')
legend('log(1+h)', 'Zero order', 'First order', 'Second order', ...
       'Third order', 'Fourth order', 'Fifth order', 'Location', 'SouthEast')
