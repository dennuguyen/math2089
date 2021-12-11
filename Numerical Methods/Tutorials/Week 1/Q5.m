% Q5

% PART A
J(1) = 0.367879;
for n = 2:10
    J(n) = 1 - n*J(n-1);
end

J(10)

% PART B
J(1) = exp(-1);
for n = 2:10
    J(n) = 1 - n*J(n-1);
end

J(10)