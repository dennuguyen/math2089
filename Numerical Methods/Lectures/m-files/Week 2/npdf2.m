% Set default values for input arguments
if nargin < 3
    sigma = 1;
end;
if nargin < 2
    mu = 0;
end;

% Use local variables to evaluate function
const = 1/(sigma*sqrt(2*pi));
z = x - mu;
var = sigma^2;
f = const*exp(-z.^2/(2*var));

% If function is called with two output arguments also calculate derivative
if nargout > 1
    df = -(z/var).*f;
else
    df = [];
end;
