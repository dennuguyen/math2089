% Q2

% PART A
0.75 * 0.2 - 0.15
% ans = 2.7756e-17 != 0

% PART B
floor(6/1)
floor(0.6/0.1)

% PART C
h = 1e-14
100 + h - 100
% ans = 1.4211e-14 != h

% PART D
h = 1e-15
100 + h - 100
% ans = 0 != h because numbering system is quantised and h is too small

% PART E
eps
realmax
realmin

% PART F
eps
1 + eps > 1
1 + eps/2 > 1
% eps/2 rounds to 0
% numbering system quantisation is not equally spaced
% machine precision is eps which is between 1 and next available number