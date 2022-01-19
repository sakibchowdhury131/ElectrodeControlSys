function[wc]=zeroCount(sig,wid)
s=0;
for i=1:1:wid-1
    s=s+zcfunc((sig(i+1)*sig(i)));
end
wc=s;