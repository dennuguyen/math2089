% testing the function tridiag defined in tridiag.m
a = [-2 -1 0 1]; % the lower diagonal
b = [1 2 2 4 1]; % the diagonal
c = [6 4 8 6];   % the upper diagonal

%the 3 vectors a,b,c define the following tri-diagonal marix 
% .     A = [ 1  6  0  0  0;
%            -2  2  4  0  0;
%             0 -1  2  8  0;
%             0  0  0  4  6;
%             0  0  0  1  1];
%    
% define the right-hand side
d = [8 16 32 32 8];
% solving the linear system A*x = d
x = tridiag(a,b,c,d)
% the function tridiag has two stages
% Stage 1: Gaussian elimination
%   reduces the matrix [A|d] to 
% .    [1  6  0   0  0  |  8
%         14  4   0  0 .|  32
%            16/7 8  0  |  240/7
%                 4  6  |  32
%                   -1/2|  0
% Stage 2: Back-substitution
% x(5) = 0
% x(4) = (32 - 6*x(5))/4 = 8
% x(3) = (240/7 - 8*x(4))*7/16 = -13
% x(2) = .... = 6
% x(1) = .... = -28