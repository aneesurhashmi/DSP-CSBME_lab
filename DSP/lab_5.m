% Lab 5

% conv
clear;
close all;
clc;

x = rand(1,9);
org_x = 2;
nx = [0:length(x)-1]-org_x+1;

h = rand(1,8);
org_h = 3;
nh = [0:length(h)-1]-org_h+1;

y = conv(x,h);
ny = [nh(1)+nx(1):nx(end)+nh(end)];

figure;
subplot(311);
stem(nx, x);
title("x")
subplot(312);
stem(nh, h);
title("h")
subplot(313);
stem(ny, y);
title("y")