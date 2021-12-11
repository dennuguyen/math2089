% MATH2089: File = ex00.m
% Run the file by typing its name 'ex00' in a Matlab command window
% Soon you will understand the commands used here
% Try using the mouse to rotate your view of the plot or zoom in

xl = [-4 4]; nx = 81;
yl = [-4 4]; ny = 81;

x = linspace(xl(1), xl(2), nx);
y = linspace(yl(1), yl(2), ny);

[X, Y] = meshgrid(x, y);

R = X.^2 + Y.^2;
c1 = pi/sqrt(5);
F = exp(-R/2).*cos(c1*R);

figure(1)
surf(x, y, F);
xlabel('x');
ylabel('y');
title(['exp( -(x^2+y^2)/2 ) cos( c_1 (x^2+y^2) ), c_1 = ' num2str(c1)]);
shading interp