% Exercise 6

% PART A
A = [3 -2; 0 -4]
Ans1 = A == 0
Ans2 = max(abs(A)) == 0
Ans3 = max(max(abs(A))) == 0
Ans4 = norm(A, 1) == 0

B = [3 0 -4; 0 0 -4; 1 0 0]
Ans1 = B == 0
Ans2 = max(abs(B)) == 0
Ans3 = max(max(abs(B))) == 0
Ans4 = norm(B, 1) == 0

% PART B
C = eps * randn(4, 4)
norm(C, 1) == 0

% PART C
% Test if two matrices are equal:
% norm(B - C , 1) == 0
% With tolerance:
% tau = 10 * eps * max([norm(B, 1), norm(C, 1), 1]);
% check = norm(B - C, 1) <= tau