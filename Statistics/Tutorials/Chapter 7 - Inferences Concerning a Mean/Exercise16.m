% Exercise 16

% PART A
mu = 20;
sigma = 5;
N = 36;
C = normrnd(mu, sigma, 36, 500);


% PART B
c = 0.95;
alpha = 1 - c;

% PART I
meanC = mean(C);

% PART II
sC = std(C);

% PART III
upz = meanC + 1.96 * sigma/sqrt(N);

% PART IV
lowz = meanC - 1.96 * sigma/sqrt(N);

% z-confidence interval
ciz = [lowz, upz];


% PART V
upt = meanC + 1.96 * sC/sqrt(N);

% PART VI
lowt = meanC - 1.96 * sC/sqrt(N);

% t-confidence interval
cit = [lowt, upt];


% PART C
number_mut = sum((lowt <= 20).*(20 <= upt))
number_muz = sum((lowz <= 20).*(20 <= upz))

% PART D
percentage_mut = sum(number_mut)/500
percentage_muz = sum(number_muz)/500