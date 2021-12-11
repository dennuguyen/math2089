% Question 2

% integral of sin(x)^(1/3) dx from 0 to 2
% difficult integral: derivative of integrand goes to infinity at 0 (unbounded derivatives)
%                     f'(x) = cos(x)/(3*sin(x)^2/3) -> 1/(3*x^(2/3)) -> infinity
% remedy: use taylor polynomial => O(h)
%         let x = y^2, dx = 2y dy to outgrow denominator
%         f'(y) = 4*y^2/(3*(y^2)^(2/3) = 4/3 * y^(4/3) -> 0         

% integral of |cos(x)| dx from 0 to pi
% difficult integral: discontinuity at 0
% remedy: split integral into cos(x) and - cos(x) to remove discontinuity in f'(x)