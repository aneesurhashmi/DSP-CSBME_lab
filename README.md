# DSP-CSBME_lab

## DSP Lab 1: Introduction

Basic Commands: plot, stem, sound 


## DSP Lab 2 and 3: Sampling 

### Up sampling
  
  Zero Stuffing method:  upsample(x, L)
  
  Interpolation method: interp(x, L)
  
### Down Sampling
  
   downsample(x ,M)
   
### Re sampling 

  resample(x, L, M)
  
### Quantization

  round(x)

   

## DSP Lab 10: Filters

### Designing

IIR filters: butter(no_of_poles, freq_band_range) --> coef a and b

FIR filters: fir1(no_of_poles, freq_band_range) --> coef b

### Frequency response of filter

freqz(b,a,length(signal), signal)--> h and w

### Pass the signal through the filter twice (with 180 degrees shift)

filtfilt(b,a,signal) --> y (response of filter with input signal)

