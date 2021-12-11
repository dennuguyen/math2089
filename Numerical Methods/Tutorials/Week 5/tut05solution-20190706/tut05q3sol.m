% MATH2089: File = tut05q3sol.m
% Numerical Methods - Norms, Inverses, Condition Numbers and LU factorization

format compact

% Define the matrix A
A = [ 0  3 -2
     -1 -4  2
      5 14 26]   
  
%B = inv(A)
% Provided B is the inverse of A, as AB = I = BA
B = [ -11/8   -53/48    -1/48    
        3/8    5/48      1/48    
       1/16    5/32     1/32]
E = A*B - eye(3)
Enrm1 = norm(E, 1)

% 1-norm is maximum of column sums of absolute values
Anrm1 = norm(A, 1)
AInrm1 = norm(B, 1)
kappa1 = Anrm1 * AInrm1
kappa1_chk = cond(A, 1)

% Infinity-norm is maximum of row sums of absolute values
Anrmi = norm(A, Inf)
AInrmi = norm(B, Inf)
kappai = Anrmi * AInrmi
kappai_chk = cond(A, Inf)

% Eigenvalues of inv(A) are 1/(eigenvlaues of A)
Aev = eig(A)
AIev = eig(B)
AIev_chk = 1./Aev

% Calcualte largest magnitude eigenvalue / smallest magnitude eigenvalue
evmaxmin = max(abs(Aev)) / min(abs(Aev))

% 2-norm of A is square root of largest eigenvalue of A'*A
% 2-norm of inv(A) is 1 over square root of smallest eigenvalue of A'*A
ATA = A'*A
% Sort eigenvalues in descending order: largest first, smallest last
ev = sort(eig(ATA), 'descend')
Anrm2 = sqrt(ev(1))
Anrm2_chk = norm(A, 2)
AInrm2 = 1/sqrt(ev(end))
AInrm2_chk = norm(B, 2)
kappa2 = sqrt(ev(1)/ev(end))
kappa2_chk = cond(A,2)
% NB As A is NOT symmetric, this is NOT the same as evmaxmin

% Row operations to get LU factorization
% Re-0rder rows to get a non-zero pivot element and store in U
p = [2 1 3]
P = eye(3); P = P(p,:)
U = A(p, :)
% U(2,1) is already zero
% Make U(3,1) zero by subtracting a multiple of row 1
L31 = U(3,1)/U(1,1)
U(3,:) = U(3,:) - L31*U(1,:)
% Make U(3,2) zero by subtracting a multiple of row 2
L32 = U(3,2)/U(2,2)
U(3,:) = U(3,:) - L32*U(2,:)
% U is now upper triangular (row-echelon form)
L = eye(3);
L(3,1) = L31;
L(3,2) = L32
% Check
LUchk = P*A - L*U


% LU factroization: see help lu
% Is this the same permutation matrix P as above?
[L, U, P] = lu(A)
E = P*A - L*U
% Default norm is the 2-norm
Enrm = norm(E)
