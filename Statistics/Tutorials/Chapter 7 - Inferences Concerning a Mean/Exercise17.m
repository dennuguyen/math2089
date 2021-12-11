% Exercise 17

load('Exercise17.mat')
N = 18;

% PART A
figure(1);
histogram(porevolume, 5, 'Normalization', 'pdf');

figure(2);
histfit(porevolume, 5, 'normal');

figure(3);
qqplot(porevolume);
% sample data is slightly left-skewed so is not normal

% PART B
c1 = 0.98;
alpha1 = 1 - c1;
% Use t-test because sample data is less than 30 and sigma is not known
[~, ~, ci1] = ttest(porevolume, mean(porevolume), alpha1)

% PART C
c2 = 0.95;
alpha2 = 1 - c2;
[~, ~, ci2] = ttest(porevolume, mean(porevolume), alpha2)
% 95% confidence interval has smaller interval than 98%

close all