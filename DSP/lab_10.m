close all;
clear all;
clc;

% Lab 10: Digital Filters

% The Freq response characterstic HWo (H omega) is responsible for behaviour of filter
% which depends upons the systems parameters like Coef. Ak and Bk

% Design: The determination the coefficients of FIR and IIR filters such that system close resembles the desiref freq response.


% Types:
    % IRR: Infinite Impluse Response
        % Have feeback
        % contains poles and zeros both
            % Can be unstable because T
            % Past output, past inputs can be considered with current input

    % FIR: Finite Impluse Response, 
        % Used when lineaer phase characterstics are require for passed band
        % non feedback involved
        % Cant be unstable because TF does not contain any poles (Freq response solely depends upon zeros)
        % only past inputs can be considered with current input


% FIR has lower nuber of cyclobe bands given same amount of parameters
% IIR filters are preferred due to lesser parameters, lesser computation power and complexity.


% IIR Digital filters Types:
    % Butterworth filter
    % Chebyshev Type I filter
    % Chebybshev Type II filter
    % Eliptic filter

% Commands (methods):
    % [b, a] = butter(N ,Wn )
    % fir(n, Wn)
    % where a and b are filter coef, N = Order of Filter, Wn = edge freq
    
    % [h, w] = freqz (b,a ,n) <=== freq response of digital filter
    % if n is not defined ==> default value of 512 samples is used
    % h is the freq response vector and w is the angular freq response

    % [b.a] = eqtlength(num, denom) 
    % equilize lengths of transfer function's numerator and denominator

    % tf2zp <== tranfers filter parameters to zero pole gain form


% Let's code
% freq of two input signals in Hz
F1 = 100;
F2 = 150;
Fs = 1000; % sampling freq
freqRangeHigh = [125 175]*2/Fs; % nomalized band pass high frequency filter range
freqRangeLow = [75 125]*2/Fs; % nomalized band pass low frequency filter range
t = 0:1/Fs:1; % time vector (time scale)
F = Fs*[0:length(t)-1]/length(t); % Freq vector (freq scale)
x = exp(i*2*pi*F1*t) + 2* exp(i*2*pi*F2*t); %signals 

% find Filter coef
% For IIR filter use butter command
% [bl, al] = butter(6, freqRangeLow); % order of low filter is 6    
% [bh, ah] = butter(6, freqRangeHigh); % order of high filter is 6    
% for FIR filter use filt1 with 64 poles
bl = fir1(64, freqRangeLow);
al = 1;
bh = fir1(64, freqRangeHigh);
ah = 1;

[hl, wl] = freqz(bl, al, length(t), "whole"); % freq response of the filter
[hh, wh] = freqz(bh, ah, length(t), "whole"); % freq response of the filter

% pass the signal through the filter twice (with 180 degrees shift)
yl = filtfilt(bl,al,x);
yh = filtfilt(bh,ah, x);

% Plotting
figure;
subplot(5,1,1);
plot(F, abs(fft(x)));
xlim([0 Fs/2]);
title("FFT of the original signal");
xlabel("Frequency (Hz)");

subplot(5,1,2);
plot(F, abs(hh));
xlim([0 Fs/2]);
title("Filter response of Filter one");
xlabel("Frequency (Hz)");

subplot(5,1,3);
plot(F, abs(fft(yh)));
xlim([0 Fs/2]);
title("FFT of the Filtered signal from Filter one");
xlabel("Frequency (Hz)");

subplot(5,1,4);
plot(F, abs(hl));
xlim([0 Fs/2]);
title("Filter response of filter from Filter two");
xlabel("Frequency (Hz)");

subplot(5,1,5);
plot(F, abs(fft(yl)));
xlim([0 Fs/2]);
title("FFT of the Filtered signal from Filter Two");
xlabel("Frequency (Hz)");

% Pole Zero Constellations
[bh, ah] = eqtflength(bh,ah);
[zh, ph, kh] = tf2zp(bh,ah);
[bl, al] = eqtflength(bl,al);
[zl, pl, kl] = tf2zp(bl,al);

figure;
subplot(1,2,1);
zplane(bl,al);
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
title("Filter One");

subplot(1,2,2);
zplane(bh,ah);
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
title("Filter Two");
