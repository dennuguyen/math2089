% MATH2089: File = euler.m
% Euler's method to solve IVP y' = f(t, y)
% on the interval [t0, tmax] with
% initial conditions y(t0) = y0
% Requires exact solution yex(t) to calculate errors

format compact

% Select which example to run
ex = 1;
switch ex
    case {1}

        % Define function f using an anonymous function
        f = @(t, y) t + y
        fstr = 't + y';

        % Time interval
        t0 = 0, tmax = 1

        % Initial value at t0
        y0 = 1

        % Define exact solution for calculating errors
        yex = @(t) 2*exp(t) - 1 - t

    case{2}

        % Define function f using an anonymous function
        f = @(t, y) 1 ./(1 + t.^2) -2*y.^2
        fstr = '1/(1+t^2) -2 y^2';

        % Time interval
        t0 = 0, tmax = 1

        % Initial value at t0
        y0 = 0

        % Define exact solution for calculating errors
        yex = @(t) t./(1 + t.^2)
end;

% Set number of intervals N
N = 100

% Interval width/step-size
h = (tmax - t0)/N

% Storage for values
y = zeros(1,N+1);
t = [t0: h : tmax];
y(1) = y0;
for n = 1:N+1

    tn = t(n);
    yn = y(n);
    e(n) = yex(tn) - yn;
    fn = f(tn, yn);

    fprintf('n = %3d, t_n = %5.2f, y(t_n) = %8.4f, y_n = %8.4f, f_n = %8.4f, e_n = %11.2e\n', ...
        n-1, tn, yex(tn), yn, fn, e(n));

    if n > N, break; end;
    y(n+1) = yn + h*fn;

end;

emax = max(abs(e))

% Plot solution
tplt = linspace(t0, tmax, 401);
yplt = yex(tplt);
figure(1)
plot(tplt, yplt, '-', t, y, '*--');
grid on
xlabel('t')
ylabel('y(t)')
tstr= sprintf('Solution to IVP y'' = %s', fstr);
title(tstr)
legend( 'Exact solution', 'Approximation', ...
    'Location', 'NorthWest')

