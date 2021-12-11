f = @(x)exp(-x)-2*x;
i = 1;
while i < 5
    x(i+2) = x(i+1) - (f(x(i+1))*(x(i+1) - x(i)))/(f(x(i+1))-f(x(i)));
    i = i + 1;
end