
f = @(x) (x-1).^3;
df = @(x) 3*(x-1).^2;

xk = 2;

for k = 1:20
    
    fk = f(xk);
    dfk = df(xk);
    
    fprintf('%3d  %.12f  %.12f  %.12f \n', k, xk, fk, dfk);
    X(k) = xk;
    
    xk = xk - fk/dfk;
    
    
end;