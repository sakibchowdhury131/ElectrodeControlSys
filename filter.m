clc
clear all;
close all;
Fs = 1000;                    
T = 1/Fs;                     
L = 1000;                     % Length of signal
t = (0:L-1)*T; 
a=5*10e-3
x=2*sin(2*pi*t/T); 
Px=sum(x.^2)/length(x); 
SNR= -10; % in dB
Py=Px/10^(SNR/10);
n=sqrt(Py)*randn(1,length(t));
y=x+n; % Corrupted input
figure(1)
plot(t,y)

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
% f = Fs/2*linspace(0,1,NFFT/2+1);
f = Fs/2*linspace(0,1,NFFT);
figure(2)
plot(f,2*abs(Y)) 
hf=sinc(pi*a*(f/1.414)).*sinc(pi*a*(f/1.414));
yfiltered=Y.*hf
figure(3)
plot(f,abs(yfiltered))

