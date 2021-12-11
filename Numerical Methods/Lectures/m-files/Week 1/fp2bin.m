function b = fp2bin(x, maxlen);
% b = fp2bin(x, maxlen)
% Convert floating point number x to a binary string b
% Maximum length of binary string is maxlen
% Default value of maxlen is 52, as machine precision eps = 2^(-52)

if nargin < 2
    maxlen = -log2(eps);
elseif maxlen > 52
    fprintf('Warning: fp2bin, machine precision eps = 2^(-52)\n');
    fprintf('Results for maxlen = %d > 52 are not reliable\n', maxlen);
end;

if x > 0
    bs = '+';
else
    bs = '-';
    x  = abs(x);
end;
lb = 1;

% Calcualte integer part
xi = fix(x);
% calculate fraction part
%xf = x - xi;
xf = rem(x, 1);

% Convert integer part to a binary string
b = [];
lb = 0;
while xi > 0 & lb < maxlen

    xi2 = fix(xi/2);
    xr2 = xi - 2*xi2;

    if xr2 == 1
        str = '1';
    else
        str = '0';
    end;
    b = [str b];
    lb = lb + 1;
    
    xi = xi2;
    
end;
b = [bs b '.'];

% Convert fractional part to binary string
while xf > 0 & lb < maxlen

    xf = 2*xf;
    if xf >= 1
        str = '1';
        xf = xf - 1;
    else
        str = '0';
    end;
    b = [b str];
    lb = lb + 1;

end;

if lb >= maxlen
    fprintf('Warning: fp2bin, maximum length %d of output string exceeded\n', maxlen);
    fprintf('Input %.4e may not have a finite biary representation\n', x);
end;

