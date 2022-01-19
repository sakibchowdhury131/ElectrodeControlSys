f = @(x,y) sin(2*pi*x.*y)-sqrt(2)*(pi^2)*(x.^2).*(y.^2);
range = [1e-5 10e-4 1 10000];
fimplicit(f, range)