% EXERCISE: DSP lab 12
% Record Your Voice at home while turn any motor of your house ON.
% Design a filter using FDA Tool.
% Remove sound of motor from recorded signal.
% Listen the output signal.

close all;
clear all;
clc;

% file names
originalSignalFilename = "bm58-original.wav";
filteredSignalFilename = "bm58-filtered.wav";

% returns sampling rate and amplitudes
[y, Fs] = audioread(originalSignalFilename);

% normalized freq band range
freqRange = [200 450]*2/Fs;

% time scale
t = 0:1/Fs:length(y)/Fs-1/Fs;

% frequency analysis
N = length(y);
K = 0:N-1;
% freq domain signal
f = K*Fs/N;

% filter design
b = fir1(64, freqRange);
a = 1;
[h, w] = freqz(b, a, length(t), "whole"); % freq response of the filter

% filtered signal (signal passed through filter)
yFiltered = filtfilt(b,a, y);

% fft of filtered signal
yFilteredFFt = fft(yFiltered);

% plot
figure;
subplot(5,1,1);
plot(t,y);
title("Original signal");
xlabel("Time (sec)");
ylabel("Amplitude");

subplot(5,1,2);
plot(f, abs(fft(y)));
title("FFT of original signal")
xlabel("Frequency (Hz)");
xlim([0 Fs/2]);
ylabel("Amplitude");

subplot(5,1,3)
plot(f, abs(h));
xlim([0 Fs/2]);
title("Filter response");
xlabel("Frequency (Hz)");
ylabel("Amplitude");

subplot(5,1,4)
plot(f, abs(yFilteredFFt));
xlim([0 Fs/2]);
title("FFT of the Filtered signal");
xlabel("Frequency (Hz)");
ylabel("Amplitude");

subplot(5,1,5);
plot(t, yFiltered);
title("Filtered signal");
xlabel("Time (sec)");
ylabel("Amplitude");

% play filtered sound
sound(yFiltered*2, Fs)

% save filtered sound
audiowrite(filteredSignalFilename, yFiltered, Fs);