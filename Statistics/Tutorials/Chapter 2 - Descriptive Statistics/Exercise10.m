% Exercise 10

% PART A
figure1 = figure
histogram(Inflow)
xlabel('Inflow');
ylabel('Frequency');
title('Annual maximum flood peak inflows to Hardap Dam');

% PART B
figure2 = figure
histogram(log(Inflow))
xlabel('log(Inflow)');
ylabel('Frequency');
title('Annual maximum flood peak inflows to Hardap Dam');

% PART C
skewness(Inflow) % 2.9253, right-skewed
skewness(log(Inflow)) % -0.0105, left-skewed close to symmetrical

% PART D
sort(round(log(Inflow)*10)/10)

% PART E

% PART F
Mean = mean(Inflow)
Variance = var(Inflow)
STD = std(Inflow)
Quartiles = quantile(Inflow, 0:0.25:1)

% PART G
figure3 = figure
histogram(Inflow, 5, 'Normalization', 'pdf')
xlabel('Inflow');
ylabel('Density');
title('Annual maximum flood peak inflows to Hardap Dam');
% Density histogram has an area of 1

% PART H
figure4 = figure
histogram(Inflow, 50, 'Normalization', 'pdf')
xlabel('Inflow');
ylabel('Density');
title('Annual maximum flood peak inflows to Hardap Dam');
% Too few classes means loss in information
% Too many classes means the less discernible the pattern of frequencies

% PART I
figure5 = figure
edges = [0 500 1500 3000 6500]; 
histogram(Inflow, edges, 'Normalization', 'pdf')
xlabel('Inflow');
ylabel('Density');
title('Annual maximum flood peak inflows to Hardap Dam');

% PART J
Mean
Median = median(Inflow)
% From figure5, mean > median because of right skewness

% PART K
close(figure4, figure5)
figure6 = figure
histogram(Inflow, 2:10)
xlabel('Inflow');
ylabel('Frequency');
title('Annual maximum flood peak inflows to Hardap Dam');