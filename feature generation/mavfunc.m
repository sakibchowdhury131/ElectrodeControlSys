function[ans]=mavfunc(sig,wid)
s=0;
for i=1:1:wid
    s=s+abs(sig(i));
end
ans=s/wid;