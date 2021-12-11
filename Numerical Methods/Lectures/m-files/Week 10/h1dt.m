% MATH2089: File = h1dt.m
% Solution of heat equation in 1 space variable and time
% using Explicit, Fully Implicit or Crank-Nicolson methods

format compact

% Select method:
% mthd = 0 for Explicit method;
% mthd = 1 for Fully Implicit method
% mthd = 2 for Crank-Nicolson
mthd = 1;

fprintf('\nHeat equation in 1 space variable and time\n');
if mthd == 0
   mstr = 'explicit';
elseif mthd == 1
   mstr = 'fully implicit';
elseif mthd == 2
   mstr = 'Crank-Nicolson';
else
   error(['Unknown method ' num2str(mthd) ' specified']);
end;
fprintf('using an %s method\n', mstr);

% Space interval [a, b]
a = 0; b = 1;
% Number of space points is n+2 from a = x_0 < x_1 < ... < x_n < x_{n+1} = b
%n = 9;
n = 19;
%n = 99;
fprintf('Space interval = [%.4f, %.4f]\n', a, b);
fprintf('Number of points in space discretiztion n+2, n = %d\n', n);

% Time interval [0, T]
%T = 10;  % Stable for n = 19, m = 80
T = 20;   % Unstable for n = 19, m = 80
% Number of time points is m+1 from 0 = t_0 < t_1 < ... < t_m = T
%m = 10;
m = 80;
%m = 200;
fprintf('Time interval = [0, %.4f]\n', T);
fprintf('Number of steps in time discretiztion m = %d\n', m);

% Diffusion constant: how quickly does heat move
D = 0.008;

% Discretization
Dx = (b-a) / (n+1);
x = linspace(a, b, n+2); % Only needed for plotting
Dt = T / m;
t = linspace(0, T, m+1); % Only needed for 3-D plot

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
plot([0 T], [b b], 'b-', 'LineWidth', lw);
hold off
xlabel('Time t in [0, T]')
ylabel('Space x in [a, b]')
title('Discretization of domain')

% Stability constant in discretization
s = D*Dt / Dx^2;
fprintf('Stability constant s = %.4f\n', s);

% Sparse linear system for temperature at next time step
if mthd == 1
   % Fully implicit method
   e = ones(n,1);
   A = spdiags([-s*e (1+2*s)*e -s*e], [-1 0 1], n, n);
elseif mthd == 2
   % Crank-Nicolson method
   e = ones(n,1);
   A = spdiags([(-s/2)*e (1+s)*e (-s/2)*e], [-1 0 1], n, n);
end;

% Initial condition
u = 20 + 80*sin(pi*(x-a)/(b-a));  % Single sinusoid
%u = 20 + 20*abs(sin(4*pi*(x-a)/(b-a))); % 4 caps

% Force u to be a column vector for implicit methods
u = u(:);

% Boundary conditions
ua = 20;
ub = 20;

% Force bounday conditions at t = 0
u(1) = ua;
u(n+2) = ub;

figure(2)
ph = plot(x, u);
grid
xlabel('x')
ylabel('u(x, t)')
tstr = sprintf('Heat equation: %s method, s = %.2f', mstr, s);
title(tstr);
set(ph, 'EraseMode', 'xor');
tpos = [a + 0.7*(b-a) 0.92*max(u)];
th = text(tpos(1), tpos(2), 'Time = 0');
set(th, 'EraseMode', 'xor', 'FontWeight', 'Bold', 'Color', 'm', 'FontSize', 15)
disp('Press any key to continue ...'); pause;

% Storage for 3-D plot
U = zeros(n+2, m+1);
U(:,1) = u;  % Initial condition

% Time count
t0 = cputime;

% Time stepping loop
for j = 1:m
   
   % Time point
   tj = j*Dt;
   
   % Implicit or explicit method
   if mthd == 0
      % Explicit method: first order time, second order space
      % forward difference in time, central difference in space
      u(2:n+1) = s*u(1:n) + (1-2*s)*u(2:n+1) + s*u(3:n+2);
   elseif mthd == 1
      % Fully implicit method: first order in time, second order in space
      % Set up right-hand-side of linear system
      b = u(2:n+1);
      b(1) = b(1) + s*ua;
      b(n) = b(n) + s*ub;
      % Solve tridiagonal linear system for internal nodes
      u(2:n+1) = A \ b;
   elseif mthd == 2
      % Crank-Nicolson method: second order in time and space
      % Set up right-hand-side of linear system
      b = (s/2)*u(1:n) + (1-s)*u(2:n+1) + (s/2)*u(3:n+2);
      b(1) = b(1) + (s/2)*ua;
      b(n) = b(n) + (s/2)*ub;
      % Solve tridiagonal linear system for internal nodes
      u(2:n+1) = A \ b;
   end;

   % Boundary conditions
   u(1) = ua; u(n+2) = ub;
   
   % Plot temperature
   %plot(x, u);
   set(ph, 'YData', u);
   str = ['Time = ' num2str(tj)];
   set(th, 'String', str);
   % MUST comment out pause for the cputime to make any sense!
   pause(0.05)
   
   U(:,j+1) = u;
   
end;

tc = cputime - t0;
fprintf('CPU time for %s method = %.2f\n', mstr, tc);

figure(3)
mesh(t, x, U);
shading interp
view(135,25);
xlabel('t')
ylabel('x')
zlabel('u(x, t)')
title(tstr);
