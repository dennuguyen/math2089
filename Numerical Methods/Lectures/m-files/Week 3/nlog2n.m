% MATH2089: File = nlog2n.m
% Solve n*log2(n) = const

% Clear all variables from workspace
clear all

% Specific value of constant and accurate solution
const = 100;
xs = 22.32008145851342354;
fprintf('Solving n*log2(n) = %.2e\n', const);
fprintf('Exact solution is xs = %.15e\n', xs);

% Fixed point iteration: x = g(x)
g = @(x) const*log(2)/log(x);
% Alternative fixed point iteration which does NOT converge
%g = @(x) exp( const*log(2)/x );

% Maximum number of iterations
kmax = 34;
% Requested tolerance in interates x
tolx = 10*eps;

fprintf('\n --- Fixed point iteration: g(x) = %.2f*log(2)/log(x) ---\n', const);
fprintf('\nRequested accuracy: tolx = %.2e\n', tolx);
fprintf('\n  k   x(k)                  x(k+1)-x(k)     e(k)\n');
k = 1;
converged = 0;
xk = const / 2;
while  k <= kmax & ~converged

    % Fixed point iteration
    xnew = g(xk);

    % Check convergence criteria
    xdiff = xnew - xk;
    if abs(xdiff) < tolx
        converged = 1;
    end;

    % Store for analysis, as normally you do not know solution xs
    XFP(k) = xk; EFP(k) = xs - xk;
    fprintf('%3d  %.14e  %12.3e %12.3e\n', k, xk, xdiff, EFP(k));

    % Next iterate
    xk = xnew;
    k = k + 1;

end;

% Plot iterates
figure(1)
plot(XFP, 'b.', 'MarkerSize', 18);
grid on;
ylim([15, 55])
xlabel('Iterations k')
title('Iterates x^{(k)},  Starting point x^{(1)} = 50')

% Rate of convergence
kk = length(EFP) - 1;
I = [1:kk];
ek = abs(EFP(I)); ek1 = abs(EFP(I+1));
rlin = ek1 ./ ek;
rqad = ek1 ./ ek.^2;
rcub = ek1 ./ ek.^3;
fprintf('\nRate of convergence\n');
fprintf(' k     e(k+1)/e(k)  e(k+1)/e(k)^2  e(k+1)/e(k)^3\n');
for k = 1:kk
    fprintf('%3d     %10.2e   %10.2e   %10.2e\n', k, rlin(k), rqad(k), rcub(k));
end;

% Solve equation f(x) = 0
%f = @(x) x.*log2(x) - const;
f = @(x) x.*log(x)/log(2) - const;
% Derivative of f
df = @(x) (log(x) + 1)/log(2);

% Maximum number of iterations
kmax = 6;
% Requested tolerance in x and f
tolx = 10*eps; 
tolf = 2*eps;

fprintf('\n --- Newton''s method: f(x) = x log(x)/log(2) - %.2f ---\n', const);
fprintf('\nRequested accuracy: tolx = %.2e, tolf = %.2e\n', tolx, tolf);
fprintf('\n  k   x(k)                   f(k)           df(k)      x(k+1)-x(k)     e(k)\n');
% Newtons method
k = 1;
converged = 0;
xk = const / 2;
while k <= kmax & ~converged

    % Newton iteration
    fk = f(xk);
    dfk = df(xk);
    xnew = xk - fk/dfk;

    % Check convergence criteria
    xdiff = xnew - xk;
    if abs(xdiff) < tolx & abs(fk) < tolf
        converged = 1;
    end

    % Store and print quantities for analysis
    X(k) = xk; F(k) = k; DF(k) = dfk; E(k) = xs - xk;
    fprintf('%3d  %.14e   %.6e   %.4e  %10.3e    %10.3e\n', ...
             k, xk, fk, dfk, xdiff, E(k));

    % Next iterate
    xk = xnew;
    k = k + 1;

end;

% Rate of convergence
kk = length(E) - 1;
I = [1:kk];
ek = abs(E(I)); ek1 = abs(E(I+1));
rlin = ek1 ./ ek;
rqad = ek1 ./ ek.^2;
rcub = ek1 ./ ek.^3;
fprintf('\nRate of convergence\n');
fprintf('  k    e(k+1)/e(k)  e(k+1)/e(k)^2  e(k+1)/e(k)^3\n');
for k = 1:kk
    fprintf('%3d     %10.2e   %10.2e   %10.2e\n', k, rlin(k), rqad(k), rcub(k));
end;

% Plot function and iterates
xplt = linspace(1, const, 4001);
fplt = f(xplt);
figure(2)
semilogx(xplt, fplt, XFP, f(XFP), 'mo', X, f(X), 'r*');
grid on
tstr = sprintf('f(x) = x*log2(x) - %.2e', const);
title(tstr);
legend('f(x)', 'Fixed point iteration', 'Newton''s method', ...
       'Location', 'NorthWest');
