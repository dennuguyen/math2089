% MATH2089: File = tut05q1sol.m

format compact

alpha = log(4)/5;
%alpha = 0.3
%alpha = 0.25
f = @(t, alpha) exp(alpha*t) -2*sin(pi*t);
df = @(t, alpha) alpha*exp(alpha*t) - (2*pi)*cos(pi*t);

% Interval [0, 1/3]
a = 0, fa = f(a, alpha)
b = 1/3, fb = f(b, alpha)

% Plot
tplt = linspace(a, b, 201);
fplt = f(tplt, alpha);
dfplt = df(tplt, alpha);
figure(1)
subplot(2,1,1);
plot(tplt, fplt); 
grid on
xlim([a b]);
title('f(t) = exp(alpha t) - 2 sin(\pi t), alpha = log(4)/5');
subplot(2,1,2)
plot(tplt, dfplt);
grid on
xlabel('t')
xlim([a b])
title('Derivative f''(t)');

ts = 5/2
fs = f(ts, alpha)
dfs = df(ts, alpha)
a = 2.4, fa = f(a, alpha)
b = 2.6, fb = f(b, alpha)

tplt = linspace(a, b, 401);
fplt = f(tplt, alpha);
dfplt = df(tplt, alpha);
figure(2)
subplot(2,1,1);
plot(tplt, fplt); 
grid on
xlim([a b]);
title(['f(t) = exp(alpha t) - 2 sin(\pi t), alpha = ' num2str(alpha)]);
subplot(2,1,2)
plot(tplt, dfplt);
grid on
xlabel('t')
xlim([a b])
title('Derivative f''(t)');
