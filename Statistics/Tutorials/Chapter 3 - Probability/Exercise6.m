% Exercise 6

% For 1000 tosses, a die gives a value from 1 to 6
S = randi([1, 6], 1000, 1);

% Event A
A = [2 4 6];
Probability_A = mean(ismember(S, A))

% Event B
B = [1 2 3 4];
Probability_B = mean(ismember(S, B))

% Event A and B
A_and_B = [2 4];
Probability_A_and_B_1 = mean(ismember(S, A_and_B))
Probability_A_and_B_2 = Probability_A * Probability_B

% Two Non Independent Events
C = [1 3 5];
D = [2 4 6];
Probability_C = mean(ismember(S, C));
Probability_D = mean(ismember(S, D));
Probability_C_and_D = Probability_C * Probability_D
% Probability of C and D = 0.25 != 0
% Mutually exclusive events cannot be independent