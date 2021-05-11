fx = -400:1:400;%in Hz
fy = -400:1:400;%in Hz
a = 5e-3;   %in mm
b = 10e-3; 
v = 4;  %in ms^-1
H = zeros(length(fx),length(fy));
for i = 1:1:length(fx)
    for j = 1:1:length(fy)
        H(i,j) = (sinc(pi*a*fx(i)))*(sinc(pi*b*fy(j)));
    end
end
mesh(fx,fy,H)
xlabel('fx')
ylabel('fy')
zlabel('|H|')