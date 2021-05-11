fx = -1200:1:1200;%in Hz
fy = -1200:1:1200;%in Hz
d = 10e-3;   %in mm
v = 4;  %in ms^-1
H = zeros(length(fx),length(fy));
for i = 1:1:length(fx)
    for j = 1:1:length(fy)
        H(i,j) = (2*besselj(1,(pi*d*sqrt(fx(i)^2 + fy(j)^2)))/(pi*d*sqrt(fx(i)^2 + fy(j)^2)));
    end
end
mesh(fx,fy,H)
xlabel('fx')
ylabel('fy')
zlabel('|H|')