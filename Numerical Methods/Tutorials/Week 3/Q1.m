% Q1

% PART A
myf = @(x) exp(-x.^2)

% PART B
x1 = linspace(-3, 3, 21)

% PART C
figure(1)
plot(x1, myf(x1))
xlabel('x')
title('Plot of e^{-x^2} using 21 points')

% PART D
x2 = linspace(-3, 3, 101);
figure(2)
plot(x2, myf(x2))
xlabel('x')
title('Plot of e^{-x^2} using 101 points')

close(1, 2)