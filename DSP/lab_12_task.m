% % EXERCISE: DSP lab 12
% % Record Your Voice at home while turn any motor of your house ON.
% % Design a filter using FDA Tool.
% % Remove sound of motor from recorded signal.
% % Listen the output signal.

% close all;
% clear;
% clc;

% % file names
% originalSignalFilename = "bm44.wav";
% filteredSignalFilename = "bm44-filtered.wav";

% % returns sampling rate and amplitudes
% [y, Fs] = audioread(originalSignalFilename);

% % normalized freq band range
% freqRange = [700 800]*2/Fs;

% % time scale
% t = 0:1/Fs:length(y)/Fs-1/Fs;

% % frequency analysis
% N = length(y);
% K = 0:N-1;
% % freq domain signal
% f = K*Fs/N;

% % filter design
% b = fir1(64, freqRange);
% a = 1;
% [h, w] = freqz(b, a, length(t), "whole"); % freq response of the filter

% % filtered signal (signal passed through filter)
% yFiltered = filtfilt(b,a, y);

% % fft of filtered signal
% yFilteredFFt = fft(yFiltered);

% % plot
% figure;
% subplot(5,1,1);
% plot(t,y);
% title("Original signal");
% xlabel("Time (sec)");
% ylabel("Amplitude");

% subplot(5,1,2);
% plot(f, abs(fft(y)));
% title("FFT of original signal")
% xlabel("Frequency (Hz)");
% xlim([0 Fs/2]);
% ylabel("Amplitude");

% subplot(5,1,3)
% plot(f, abs(h));
% xlim([0 Fs/2]);
% title("Filter response");
% xlabel("Frequency (Hz)");
% ylabel("Amplitude");

% subplot(5,1,4)
% plot(f, abs(yFilteredFFt));
% xlim([0 Fs/2]);
% title("FFT of the Filtered signal");
% xlabel("Frequency (Hz)");
% ylabel("Amplitude");

% subplot(5,1,5);
% plot(t, yFiltered);
% title("Filtered signal");
% xlabel("Time (sec)");
% ylabel("Amplitude");

% % play filtered sound
% sound(yFiltered*2, Fs)

% % save filtered sound
% audiowrite(filteredSignalFilename, yFiltered, Fs);



clear all;
close all;
clc;
ph1=0; %phase shift for signal 1
ph2=0; %phase shift for signal 2
n=[0:15];
x=sin(2*pi*0.2*n+ph1);
org_x=1;
nx=[0:length(x)-1]-org_x+1;
y=sin(2*pi*0.2*n+ph2);
org_y=1;
ny=[0:length(y)-1]-org_y+1;
rxy=conv(x,fliplr(y));
nr=[nx(1)-ny(end) : nx(end)-ny(1)];
[maxR indR]=max(rxy);
disp(['The maximum correlation is at lag' num2str(nr(indR))'.']);
figure;
subplot(3,1,1);
stem(nx,x);
xlabel('Time Index');
ylabel('Amplitude');
title('Signal x(n)');
grid;
subplot(3,1,2);
stem(ny,y);
xlabel('Time Index');
ylabel('Amplitude');
title('Signal y(n)');
grid;
subplot(3,1,3);
stem(nr,rxy);
xlabel('Time Index');
ylabel('Amplitude');
title('Correlation b/w x(n) & y(n)');
grid;