% MATH2089
% Setup, solve and plot solution for chemical mixing problem
% Ref: Schilling and Harris, "Applied Numerical Methods for Engineers"
% Requires function mixfsol to specify RHS of system of ODEs
% x' = f(t, x) describing mixing process

format compact

% Define function using anonymous function with two input arguments
% For all variableswhich are NOT arguments the current value is used
% Problem data
q = 10;         % Flow rate(input and output) (m^3/min)
V = 2;          % Volume (m^3)
alpha = 2.6;    % Reaction rate (m^3/moles-min)
u1 = 3.2;       % Input concentration chemical 1 (moles/m^3)
u2 = 4.8;       % Input concentration chemical 2 (moles/m^3)
tmp = q / V;    % Temporary variable used in anonymous function

% Define anonymous function for r
r = @(x) alpha*x(1)*x(2);

% Define anonymous function fanon instead of mixfsol
% Note that fanon is a function handle
fanon = @(t, x) [ tmp*(u1 - x(1)) - r(x);
                  tmp*(u2 - x(2)) - r(x);
                 -tmp*x(3) + r(x)];

% Time interval
t0 = 0
tmax= 1.2

% Initial conditions y0 at t0 (column vector)
y0 = [5; 3; 0]

% Number of time steps for RK4, Heun and Euler
N = 100;
ipr = 1;

% Call solver of your choice
% At first just use Matlab's ode45 solver
% Note the different syntax for the first argument to the ODE solver
% First argument must specify the function for RHS of ODE x' = f(t,
% x)
solver = 1
switch solver 
    case {1}
        % -- Matlab's ODE45 solver --
        %[ts, ys] = ode45(@mixfsol, [t0, tmax], y0);
        [ts, ys] = ode45(fanon, [t0, tmax], y0);
        fprintf('Using ODE solver ode45 with default accuracy\n')
    case {2}
        % -- Euler's method from lectures --
        % Requires eulerf.m from course web page
        [ts, ys] = eulerf(@mixfsol, t0, tmax, y0, N, ipr);
        %[ts, ys] = eulerf(fanon, t0, tmax, y0, N, ipr);
        fprintf('Using ODE solver eulerf with %d time steps\n', N)
    case {3}
        % -- Heun's method from lectures --
        % Requires heunf.m from course web page
        [ts, ys] = heunf(@mixfsol, t0, tmax, y0, N, ipr);
        %[ts, ys] = heunf(fanon, t0, tmax, y0, N, ipr);
        fprintf('Using ODE solver heunf with %d time steps\n', N)
    case {4}
        % -- Runge-Kutta RK4 solver from lectures --
        % Requires rk4.m from course web pages
        [ts, ys] = rk4(@mixfsol, t0, tmax, y0, N, ipr);
        [ts, ys] = rk4(fanon, t0, tmax, y0, N, ipr);     
        fprintf('Using ODE solver rk4 with %d time steps\n', N)
end;

% Number of time intervals
N1 = numel(ts) - 1;

% Size of outputs ts, ys and variable class for fanon, r
%size_ts = size(ts)
%size_ys = size(ys)
whos

% Plot solution: ys array with three columns so get three plots
figure(1)
plot(ts, ys);
xlim([t0 tmax])
grid on
xlabel('Time t (mins)')
ylabel('State variables x(t) (moles/m^3)')
title('Chemical mixing problem')
legend('Concentration of Chemical 1', 'Concentration of Chemical 2', ...
    'Concentration of Product', 'Location', 'North')

% Plot time steps
% Equally spaced time steps lie along blue line
figure(2)
plot([0:N1], ts, 'm*', [0 N1], [t0, tmax], 'b-')
xlim([0 N1])
grid on
title('Time steps')
legend('Time steps used', 'Equally spaced', ...
    'location', 'NorthWest')
