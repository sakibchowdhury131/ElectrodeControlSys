clear all;
close all;


f = 1:1:500;
d = 1e-3;   %in mm
v = 4;  %in ms^-1
H = zeros(400,1);
for i = 1:1:length(f)
    H(i) = (2*besselj(1,(pi*d*f(i)))/(pi*d*f(i)));
end
plot(f,H)
