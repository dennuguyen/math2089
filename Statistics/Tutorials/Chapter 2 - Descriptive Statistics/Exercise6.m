% Exercise 6

density = [5.50 5.30 5.47 5.10 5.29 5.65 5.55 5.61 5.75 5.63 5.27 5.44 5.57 5.36 4.88 5.86 5.34 5.39 5.34 5.53 5.29 4.07 5.85 5.46 5.42 5.79 5.62 5.58 5.26]

% PART A
densityMean = mean(density)
densitySTD = std(density)
densityMedian = median(density)

% PART B
fiveNumberSummary = quantile(density, 0:0.25:1);
iqr = fiveNumberSummary(4) - fiveNumberSummary(2)
density > fiveNumberSummary(4) + 1.5*iqr
density < fiveNumberSummary(2) - 1.5*iqr

% PART C
boxplot(density)

% PART D
%