function [t, Y] = heun(f, t0, tmax, y0, N, ipr)
% [t, Y] = heun(f, t0, tmax, y0, N, ipr)
% MATH2089: File = heun.m
% Function to calulate Heun's method for the
% IVP y' = f(t, y) for t in [t0, tmax]
% with initial conditions y0 at t0
% and using N steps in t
% if ipr > 0 print a one line summary of each iteration

% Default value ipr = 0
if nargin < 6
    ipr = 0;
end;

% Interval width/step-size
h = (tmax - t0)/N;

% Force inital condition to be column vector
y0 = y0(:);
d = length(y0);

if ipr > 0 & d == 1
    fprintf('Heun''s method on [%.2f, %.2f], with y0 = %.4f,', t0, tmax, y0);
    fprintf(' N = %d, h = %.4f\n', N, h);
end;

% Storage for values
% Each row corresponds to a different initial conditon
% Each column corresponds to a different time point
Y = zeros(d, N+1);
t = [t0 : h : tmax];
Y(:,1) = y0;
for n = 1:N+1

    tn = t(n);
    yn = Y(:,n);
    fn = f(tn, yn);
    pn = yn + h*fn;
    cn = f(tn+h, pn);

    if ipr > 0 & d == 1
        fprintf('n = %3d, t_n = %5.2f, y_n = %12.4e, f_n = %12.4e\n', ...
            n-1, tn, yn, fn);
    end;

    if n > N, break; end;
    Y(:,n+1) = yn + (h/2)*(fn + cn);

end;