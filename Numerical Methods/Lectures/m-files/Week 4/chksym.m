function sym = chksym(A)
% sym = chksym(A)
% MATH2089: File = chksym.n
% If A is symmetric return true (1), otherwise false (0)

[m, n] = size(A);
tol = 100*max(m,n)*eps;

if m == n
    sym = norm(A-A',1) < tol;
else
    sym = 0;
end;