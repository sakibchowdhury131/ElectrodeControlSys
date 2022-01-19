function[sum]=wavelength(sig,wid)
s=0;
for i=1:1:wid-1
    s=s+abs(sig(i+1)-sig(i));
end
sum=s;