% Lab 1
% ADC

% observing the effect of samplign freq and sampling period

close all;
clear all;
clc;
 
F = 2; % continuous signal freq
t = 0:0.0001:1; % cont time scale
xt = sin(2*pi*F*t); % cont signal

% tweak the sampling frequency, Fs, ans observe change in sampling periods
Fs = 8; % sampling freq /rate
nts = 0:1/Fs:1; % discrete time scale or sample numbers
xn = sin(2*pi*F*nts); % discrete time signal

% plot 
plot(t,xt);
hold on;
stem(nts, xn,"r");
hold off;

disp("press any key to execute part 2 of program")
pause;
% ------------------------ part 2 ------------------- %
% Sampling freq and aliasing
% study samplig theorem

close all;
clear all;
clc;

% two cont signals
F1 = 20; %freq 1
F2 = 120; % freq 2
t = 0:0.00001:0.2; % time scale
xt1 = sin(2*pi*F1*t); % signal 1
xt2 = sin(2*pi*F2*t); % signal 2

% plot 1: CTCV signals
figure;
plot(t, xt1, t,xt2, "LineWidth",2);
xlabel("Cont Time");
ylabel("Amp");
xlim([0 0.1]);
grid on;
legend("20Hz", "120Hz");
title("CTCV Sinusoids");

% sampling
Fs = 500; % change this to avoid aliasing effect
nts = 0:1/Fs:0.2; % sampling instances
n = 0:length(nts)-1; % number of samples
xn1 = sin(2*pi*F1*nts); % sampled singals
xn2 = sin(2*pi*F2*nts);

% plot DTCV and CTCV signals together
figure;
subplot(211);
plot(t,xt1);
hold on;
stem(nts, xn1);
xlabel("Discrete Time");
ylabel("Amp");
xlim([0 0.1]);
grid on;
legend("20Hz");
title("DTCV Sinusoids");
hold off;

subplot(212);
plot(t,xt2);
hold on;
stem(nts, xn2);
xlabel("Discrete Time");
ylabel("Amp");
xlim([0 0.1]);
grid on;
legend("120Hz");
title("DTCV Sinusoids");
hold off;

disp("press any key to execute part 3 of program")
pause;

% ---------------- Part 3 ------------------ %
% sampling of a sound singal
close all;
clear all;
clc;

F = 5000;
t = 1; % for 1 sec only (constant sound)
y = sin(2*pi*F*t); % sound signal
sound(y, F)

disp("press any key to play sampled sound");
pause;

% sampling
Fs = 12000;
nts = 0:1/Fs:1;
yn = sin(2*pi*F*nts);
sound(yn, Fs)

