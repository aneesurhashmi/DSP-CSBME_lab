% Final Lab

% simulate and plot two CT signals freq 25hz and 250 Hz   
% sample at 200 Hz. observe and Explain Aliasing effects 

close all;
clear;
clc;


F1 = 25;
F2 = 250;

t = 0:0.00001:1;

xt1 = sin(2*pi*F1*t); % CTCV 1
xt2 = sin(2*pi*F2*t); % CTCV 2

Fs = 200;
nts = 0:1/Fs:1;
n = 0:length(nts)-1;
xn1 = sin(2*pi*F1*nts); % DTCV 1
xn2 = sin(2*pi*F2*nts); % DTCV 2

figure;
subplot(211);
% plot(t,xt1);
% hold on;
stem(nts, xn1);
xlabel("Discrete Time");
ylabel("Amp");
xlim([0 0.1]);
grid on;
legend("25Hz");
title("DTCV Sinusoids");
% hold off;

subplot(212);
% plot(t,xt2);
% hold on;
stem(nts, xn2);
xlabel("Discrete Time");
ylabel("Amp");
xlim([0 0.1]);
grid on;
legend("250Hz");
title("DTCV Sinusoids");
% hold off;
