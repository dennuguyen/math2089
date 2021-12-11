% MATH2089: File = lap2d.m
% Discretizattion of Laplacian in two dimensions
% producing a sparse linear systme of equations

format compact

% Discretization: m + 1 intervals in x, n + 1 intervals in y
%m = 5; n = 3;
%m = 12; n = 10;
m = 20; n = 40;
mn = m * n;
fprintf('\nLaplace equation on a rectangular domain\n');
fprintf('Number of intervals in x direction = %d', m+1);
fprintf(' (%d points incuding boundaries)\n', m+2);
fprintf('Number of intervals in y direction = %d', n+1);
fprintf(' (%d points incuding boundaries)\n', n+2);
fprintf('Total number of variables (internal grid points) = %d\n', mn);

figure(1)
clf
gpts = [0, m+1, 0, n+1];
axis(gpts)
axis('square')
hold on
ph = plot([0, 0, m+1, m+1, 0], [0, n+1, n+1, 0, 0], 'LineWidth', 2);
set(gca, 'XTick', [0:m+1]);
set(gca, 'YTick', [0:n+1]);
grid;
t = sprintf('Grid for %d by %d discretization', m, n);
title(t);
xlabel('x')
ylabel('y', 'Rotation', 0)
axis equal
set(gca, 'XLim', [-0.5 m+1.5]);
set(gca, 'YLim', [-0.5 n+1.5]);

hold on
sz = 20;
% Shifts for 5-point stencil centred at grid point (i,j)
xdv = [-1 0 0 0 1]; ydv = [0 -1 0 1 0];
if m >= 10 & n >= 10
    plot(1+xdv, 1+ydv, 'r.', 'MarkerSize' ,sz)
    %plot(3+xdv, 2+ydv, 'm.', 'MarkerSize' ,sz)
    plot(6+xdv, 1+ydv, 'r.', 'MarkerSize' ,sz)
    plot(m+xdv, 1+ydv, 'r.', 'MarkerSize' ,sz)
    plot(1+xdv, 5+ydv, 'r.', 'MarkerSize' ,sz)
    plot(6+xdv, 5+ydv, 'r.', 'MarkerSize' ,sz)
    plot(m+xdv, 5+ydv, 'r.', 'MarkerSize' ,sz)
    plot(1+xdv, n+ydv, 'r.', 'MarkerSize' ,sz)
    plot(6+xdv, n+ydv, 'r.', 'MarkerSize' ,sz)
    plot(m+xdv, n+ydv, 'r.', 'MarkerSize' ,sz)
else
    plot(1+xdv, 1+ydv, 'r.', 'MarkerSize' ,sz)
    plot(4+xdv, 2+ydv, 'r.', 'MarkerSize' ,sz)
end
hold off


% Sparse diagonal setup for row ordering of variables
t0 = cputime;
e = ones(mn,1);
em1 = e;
em1([m:m:mn]) = zeros(n,1);
ep1 = e;
ep1([1:m:mn]) = zeros(n,1);
dp = [-m, -1, 0, 1, m];
A = spdiags([-e,-em1,4*e,-ep1,-e], dp, mn, mn);
tA = cputime - t0;
fprintf('Time for sparse diagonal setup = %.2f secs\n', tA);

% Block diagonal setup for row ordering of variables
tA1 = cputime;
B = spdiags([-e 4*e -e], [-1 0 1], m, m);
D = -speye(m, m);
A1 = sparse(mn, mn); % Sparse mn by mn matrix of all zeros
J = [1:m];
A1(J,J) = B;
A1(J,m+J) = D;
for j = 2:n-1
    J = [(j-1)*m+1:j*m];
    A1(J,J-m) = D;
    A1(J,J) = B;
    A1(J,J+m) = D;
end;
J = [(n-1)*m+1:mn];
A1(J,J-m) = D;
A1(J,J) = B;
tA1 = cputime - t0;
fprintf('Time for block tridiagonal setup = %.2f secs\n', tA1);
A1chk = norm(A-A1, inf);

% Non-zero elements in A
figure(2)
spy(A)
title(['Discretization of Lapalacian on ' num2str(m) ' by ' num2str(n) ' grid']);
hold on
plot(m*[1; 1]*[1:n-1]+0.5, [0; m*n+1]*ones(1,n-1), 'k:')
plot([0; m*n+1]*ones(1,n-1), m*[1; 1]*[1:n-1]+0.5, 'k:')
hold off