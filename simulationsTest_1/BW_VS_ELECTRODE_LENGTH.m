% relation obtained --> sin(2piafxc) = root(2)*pi^2*a^2*fxc^2
% where electrode length = a 
% and cutoff frequency = fxc 
% range of a = 0.1mm to 5mm [Let]
% range of fxc = 0 to 500 Hz [Let]


f = @(x,y) sin(2*pi*x.*y)-sqrt(2)*(pi^2)*(x.^2).*(y.^2);
range = [1e-5 10e-4 1 10000];
fimplicit(f, range)