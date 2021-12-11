% Exericse 11
% presdat.txt

% PART A
US_Age = Age(strcmp(Country, 'US'));
Aust_Age = Age(strcmp(Country, 'Aust'));
US_mean = mean(US_Age)
Aust_Mean = mean(Aust_Age)
US_var = var(US_Age)
Aust_var = var(Aust_Age)
US_std = std(US_Age)
Aust_std = std(Aust_Age)
% US mean is higher than Aust mean of ages
% Aust variance is higher than US variance of ages

% PART B
group = [ones(size(US_Age)); 2*ones(size(Aust_Age))];
boxplot([US_Age; Aust_Age], group);

% PART C
US_summary = quantile(US_Age, 0:0.25:1)
Aust_summary = quantile(Aust_Age, 0:0.25:1)
US_iqr = US_summary(4) - US_summary(1)
Aust_iqr = Aust_summary(4) - Aust_summary(1)

% PART D
Name(US_Age == 70)

% PART E
% Australian Prime Ministers tend to be slightly younger than US Presidents
% at the time of election