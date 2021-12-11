% Q3

% PART A
syms a b c;
r1 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
r2 = (-b - sqrt(b^2 - 4*a*c))/(2*a);
R1 = 2*c/(-b - sqrt(b^2 - 4*a*c));
R2 = 2*c/(-b + sqrt(b^2 - 4*a*c));
isAlways(r1 == R1)
isAlways(r2 == R2)

% PART B
% r1 avoids catastrophic cancellation when b < 0
% r2 avoids catastrophic cancellation when b > 0