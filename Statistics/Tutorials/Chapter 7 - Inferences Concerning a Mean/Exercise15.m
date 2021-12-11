% Exercise 15

load('Exercise15.mat')

% PART A
figure(1);
histogram(shearstrength, 10, 'Normalization', 'pdf');
% unimodal, fairly symmetrical


% PART B
figure(2);
qqplot(shearstrength);
% shearstrength sample data was selected from a normal distribution

% PART C
sigma = 350;
xbar = mean(shearstrength);
c = 0.95;
% Performing z-test
% h, p relevant to hypothesis test
% ci = confidence interval
%   x_bar +- z_1-alpha/2 * sigma/sqrt(n)
%   x_bar +- t_1-alpha/2,n-1 * s/sqrt(n)
[~, ~, ci_ztest] = ztest(shearstrength, xbar, sigma); ci_ztest
% true mean, mu, is with 95% confidence in the interval

% PART D
% If sigma is not known, then use t-test
s = std(shearstrength)
[~, ~, ci_ttest] = ttest(shearstrength, xbar); ci_ttest
% true mean, mu, is with 95% confidence in the interval