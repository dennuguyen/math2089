% Exercise 12
% crash.txt

% PART A
Chest_Mean = mean(Chest)
Chest_Variance = var(Chest)
Chest_StandardDeviation = std(Chest)
Chest_FiveNumberSummary = quantile(Chest, 0:0.25:1)

Chest_OverSixtyProportion = sum(Chest >= 60)/length(Chest)

a1 = figure
histogram(Chest, round(sqrt(length(Chest))), 'Normalization', 'pdf')
ylabel('Density');
xlabel('Chest Deceleration (g)');
title('Chest Injury');
% Number of classes is the closest integer to the square root of the number
% of observations.
% Slightly right skewed

a2 = figure
histogram(Chest, 6, 'Normalization', 'pdf')
ylabel('Density');
xlabel('Chest Deceleration (g)');
title('Chest Injury');
% Not enough information about actual data

a3 = figure
histogram(Chest, 25, 'Normalization', 'pdf')
ylabel('Density');
xlabel('Chest Deceleration (g)');
title('Chest Injury');
% Difficult to discern pattern with 25 classes

% PART B
close(a1, a2, a3)
b1 = figure
boxplot(Chest, Airbag)
% Airbags are more likely to prevent chest injury
% Chest injuries with airbags have smaller spread
% Chest injuries without airbags have an outlier
% Both have right skewness where chest injuries with airbags have a longer
% skew

% PART C
c1 = figure
boxplot(Chest, Doors)
% The greater the number of doors, the greater the chest deceleration
% Two-door vehicles are least likely to have severe injuries
% Smaller vehicles have less momentum thus less impulse

% PART D
d1 = figure
boxplot(Weight, Doors)
% The greater the number of doors, the greater the weight of the car,
% the more force acting upon the chest in a change of momentum
% which results in greater chest injury