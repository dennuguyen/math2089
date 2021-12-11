% MATH2089 -- File = taylor1.m
% Plot Taylor approximations to exp(-x) about x = 0

% Equally spaced points on [-1, 1]
h = linspace(-1, 1, 401);

% Exact function values
f = exp(-h);

% Taylor approximations
f0 = ones(size(h));
f1 = f0 - h;
f2 = f1 + h.^2/2;
f3 = f2 - h.^3/6;

figure(1)
plot(h,f,h,f1)
%plot(h, f, h, f0, h, f1, h, f2, h, f3);
grid on
xlabel('x')
title('Taylor approximations to e^{-x} about x = 0')
legend('exp(-x)', 'Zero order', 'First order', 'Second order', ...
       'Third order')
%       'Third order', 'Fourth order', 'Fifth order', 'Location', 'SouthEast')
