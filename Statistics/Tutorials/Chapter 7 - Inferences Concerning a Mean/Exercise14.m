% Exercise 14

load('Exercise14.mat')
N = 101;

% PART A

% PART I
figure(1);
histogram(kevlar90, 10,'Normalization', 'pdf');
% Unimodal, extremely right-skewed
% Better fit for exponential distribution than normal distribution

% PART II
xbar = mean(kevlar90)

% PART III
% pdf = @(x) 1/mu * exp(-x/mu);
mu = xbar;
Y = exppdf(kevlar90, mu);

% PART IV
figure(2)
histfit(kevlar90, 10, 'exponential');

% PART B

% PART I
T = exprnd(mu, 10, 1000);

% PART II
meanT = mean(T);

% PART III
% The mean is expected to be mu = 1.0239 and variance to be 0
muT = mean(meanT)
varT = var(meanT)

% PART IV
% Sampling distribution is expected to be normal distribution as by the
% Central Limit Theorem; as the sample size is large
figure(3)
histogram(meanT, 10, 'Normalization', 'pdf');
% Unimodal, slightly right-skewed

% PART V
figure(4)
histfit(meanT, 10, 'normal');

% PART C
S = exprnd(mu, 500, 1000);
meanS = mean(S);
muS = mean(meanS)
varS = var(meanS)
figure(5)
histogram(meanS, 10, 'Normalization', 'pdf');
% With a larger sample size, muS is closer to mu than muT
% From histogram, sample is better approximated by the normal distribution