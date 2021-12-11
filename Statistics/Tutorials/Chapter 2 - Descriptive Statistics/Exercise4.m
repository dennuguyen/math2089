% Exercise 4
% inflows.txt

MPa = [22.4 40.4 16.4 73.7 36.6 109.9 30.0 4.4 33.1 66.7 81.5];

% PART A
FiveNumberSummary = quantile(MPa, 0:0.25:1)

% PART B
IQR = FiveNumberSummary(4) - FiveNumberSummary(2)
MPa > FiveNumberSummary(4) + 1.5 * IQR
MPa < FiveNumberSummary(2) - 1.5 * IQR
% No outliers

% PART C
boxplot(MPa)

% PART D
Mean = mean(MPa)
STD = std(MPa)

% PART E
% By how much can the max value be decreased without affecting the IQR