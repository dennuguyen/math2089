% Exercise 13

N = 100;

% PART A
B = binornd(1, 0.5, 100, 500);      % Bernoulli Distribution

% PART B
meanB = mean(B);

% PART C
% Mean is expected to be 0.5
% Variance is expected to be 0
mu = mean(meanB)
variance = var(meanB)

% PART D
% random variable has the normal distribution due to large sample size of 100 (>30)
% Central Limit Theorem:
%   - Population distribution is approximately normal if sample size is large
%   - mean of sample = mean of population
%   - standard error = (xbar - mu)/sigma/sqrt(N)
%   - normal population suggests sample means will have normal distribution (inedependent of N)
figure(1);
histogram(meanB, 10, 'Normalization', 'pdf');

% PART E
figure(2);
histfit(meanB, 10, 'normal');
% The normal distribution curve fits the data but not very well