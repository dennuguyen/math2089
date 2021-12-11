% MATH2089: File = tut03q1sol.m
% Solution to Week 03 Laboratory, Question 1
% Define anonymous function ad use it to create plots
% A better version would define variables a, b for the interval[a, b]
% and np1 and np2 for the numbers of points
% The tricky part is to get the plot title to use these variables

format compact

% Define anonymous function myf
% Note use of .^ to get elementwise powers for a vector x
myf = @(x) exp(-x.^2)

% Vector of plot points. Don't forget the semi-colon to suppress output
x = linspace(-3, 3, 21);

% Plot function
% Note the piecewise linear nature around 0 when it should be smooth
figure(1)
plot(x, myf(x));
grid on
xlabel('x')
title('Plot of e^{-x^2} using 21 points')

% Plot using more points
x = linspace(-3, 3, 101);
figure(2)
plot(x, myf(x));
grid on
xlabel('x')
title('Plot of e^{-x^2} using 101 points')

