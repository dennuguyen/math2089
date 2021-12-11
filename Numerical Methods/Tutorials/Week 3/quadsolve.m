function [r1, r2] = quadsolve(a, b, c)

% MATH2089: File = quadsolve.m
% [r1, r2] = quadsolve(a, b, c);
% Calculate the roots r1, r2 of the quadratic a*x^2 + b*x + c
% in a numerically stable way.
% Assumes a, b, c are real and a is non-zero.

% For the quadratic equation a*x^2 + b*x + c = 0 
% the product of the roots is r1*r2 = c/a
% This could also be used to get r2 from r1.

disc = b^2 - 4*a*c;
if disc < 0
    % Complex roots: Matlab does complex arithmetic
    r1 = (-b + sqrt(disc))/(2*a);
    r2 = c/(a*r1);
elseif disc == 0
    % Double real root
    r1 = -b/(2*a);
    r2 = -b/(2*a);
else
    % Distinct real roots    
    % Avoid cancellation of nearly equal numbers
    if b >= 0
        r1 = 2*c/(-b - sqrt(disc));
        r2 = c/(a*r1);
    else 
        r1 = 2*c/(-b + sqrt(disc));
        r2 = c/(a*r1);
    end;
end;
