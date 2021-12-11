% MATH2089: File = west.m
% Example of fill-in with west0479 matrix

format compact

% Matrix west0479 from Chemical Engineering application
load west0479
A = west0479;
clear west0479;

b = [1:size(A,1)]';

% non-zero elements
figure(1)
subplot(2,2,1)
spy(A)
title('west0479')

% LU factorization
disp('LU factorization with partial pivoting')
t0 = cputime;
[L, U, P] = lu(A);
tf = cputime - t0;
L = tril(L, 0);  
chk = norm(P*A-L*U, inf);
fprintf('LU factorization check: || PA - LU ||_inf = %.2e\n', chk);

subplot(2,2,2)
spy(L)
title('L')

subplot(2,2,3)
spy(U)
title('U')

subplot(2,2,4)
spy(inv(A))
title('A^{-1}')

figure(2)
spy(P,6)
title('Permutationa matrix from LU factorization of west0479')
% Check P is a permutation matrix: P'*P = I
Pchk = norm(P'*P-speye(size(P)), inf);
fprintf('Permuation matrix check: || P^T P - I ||_inf = %.2e\n', Pchk);

% Time solving A*x = b
t0 = cputime;
%x = A \ b;
x = U \ (L \ P*b);
tc = cputime - t0;
xnrm = norm(x, inf);
rnrm = norm(A*x - b, inf);
fprintf('No explicit reordering: ');
fprintf('||x||_inf = %.2e, ||r||_inf = %.2e\n', xnrm, rnrm);
fprintf('Solution time = %.2f secs\n', tc);

disp('Press any key to continue'); pause;

% Reverse Cuthill-McKee ordering: bring non-zeros close to main diagonal
disp('LU factorization after Reverse Cuthill-McKee reordering')
p = symrcm(A);
Arcm = A(p,p);
figure(3)
subplot(2,2,1)
spy(Arcm);
title('RCM reordering of west0479')

[Lrcm, Urcm, Prcm] = lu(Arcm);
Lrcm = tril(Lrcm, 0);  
chkrcm = norm(Prcm*Arcm-Lrcm*Urcm, inf);
fprintf('LU factorization check: || PA - LU ||_inf = %.2e\n', chkrcm);

subplot(2,2,2)
spy(Lrcm)
title('L from RCM')

subplot(2,2,3)
spy(Urcm)
title('U from RCM reordering')

subplot(2,2,4)
spy(inv(Arcm));
title('A^{-1} from RCM')

% Time solving RCM reordered A*x = b
% Variables xrcm = x(p) as columns/variables reordered
t0 = cputime;
%xrcm = Arcm \ brcm;
brcm = b(p);
xrcm = Urcm \ (Lrcm \ Prcm*brcm);
tc = cputime - t0;
xnrm = norm(xrcm - x(p), inf);
rnrm = norm(Arcm*xrcm - brcm, inf);
fprintf('Symmetric RCM reordering: ');
fprintf('||xrcm - x(q)||_inf = %.2e, ||r||_inf = %.2e\n', xnrm, rnrm);
fprintf('Solution time = %.2f secs\n', tc);

disp('Press any key to continue'); pause;

% Adaptive Minimum Degree reordering: sparse LU factorization
disp('LU factorization after column adaptive minimum degree reordering')
q = colamd(A);
Aamd = A(:,q);

figure(4)
subplot(2,2,1)
spy(Aamd);
title('COLAMD reordering of west0479')

[Lamd, Uamd, Pamd] = lu(Aamd);
Lamd = tril(Lamd, 0);
chkamd = norm(Pamd*Aamd-Lamd*Uamd, inf);
fprintf('LU factorization check: || PA - LU ||_inf = %.2e\n', chkamd);

subplot(2,2,2)
spy(Lamd)
title('L from COLAMD reordering')

subplot(2,2,3)
spy(Uamd)
title('U from COLAMD reordering')

subplot(2,2,4)
spy(inv(Aamd));
title('A^{-1} from COLAMD reordering')

% Time solving AMD reordered A*x = b
% For column reordering don't reorder rows/equations/RSH
% Variables xrcm = x(p) as columns/variables reordered
bamd = b;
t0 = cputime;
%xamd = Aamd \ bamd;
xamd = Uamd \ (Lamd \ Pamd*bamd);
tc = cputime - t0;
xnrm = norm(xamd - x(q), inf);
rnrm = norm(Aamd*xamd - bamd, inf);
fprintf('Column AMD reordering: ');
fprintf('||xamd - x(q)||_inf = %.2e, ||r||_inf = %.2e\n', xnrm, rnrm);
fprintf('Solution time = %.2f secs\n', tc);

% Plots for PDF lecture notes
figure(4)
subplot(2,4,1)
spy(A)
title('A from west0479')
subplot(2,4,2)
spy(P)
title('P')
subplot(2,4,3)
spy(L)
title('L')
subplot(2,4,4)
spy(U)
title('U')
subplot(2,4,5)
spy(Aamd)
title('A colamd reordering')
subplot(2,4,6)
spy(Pamd)
title('P colamd reordering')
subplot(2,4,7)
spy(Lamd)
title('L colamd reordering')
subplot(2,4,8)
spy(Uamd)
title('U colamd reordering')
pos = [400 500 1000 450];
set(4, 'Position', pos);
set(4, 'PaperPositionMode', 'Auto')