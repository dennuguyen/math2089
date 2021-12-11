% suppose A is given. There are 10^6 input vectors b_k 
% find x_k = A\b_k

N = 10^6;
A = [1 2 4 5 6;
     2 5 6 7 9;
     4 6 4 5 1;
     5 7 5 2 4;
     6 9 1 4 4];
tic
for counter=1:N
  b = rand(5,1);
  x = A\b;
end
toc

tic
[L,U,P] = lu(A); % PA = LU
for counter=1:N
  b = rand(5,1);
  y =L\(P*b);   %  Ly = P*b
  x = U\y;      %  Ux = y;  
end
toc
