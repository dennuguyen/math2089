% MATH2089: File = tut03q3sol.m
% Solution to Week 03 Laboratory, Question 3
% Test function quadsolve to find roots of a quadratic
% in a numerically stable way;

% Example i)
a = 1; b = 3; c = 2;
[r1, r2] = quadsolve(a, b, c);
fprintf('\nTest i)\n')
fprintf('Roots of %.2f x^2 + %.2f x + %.2f are %.12e and %.12e\n', ...
     a, b, c, r1, r2);
 chk1 = a*r1.^2 + b*r1 + c;
 chk2 = a*r2.^2 + b*r2 + c;
 fprintf('Values of quadratic at roots are %.4e and %.4e\n', chk1, chk2);
  
% Example ii)
a = 0.01; b = 2000; c = -0.001;
[r1, r2] = quadsolve(a, b, c);
fprintf('\nTest ii)\n')
fprintf('Roots of %.2f x^2 + %.2f x + %.2f are %.12e and %.12e\n', ...
     a, b, c, r1, r2);
 chk1 = a*r1.^2 + b*r1 + c;
 chk2 = a*r2.^2 + b*r2 + c;
 fprintf('Values of quadratic at roots are %.4e and %.4e\n', chk1, chk2);
 
% Example iii)
a = 1; b = 0; c = -1;
[r1, r2] = quadsolve(a, b, c);
fprintf('\nTest iii)\n')
fprintf('Roots of %.2f x^2 + %.2f x + %.2f are %.12e and %.12e\n', ...
     a, b, c, r1, r2);
chk1 = a*r1.^2 + b*r1 + c;
chk2 = a*r2.^2 + b*r2 + c;
fprintf('Values of quadratic at roots are %.4e and %.4e\n', chk1, chk2);
 
% Example iv)
a = 1; b = -4; c = 4;
[r1, r2] = quadsolve(a, b, c);
fprintf('\nTest iv)\n')
fprintf('Roots of %.2f x^2 + %.2f x + %.2f are %.12e and %.12e\n', ...
     a, b, c, r1, r2);
chk1 = a*r1.^2 + b*r1 + c;
chk2 = a*r2.^2 + b*r2 + c;
fprintf('Values of quadratic at roots are %.4e and %.4e\n', chk1, chk2);
 
% Example v)
a = 1; b = 200; c = -0.000015;
[r1, r2] = quadsolve(a, b, c);
fprintf('\nTest v)\n')
fprintf('Roots of %.2f x^2 + %.2f x + %.6f are %.12e and %.12e\n', ...
     a, b, c, r1, r2);
chk1 = a*r1.^2 + b*r1 + c;
chk2 = a*r2.^2 + b*r2 + c;
fprintf('Values of quadratic at roots are %.4e and %.4e\n', chk1, chk2);

% Example vi)
a = 1; b = 2; c = 4;
[r1, r2] = quadsolve(a, b, c);
fprintf('\nTest vi) Complex roots\n')
fprintf('Roots of %.2f x^2 + %.2f x + %.2f are\n', a, b, c);
r1, r2
chk1 = a*r1.^2 + b*r1 + c;
chk2 = a*r2.^2 + b*r2 + c;
fprintf('Values of quadratic at roots are %.4e and %.4e\n', abs(chk1), abs(chk2));

