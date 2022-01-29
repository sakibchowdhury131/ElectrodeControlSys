# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt
from lib.utils import generateNoise, generateSMES_full 
import numpy as np
from math import log10



Fs = 2000 #2kHz sampling frequency
t = 30 # duration in seconds
t_smes = 0.5
noise = generateNoise()
orig_sig = generateSMES_full(t_smes = t_smes, snr = 15)
x = noise+orig_sig

#plt.plot(x)


N = len(x)
r = 10
M = int(N/r)
X_cap = np.zeros((M, r))

for i in range(0, M):
    X_cap[i] = x[i*r:(i+1)*r]
    


#calculation of C
C = np.zeros(M)
for k in range(0, M):
    C[k] = np.sum((X_cap[k]**2)/10)
    
logC = np.zeros(len(C))    
for i in range(0, len(C)):
    logC[i] = log10(C[i])
        
(freq, bins, bar) = plt.hist(logC, bins = 100)

plt.plot(bins[0:100], freq)


Nbins = 60
bins_s = np.zeros(Nbins -1)

'''
for m in range (0, Nbins -1):
    bins_s[m] = (m*(np.max(logC)-np.min(logC))/(2*Nbins))+np.min(logC)


'''
# finding Inosie

Inoise = np.max(freq[:50])
index_Inoise = np.where(freq == Inoise)[0][0]

# finding next minima 
minima_middle = np.min(freq[index_Inoise:index_Inoise+35])
indexOfminimamiddle = index_Inoise + np.where(freq[index_Inoise: index_Inoise+35] == minima_middle)[0][0]

# finding Isignal

Isignal = np.max(freq[indexOfminimamiddle:])
index_Isignal = indexOfminimamiddle+ np.where(freq[indexOfminimamiddle:] == Isignal)[0][0]    

# finding Pnoise
num = 0
den = 0
for i in range(index_Inoise-5, index_Inoise+5):
    num = num+bins[i]*freq[i]
    den = den+freq[i]

Pnoise = 10*(10**(num/den))


# finding Psignal 

num = 0
den = 0
for i in range(index_Isignal-5, index_Isignal+5):
    num = num+bins[i]*freq[i]
    den = den+freq[i]

Psignal = 10*(10**(num/den))

e_noise = np.sqrt(Pnoise)
e_signal = np.sqrt(Psignal)


snr_pred = 10*log10(abs((Psignal - Pnoise)/Pnoise))