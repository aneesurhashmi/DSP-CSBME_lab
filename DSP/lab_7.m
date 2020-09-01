close all;
clear all;
clc;

% Lab 7
% Time freq characterstics using CTFS

% CTFS ===> continuous time periodic signal
% Time domain properties of signal: Time period and pulse width
% Freq domain properties of signal: Spectral density and lobe width
% relationship btw these properites

% spectral spacing is inversely proportional of time period 
% lobe width is inversely proportional to the impluse of signal

% generating a square wave 
Ts = 0.001; % sampling time
t = -10:Ts:10; % cont time period
Tp = 1; % Time period
tau = 0.1; %pulse width or duty cycle ylim([-1.2 1.2]);
x = (1+square(2*pi*t/Tp, tau*100))/2; % 1 is the dc offset
plot(t, x)
xlabel("Time (seconds)");
ylabel("Magnitude")
ylim([-1.2 1.2]);
pause; % press any key to resume program excution

% extract a portion from this signal equal to its period
one_portion = find(t== -Tp/2) : find(t==Tp/2);
x_port = x(one_portion); % used as basis function or single cycle of the signal (as x(t) in integral)
figure;
plot(t(one_portion), x_port);
xlabel("Sec");
ylim([-1.2 1.2]);
pause

Fo = 1/Tp;

% computing CTFS coef
% using CTFS formula
for k = 1:20
    B = exp(-j*2*pi*(k-1)*Fo.*(-Tp/2:Ts:Tp/2)); %using k-1 for value of Co (c not) with integral limits applied
    C(k) = sum(x_port.*B)/length(x_port)*Tp; %taking integral of basis func*B
end

% Original freq values
kFo = Fo*0:k-1;
figure;
stem(kFo, abs(C));
title("CTFS spectrum");
xlabel("Freq (Hz)")
ylabel("Magnitude")

