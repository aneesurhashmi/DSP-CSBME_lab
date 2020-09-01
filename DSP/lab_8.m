% lab 8
% discrete fourier transform
close all;
clear all;
clc;
t = 0:0.0001:10e-3;
F1 = 1000;
F2 = 2000;
xt = sin(2*pi*F1*t) + 0.5*sin(2*pi*F2*t+3*pi/4);
N= 8; % 8 point dft
n= 0:N-1;
K=0:N-1;
Fs = 8000; % Sampling frequency
Ts=1/Fs; % samplint interval
xn = sin(2*pi*n*F1*Ts) + 0.5*sin(2*pi*n*F2*Ts+3*pi/4);
tn = n.*Ts;

subplot(511);
plot(t, xt, "r"); %first plot will be of cont signal
hold on
stem(tn, xn, "filled"); % add 8 stems on cont signal
xlabel("Time");
ylabel("Amplitude");
title("Continouse time signal");
grid on;

% calculate dft now
xk = zeros(1, N);
for k=0:N-1
    for n_temp=0:N-1
        xk(k+1) = xk(k+1)+xn(n_temp+1)*exp((-i)*2*pi*n_temp*k/N);
    end
end

% vectorized implementation
 Xk_exp = exp(-i*2*pi.*(K'*n)/N); % exponent calcuated
 Xk = sum(xn.*Xk_exp,2);

%loop implementation
xk_magnitude = abs(xk);
Fk =K*Fs/N;
subplot(512);
stem(Fk, xk_magnitude, "filled" ,"r");
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Magnitude Spectrum");
grid on;

%vectorized implementation
Xk_magnitude = abs(Xk);
Fk =K*Fs/N;
subplot(513);
stem(Fk, Xk_magnitude, "filled" ,"r");
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Vectorized Magnitude Spectrum");
grid on;

%plot phase angle
xk_phase =angle(round(xk));
phase = xk_phase.*(180/pi); % radians to degrees
subplot(514);
stem(Fk, phase, "filled" ,"r");
xlabel("Frequency (Hz)");
ylabel("Phase (Degrees)");
title("Phase Spectrum");
grid on;

% vectorized phase angle
Xk_phase =angle(round(Xk));
vec_phase = Xk_phase.*(180/pi); % radians to degrees
subplot(515);
stem(Fk,vec_phase, "filled" ,"r");
xlabel("Frequency (Hz)");
ylabel("Phase (Degrees)");
title("Vectorized Phase Spectrum");
grid on;

