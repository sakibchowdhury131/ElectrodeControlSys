syms w
r = 1e-3;   %in mm
v = 4;  %in ms^-1
F = 2*besselj(1, r*w/v)/(r*w/v);
IF = ifourier(F);
LT = laplace(IF);