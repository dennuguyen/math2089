% MATH2089: File = numint.m
% Numerical integration of f(x) from a to b using different rules
% Trapezoidal rule which has error O(1/N^2)
% Simpson's rule which has error O(1/N^4)
% Gauss-Legendre rule is exact for polynomials of degree up to 2N-1
% Matlab's adaptive Simpson's rule (quad)

format compact

%clear all, close all

% Number of subintervals = N, number of points = N+1
% N must be even for Simpson's rule
% Try N = 4, 8, 16, 32, 64 and see what happens to the error
N = 8;

% Select which test integral to do
% itst = 1 : f(x) = sin(x) on [a ,b]
% itst = 2 : standard normal probability density function on [a, b]
% itst = 3 : f(x) = sqrt(x) on [0, b]
% itst = 4 : f(x) = sqrt(|x - 1/4|) on [0, 1] 
% itst = 5 : f(x) = exp(-x) sin(50 x) on [0, 2 pi] 
itst = 2;
switch itst

case {1}

   % Integrand, interval of integration and exact integral
   % Sin(x) is infinitely differentiable, well approximated by polynomials
   fstr = 'sin(x)';
   func = @(x) sin(x);
   a = 0; b = pi/2;
   Iex = -(cos(b)-cos(a));

case{2}

   % Integrand, interval of integration and exact integral
   % Standard normal density function (mean 0, variance 1)
   % f(x) = (1/sqrt(2*pi))*exp(-(x^2)/2)
   fstr = '(1/sqrt(2*pi))*exp(-(x.^2)/2)';
   func = @(x) (1/sqrt(2*pi))*exp(-(x.^2)/2);
   %a = -8; b = 0; Iex = 1/2;
   %a = -3; b = 0;
   a = -2; b = 3;
   Iex = normcdf(b) - normcdf(a); % Requires normcdf from Statistics toolbox

case{3}

   % Integrand, interval of integration and exact integral
   % Sqrt(x) has a derivative singularity at x = 0;
   fstr = 'sqrt(x)';
   func = @(x) sqrt(x);
   a = 0; b = 1;
   Iex = 2/3;

case{4}

   % Integrand, interval of integration and exact integral
   % Derivative singularity at x = 1/4, in the interior of integration interval
   fstr = 'sqrt(abs(x-1/4))';
   func = @(x) sqrt(abs(x-1/4));
   a = 0; b = 1;
   Iex = (2/3)*((1/4)^(3/2)+(3/4)^(3/2));

case{5}

   % Integrand, interval of integration and exact integral
   % Highly oscillatory integral with 100 zeros in interval of integration
   fstr = 'exp(-x).*sin(50*x)';
   func = @(x) exp(-x).*sin(50*x);
   a = 0; b = 2*pi;
   Iex = 0.019954559278;  % See Atkinson, Introduction to Numerical Analysis

otherwise

   % Example not defined
   fprintf('\n ** Error: Example %d not defined\n', itst);

end;

% Number of points
h = (b-a) / N;            % Width of N equal width intervals

% Points nad values for plotting integrand
xplt = linspace(a, b, 1001);
fplt = func(xplt);
yl = [0 (b-a)/N];
fprintf('\nIntegrating %s on [%.4f, %.4f] using N = %d\n', fstr, a, b, N);

% Trapezoidal rule:  Sequential version with explicit loop
t0 = cputime;
Itraps = func(a)/2;
for i = 1:N-1
   z = a + i*h;
   Itraps = Itraps + func(z);
end
Itraps = Itraps + func(b)/2;
Itraps = h*Itraps;
tc = cputime - t0;
Etraps = Iex - Itraps;
fprintf('Trapezoidal rule (serial): Q = %.10f, E = %10.2e', Itraps, Etraps);
fprintf(', time = %.2f secs\n', tc);
%whos                      % List current storage

% Trapezoidal rule: Vectorised version
% using 2 vectors x and f of length N+1
t0 = cputime;
x = a + h*[0:N]';
f = func(x);
wt = h*[1/2; ones(N-1,1); 1/2];
%Qtrap = wt'*f;
Qtrap = sum(wt.*f);
tc = cputime - t0;
Etrap = Iex - Qtrap;
fprintf('Trapezoidal rule (vector): Q = %.10f, E = %10.2e', Qtrap, Etrap);
fprintf(', time = %.2f secs\n', tc);
figure(1)
subplot(2,1,1)
plot(xplt, fplt, x, f, 'r*')
title(['Trapezoidal rule with ' num2str(N+1) ' points'])
xlabel('x')
ylabel('f(x)')
grid on
set(gca, 'Xlim', [a, b]);
subplot(2,1,2)
plot(x, wt, 'r*')
title('Equally spaced points and trapezoidal weights')
xlabel('x')
ylabel('w')
grid on
set(gca, 'Xlim', [a, b]);
%set(gca, 'YLimm', yl);

% Simpson's rule: Vectorized version
% N must be even
t0 = cputime;
x = a + h*[0:N]';
f = func(x);
w = (h/3)*[1 2*(ones(1,N-1)+(mod([1:N-1],2)==1)) 1]';
Qsimp = sum(w.*f);
%Qsimp = w'*f;
tc = cputime - t0;
Esimp = Iex - Qsimp;
fprintf('Simpson''s rule (vector):   Q = %.10f, E = %10.2e', Qsimp, Esimp);
fprintf(', time = %.2f secs\n', tc);
figure(2)
subplot(2,1,1)
plot(xplt, fplt, x, f, 'r*')
title(['Simpson''s rule with ' num2str(N+1) ' points'])
xlabel('x')
ylabel('f(x)')
grid on
set(gca, 'Xlim', [a, b]);
subplot(2,1,2)
plot(x, w, 'r*')
title('Equally spaced points and Simpson''s weights')
xlabel('x')
ylabel('w')
grid on
set(gca, 'Xlim', [a, b]);
%set(gca, 'Ylim', yl);

% Gauss-Legendre points and weghts (row vectors)
t0 = cputime;
[xgl, wgl] = gauleg(N, a, b);
fgl = func(xgl);
Qgl = sum(wgl.*fgl);
%Qgl = wgl * fgl';
tc = cputime - t0;
Egl = Iex - Qgl;
fprintf('Gauss-Legendre rule:       Q = %.10f, E = %10.2e', Qgl, Egl);
fprintf(', time = %.2f secs\n', tc);
figure(3)
subplot(2,1,1)
plot(xplt, fplt, xgl, fgl, 'r*')
title(['Gauss-Legendre rule with ' num2str(N) ' points'])
xlabel('x')
ylabel('f(x)')
grid on
set(gca, 'Xlim', [a, b]);
subplot(2,1,2)
plot(xgl, wgl, 'r*')
title('Gauss-Legendre points and weights')
xlabel('x')
ylabel('w')
grid on
set(gca, 'Xlim', [a, b]);
%set(gca, 'Ylim', yl);

return

% Example using Matlab routine
tol = [];     % default tolerance 1e-6
%tol = 1e-10; % absolute error tolerances
% For trace = 1 output nf, a b-a, Q
trace = 1;
t0 = cputime;
[Iquad, nf] = quad(func, a, b, tol, trace);
tc = cputime - t0;
Equad = Iex - Iquad;
fprintf('Adaptive Simpson''s rule:   Q = %.10f, E = %10.2e', Iquad, Equad);
fprintf(', No. f evals = %d,  time = %.2f secs\n', nf, tc);
