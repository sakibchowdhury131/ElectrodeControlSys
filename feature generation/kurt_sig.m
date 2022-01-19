data=csvread("data.csv");
len=height(data);
wid=width(data)
for i=2:1:len
    sig=data(i,:);
    k=kurtosis(sig);
    s=skewness(sig);
    m=mavfunc(sig,wid);
    wl=wavelength(sig,wid);
    zc=zeroCount(sig,wid);
    writematrix([k s m wl zc],'features.csv','Delimiter','comma','WriteMode','append')
end

%%normalised values 
