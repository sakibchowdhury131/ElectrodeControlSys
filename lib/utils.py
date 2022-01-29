#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 21 18:53:20 2022

@author: sakib
"""

import scipy.stats as stats
import numpy as np


def generateNoise(sampling_rate = 2000, duration = 30, mu = 0, sigma = 1e-6):   
    sample_length = sampling_rate*duration
    a, b = -100e-6, 100e-6 # min and max limit
    dist = stats.truncnorm((a - mu) / sigma, (b - mu) / sigma, loc=mu, scale=sigma)    
    return dist.rvs(sample_length)


def generateSMES_single(snr, sampling_rate = 2000, duration = 0.5, mu = 0):
    sample_length = int(sampling_rate*duration)
    a, b = -100e-6, 100e-6
    sigma = (10**(snr/20))*1e-6
    print(sigma)
    dist = stats.truncnorm((a - mu) / sigma, (b - mu) / sigma, loc=mu, scale=sigma)    
    return dist.rvs(sample_length)

def generateSMES_full(snr, sampling_rate = 2000, duration = 30, t_smes = 0.5):
    orig_sig = np.zeros(sampling_rate*duration)
    for i in range (0, duration):
        orig_sig[(i*sampling_rate+int(t_smes*sampling_rate)):(i*sampling_rate + int(2*t_smes*sampling_rate))] = generateSMES_single(snr = snr, duration = t_smes)
        
    return orig_sig