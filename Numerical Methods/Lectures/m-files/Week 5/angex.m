% MATH2089: File = angex.m
% Inner (dot) product and angles between vectors

clear 
format compact

% Echo commands to command window
echo on

% Define column vectors
a = [3; 2; 4; 5]
b = [-2; 3; 0 ;2]
c = [1; 0; -2; 1]

% Calculate inner products
ab = a'*b
% OR ab = sum(a.*b)
% a and b are orthognal (perpendicular) to c <==>
% inner products of a and c, and b and c, are 0
ac = a'*c
bc = b'*c

% Angle between vectors a and b
% By default norm calculates 2-norm
cosang = ab / (norm(a)*norm(b))
ang = acos(cosang)

echo off