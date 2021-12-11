function [t, Y] = rk4(f, t0, tmax, y0, N, ipr)
% [t, Y] = rk4(f, t0, tmax, y0, N, ipr)
% MATH2089: File = rk4.m
% Runge Kutta method rk4 with
% c = [0,1/2,1/2,1]
% b = [1/6, 1/3, 1/3, 1/6]
% A = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0].
% Hence the iteration is given by
%
% K1 = f(t(n), y(n))
% K2 = f(t(n) + (h/2), y(n) + (h/2) K1)
% K3 = f(t(n) + (h/2), y(n) + (h/2) K2)
% K4 = f(t(n) + h,   y(n) + h K3)
%
% y(n+1) = y(n) + (h/6) [K1 + 2 K2 + 2 K3 + K4]

% Default ipr = 0
if nargin < 6
    ipr = 0;
end;

% Calculate stepsize for equally spaced nodes
h = (tmax - t0)/N;
t = [t0:h:tmax];

% Force initial conditions to be a column vector
y0 = y0(:);
d = length(y0);

% Storage for calculated solution
% Each row corresponds to a different initial conditon
% Each column corresponds to a different time point
Y = zeros(d, N+1);

Y(:,1) = y0;
for n = 1:N

    tn = t(n);
    yn = Y(:,n);
    K1 = f(tn, yn);
    K2 = f(tn + h/2, yn + (h/2)*K1);
    K3 = f(tn + h/2, yn + (h/2)*K2);
    K4 = f(tn + h,   yn + h*K3);
    Y(:,n+1) = yn + (h/6) * (K1 + 2*K2 + 2*K3 + K4);

    if ipr > 0 & d == 1
        fprintf('n = %2d, t_n = %4.2f, y_n = %12.4e', n-1, tn, yn);
        fprintf(', K1 = %12.4e, K2 = %12.4e, K3 = %12.4e, K4 = %12.4e\n', ...
            K1, K2, K3, K4);
    end;

end
if ipr > 0 & d == 1
    fprintf('n = %2d, t_n = %4.2f, y_n = %12.4e\n', n, t(N+1), Y(:,N+1));
end;

