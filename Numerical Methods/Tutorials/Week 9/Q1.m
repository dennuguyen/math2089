% Question 1

% PART A
f = @(x) 1./x;
I_exact = log(2);

% PART B

interval = [1 2];
h = 1/8;
x = interval(1):h:interval(2);
N = (interval(2) - interval(1))/h;

% Trapezoidal Rule
% Linear Interpolant
% error = O(h^2)
% I_trap = h*(0.5*f(x(1)) + sum(f(x(2:N))) + 0.5*f(x(N+1)));
w_trap = h*[0.5 ones(1, N-1) 0.5]; % Weights Vector
I_trap = w_trap * f(x') % Vector Product Form
E_trap = abs(I_exact - I_trap)

% % Simpson's Rule
% Quadratic Interpolant
% error = O(h^4)
w_simp = (h/3)*[1 2*ones(1,N-1) 1]; w_simp(2:2:N) = 4*h/3;
I_simp = w_simp * f(x')
E_simp = abs(I_exact - I_simp)

% PART C
[x_gauleg, w_gauleg] = gauleg(4, interval(1), interval(2))
scatter(x_gauleg, w_gauleg);
I_gauleg = sum(w_gauleg.*f(x_gauleg))
E_gauleg = abs(I_exact - I_gauleg)

% PART D
% Gaussian-Legendre Quadrature gives better estimate
% Quadrature Gauss + Legendre (orthongonal polynomial of choice)
% Gauss Polynomials are exact to degree 2*N-1 polynomials
% Where N = number of points

% PART E
% f(x)^(k) -> (-1)^k * (k!)/x^k
% |f(x)^(k)| <= k!
% 
% Trapezoidal:
% |E(f)_N| <= h^2/12 * 2| ~10^-3
% 
% Simpson's:
% |E(f)_N| <= h^4/180 * 4| ~10^-5
% 
% Gauss-Legendre:
% |E(f)_N| <= e_N/(2*N)! * (2*w)!
%           = 2^(2*N+1)*(N!)^4 / ((2*N+1)*(2*N!)^2)
%           = 2^(2*4+1)*(4!)^4 / ((2*4+1)*(2*4!)^2)
%           = 0*(10^-2)