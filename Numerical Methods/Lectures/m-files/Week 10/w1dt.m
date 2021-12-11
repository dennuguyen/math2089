% MATH2089: File = w1dt.m
% Solution of wave equation in 1 space variable and time
% using explicit method

format compact
clear all

fprintf('\nWave equation in 1 space variable and time\n');
mthd = 0;
mstr = 'explicit';
fprintf('using an %s method\n', mstr);

% Initial conditions u(x,0) = f(x) and u_t(x,0) = g(x)
ex = 1;
switch ex
    case {1}
        % Example 1: Vibrating string, fixed ends
        a = 0; b = 1;
        % Boundary values
        ua = 0; ub = 0;
        % Wavespeed: how quickly does wave move
        c = 2;
        % Time interval [0, T]
        %T = 1;   % Stable for n = 19, m = 80
        %T = 2;  % Just Stable for n = 19, m = 80
        T = 2.1;  % Unstable for n = 19, m = 80
        % Discretization
        n = 19; m = 80;
        % Initial displacement sin waves
        f = @(x) sin(pi*x) + sin(2*pi*x);
        % Initial velocity zero
        g = @(x) zeros(size(x));
        fprintf('Example 1: Two sin initial condition')
    case {2}
        % Example 2: Vibrating string, fixed ends
        a = 0; b = 1;
        % Wavespeed: how quickly does wave move
        c = 2;
        ua = 0; ub = 0;
        T = 2;
        % Discretization for T = 2 with finer space grid
        %n = 19; m = 100;
        %n = 29; m = 150;
        %n = 39; m = 200;
        n = 99; m = 400;
        % Initial displacement: piecewise linear
        f = @(x) x.*(x<=0.6) + (1.5-1.5*x).*(x>0.6);
        % Initial velocity zero
        g = @(x) zeros(size(x));
        fprintf('Example 2: Piecwise linear initial condition')
    case{3}
        % Example 3 -- Vibrating string, fixed ends
        a = 0; b = 1;
        % Wavespeed: how quickly does wave move
        c = 2;
        % Time horizon
        T = 2;
        % Boundary conditions
        ua = 0; ub = 0;
        % Discretization
        n = 4; m = 10;
        %n = 19; m = 80;
        % Double number of grid points, halve Dx, Dt
        %n = 39; m = 160;
        % Initial displacement: sin
        c1 = 1; c2 = 2;
        f = @(x) c1*sin(pi*x);
        % Initial velocity non-zero
        g = @(x) 2*pi*c2*sin(pi*x);
        % Exact solution
        uex = @(x,t) sin(pi*x).*(c1*cos(2*pi*t)+c2*sin(2*pi*t));
        fprintf('Example 3: sin initial condition with exact solution')
end;

% Discretization of space
% Number of space points is n+2 from
% a = x_0 < x_1 < ... < x_n < x_{n+1} = b
% As Matlab starts array indicies
Dx = (b-a) / (n+1);
x = linspace(a, b, n+2);
fprintf('Space interval = [%.4f, %.4f]\n', a, b);
fprintf('Space discretization: ');
fprintf('Number of points n+2, n = %d, Dx = %.2f\n', n, Dx);

% Discretization of time
% Number of time points is m+1 from 0 = t_0 < t_1 < ... < t_m = T
Dt = T / m;
t = linspace(0, T, m+1);
fprintf('Time interval = [0, %.4f]\n', T);
fprintf('Time discretization: ');
fprintf('Number of steps m = %d, Dt = %.4f\n', m, Dt);

% Plot grid points
figure(1)
axis([0 T a b])
grid on
set(gca, 'XTick', t)
set(gca, 'YTick', x)
hold on
lw = 4;
plot([0 0], [a b], 'b-', 'LineWidth', lw);
plot([0 T], [a a], 'g-', 'LineWidth', lw);
plot([0 T], [b b], 'g-', 'LineWidth', lw);
hold off
xlabel('Time t in [0, T]')
ylabel('Space x in [a, b]')
tstr1 = sprintf('Discretization of domain: n = %d, m = %d', n, m)
title(tstr1)

% Stability parameter for explicit central difference discretization
% of wave equation
r = c^2 * Dt^2 / Dx^2;
fprintf('Stability constant r = %.4f\n', r);

% Coefficient matrix for next time step as matrix multiplication
e = ones(n,1);
A = spdiags([r*e 2*(1-r)*e r*e], [-1 0 1], n, n);

% Force x to be a column vector
x = x(:);

% Storage for 3-D plot
U = zeros(n+2, m+1);

% Initial conditions for time 0
u = f(x);
% Force bounday conditions at t = 0
u(1) = ua; u(n+2) = ub;
% Store values
U(:,1) = u;
uold = u;

figure(2)
ph = plot(x, u);
if ex == 3
    umax = 2.5*max(abs(u));
else
    umax = 1.5*max(abs(u));
end;
ylim([-umax umax]);
grid on
xlabel('x')
ylabel('u(x, t)')
tstr = sprintf('Wave equation: %s method, r = %.2f', mstr, r);
title(tstr);
set(ph, 'EraseMode', 'xor');
tpos = [a + 0.71*(b-a) 0.86*umax];
th = text(tpos(1), tpos(2), 'Time = 0');
set(th, 'EraseMode', 'xor', 'FontWeight', 'Bold', 'Color', 'm', 'FontSize', 15)
disp('Press any key to continue ...'); pause;

% First time step using initial velocity g
u(2:n+1) = (r/2)*u(1:n)+(1-r)*u(2:n+1)+(r/2)*u(3:n+2) + Dt*g(x(2:n+1));
u(1) = ua; u(n+2) = ub;
U(:,2) = u;
unew = zeros(size(u));

% Time count
t0 = cputime;

% Time stepping loop
for j = 2:m

    % Time point
    tj = j*Dt;

    % Explicit method: second order time, second order space
    % Central difference in time, central difference in space
    % unew = A*u - uold
    unew(2:n+1) = r*u(1:n) + 2*(1-r)*u(2:n+1) + r*u(3:n+2) - uold(2:n+1);

    % Boundary conditions
    u(1) = ua; u(n+2) = ub;

    % Plot wave at time t
    %plot(x, u);
    set(ph, 'YData', u);
    str = ['Time = ' num2str(tj)];
    set(th, 'String', str);
    % MUST comment out pause for the cputime to make any sense!
    pause(0.05)

    U(:,j+1) = unew;

    % Store values for next time step
    uold = u;
    u = unew;

end;

tc = cputime - t0;
fprintf('CPU time for %s method = %.2f\n', mstr, tc);

figure(3)
mesh(t, x, U);
view(135,25);
xlabel('t')
ylabel('x')
zlabel('u(x, t)')
title(tstr);

% If exact solution defined, calculate and plot error
if exist('uex')
    [TG, XG] = meshgrid(t, x);
    Uex = uex(XG, TG);
    Uerr = Uex - U;
    emax = max(max(abs(Uerr)));
    fprintf('Maximum error = %.2e\n', emax);
    figure(4)
    mesh(t, x, Uerr);
    view(135,25);
    xlabel('t')
    ylabel('x')
    zlabel('Error in computed u(x, t)')
    tstr = sprintf('Error in wave equation: %s method, r = %.2f', mstr, r);
    title(tstr);
end;


