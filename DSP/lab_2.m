% Lab 2

% Multi Sampling
% Up-Sampling
    % Zero Stuffing method
        % values exist only for values of n/L where n = +-0, L, 2L,...
        % and zero for all other values
        % here L is upsampling factor
    % Interpolation
        % adding values (as per fn) 


close all;
clear;
clc;

F1 = 100;
F2 = 200;
Fs = 1000;
Ts = 1/Fs;
nTs = 0: Ts: 2/F1;
x = sin(2*pi*F1*nTs) + sin(2*pi*F2*nTs);

%------- up sampling
L = 4; % sampling factor
Tsup = Ts/L; % sampling interval decreases by sampling factor

% zero stuffing method
% xup = upsample(x, L);
% interpolation method
xup = interp(x,L);
nup = 0:length(xup)-1;
tup = nup*Tsup;

figure;
subplot(211);
stem(nTs, x, "k", "Markerfacecolor","r","LineWidth",2);
xlabel("Discrete time (sec)");
ylabel("Amp");
xlim([0 0.02]);
legend("original signal");

subplot(212);
stem(tup, xup, "k","Markerfacecolor","r","LineWidth",2);
xlabel("Discrete Time (sec)");
ylabel("Amp");
xlim([0 0.02]);
legend("Upsampled signal");
title("Zero Stuffing")

pause;
disp("press any key to continue");

% ---------------------- downsampling ------ 
% discard M-1 samples btw two consecutive samples
    % where M is the downsampling factor

close all;
clear;
clc;

F1 = 100;
F2 = 200;
Fs = 8000;
Ts = 1/Fs;
nTs = 0: Ts: 2/F1;
x = sin(2*pi*F1*nTs) + sin(2*pi*F2*nTs);
M = 4; % downsampling factor
Tsdown = M*Ts;
xdown = downsample(x, M);
ndown = 0:length(xdown) -1;
tdown = ndown*Tsdown;

figure;
stem(nTs, x,"m","Markerfacecolor","c");
hold;
stem(tdown, xdown, "k","filled","LineWidth",2);
xlabel("Discrete Time (sec)");
ylabel("Amp");
xlim([0 0.02]);
legend("Orignal signal","Downsampled signal");
title("DownSampling")


% resampling of a signal: by factor L/M;
%   when a fractional factor is required
     % using resample command

% ============== Quantizaion ============ %
% bit depth => number of bits
% rounding error --> quantization error

close all;
clear;clc;
F = 100; T = 1/F;
Fs = 10000; Ts = 1/Fs;
nTs = 0:Ts:2*T;
% change the bit depth and observe difference
bits = 2; %bit depth
levels = 2^bits;
maxmag = 2^(bits)-1;
x = maxmag*sin(2*pi*F*nTs);
plot(nTs,x,"LineWidth",2);
hold on;
axis = [0 2*T-(maxmag+1) maxmag+1];
xq = round(x); % quantized values

% keep the xq in limit
xq(xq==maxmag) = maxmag-1;
plot(nTs, xq, "r","LineWidth",2);

% BUG
for i= -maxmag:maxmag-1 % quantization levels
%     xq = num2str(i);
    fplot(xq, axis, "k:");
end
legend("Sampled Signal", "Quantized signal","Quantization level");
xq = "0";
fplot(xq, axis, "k-");
xlabel("Time (sec)");
ylabel("Amp");
title(sprintf("Quantization with %g bits and %g levels of ADC",bits, levels));
hold off;


