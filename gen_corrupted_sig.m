function [] = gen_corrupted_sig()
L = 1000;
Fs = 1000;
for fl = 30:1:60
    for c = 30:1:100
        fu = fl+c;
        sig = gen_sig(fl, fu, L, Fs);
        sig_pow = rms(sig)^2;
        inDb = pow2db(sig_pow);
        for snr = 1:1:20
            corr_sig = awgn(sig, snr, inDb);
            writematrix(corr_sig','data.csv','Delimiter','comma','WriteMode','append')
            writematrix(snr,'snr.csv','Delimiter','comma','WriteMode','append')
        end
    end
end