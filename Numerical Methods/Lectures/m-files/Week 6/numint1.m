% MATH2089: File = numint1.m
% Numerical integration of f(x) from a to b using different rules
% Trapezoidal rule which has error O(1/N^2)
% Simpson's rule which has error O(1/N^4)
% Gauss-Legendre rule is exact for polynomials of degree up to 2N-1
% Matlab's adaptive Simpson's rule (quad)
%
% Test integrals(6) and (7) from Laboratory added

format compact

%clear all, close all

% Number of subintervals = N, number of points = N+1
% N must be even for Simpson's rule
% Try N = 4, 8, 16, 32, 64 and see what happens to the error
N = 4;

% Select which test integral to do
% itst = 1 : f(x) = sin(x) on [a ,b]
% itst = 2 : standard normal probability density function on [a, b]
% itst = 3 : f(x) = sqrt(x) on [0, b]
% itst = 4 : f(x) = sqrt(|x - 1/4|) on [0, 1]
% itst = 5 : f(x) = exp(-x) sin(50 x) on [0, 2 pi]
% itst = 6 : f(x) = sin(x)^(1/3) on [0, 2]
% itst = 7 : f(x) = |cos(x)| on [0, pi]
itst = 7;
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
        a = -3; b = 0;
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

    case{6}

        % Integral 1 from Laboratory class
        fstr = 'sin(x)^{1/3}}';
        func = @(x) (sin(x)).^(1/3);
        a = 0; b = 2;
        Iex = 1.7183240160281406296;

    case{7}

        % Integral 2 from Laboratory class
        fstr = '|cos(x)|';
        func = @(x) abs(cos(x));
        a = 0; b = pi;
        Iex = 2;

    otherwise

        % Example not defined
        fprintf('\n ** Error: Example %d not defined\n', itst);

end;

% Number of points
h = (b-a) / N;            % Width of N equal width intervals

% Points nad values for plotting integrand
xplt = linspace(a, b, 1001);
fplt = func(xplt);
ylim = [0 (b-a)/N];
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
w = h*[1/2; ones(N-1,1); 1/2];
% Itrap = sum(w.*f);
Itrap = w'*f;
tc = cputime - t0;
Etrap = Iex - Itrap;
fprintf('Trapezoidal rule (vector): Q = %.10f, E = %10.2e', Itrap, Etrap);
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
plot(x, w, 'r*')
title('Equally spaced points and trapezoidal weights')
xlabel('x')
ylabel('w')
grid on
set(gca, 'Xlim', [a, b]);
%set(gca, 'Ylim', ylim);

% Simpson's rule: Vectorized version
% N must be even
t0 = cputime;
x = a + h*[0:N]';
f = func(x);
w = (h/3)*[1 2*(ones(1,N-1)+(mod([1:N-1],2)==1)) 1]';
%Isimp = sum(w.*f);
Isimp = w'*f;
tc = cputime - t0;
Esimp = Iex - Isimp;
fprintf('Simpson''s rule (vector):   Q = %.10f, E = %10.2e', Isimp, Esimp);
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
%set(gca, 'Ylim', ylim);

% Gauss-Legendre points and weghts (row vectors)
t0 = cputime;
[xgl, wgl] = gauleg(N, a, b);
fgl = func(xgl);
Igl = sum(wgl.*fgl);
%Igl = wgl * fgl';
tc = cputime - t0;
Egl = Iex - Igl;
fprintf('Gauss-Legendre rule:       Q = %.10f, E = %10.2e', Igl, Egl);
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
%set(gca, 'Ylim', ylim);

return

% Example using Matlab routine
figure(4)
tol = [1e-4 1e-12]; %[relative error, absolute error] tolerances
% For trace = 1 time taken is dominated by plots
trace = 1;
t0 = cputime;
[Iquad, nf] = quad(func, a, b, tol, trace);
tc = cputime - t0;
Equad = Iex - Iquad;
fprintf('Adaptive Simpson''s rule:   Q = %.10f, E = %10.2e', Iquad, Equad);
fprintf(', No. f evals = %d,  time = %.2f secs\n', nf, tc);
