% Exercise 4

% PART A
rainfall = rain(:, 1);
runoff = rain(:, 2);

% PART B
scatter(rainfall, runoff);
xlabel("rainfall");
ylabel("runoff");

% Regression Line
% y = b(1) + b(2)*x;

% PART C
lsline;

% PART D
y = fitlm(rainfall, runoff, 'linear');

% PART I
% Equation
Y = @(X) -327.12 + 0.91946*X;

% PART II
% Root Mean Squared Error estimates Standard Deviation of Error Distribution 
% Sigma = 86.7

% PART III
% Hypothesis Test
alpha = 0.05
reject = ttest(rainfall, 'alpha', alpha)
% ?????????????????????????????????

% PART IV
Y(1)

% PART V
CI = coefCI(y)

% PART VI
