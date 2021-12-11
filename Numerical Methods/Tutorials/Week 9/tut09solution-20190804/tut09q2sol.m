% MATH2089: File = tut09q2sol.m
% Integrands for Tutorial Week 9, Question 2

% Part a)
a = 0; b = 2;
f1 = @(x) sin(x).^(1/3);
df1 = @(x) cos(x) ./ (3*sin(x).^(2/3));

figure(1)
x = linspace(a, b, 501);
f = f1(x);
df = df1(x);
subplot(2, 1, 1)
plot(x, f);
grid on
title('Integrand f(x)')
ylim([0 1.1])
subplot(2, 1, 2)
plot(x, df);
grid on
title('Derivative f''(x)')

% Part b)
a = 0; b = pi;
f2 = @(x) abs(cos(x));
df2 = @(x) sign(cos(x)).* (-sin(x));

figure(2)
x = linspace(a, b, 501);
f = f2(x);
df = df2(x);
subplot(2, 1, 1)
plot(x, f);
grid on
title('Integrand f(x)')
xlim([a b]);
ylim([0 1.1]);
subplot(2, 1, 2)
plot(x, df);
grid on
title('Derivative f''(x)')
xlim([a b]);
ylim([-1.1 1.1]);