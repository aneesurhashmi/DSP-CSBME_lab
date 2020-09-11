clear;
close all;
clc;

% polynomial
% for s^3 + 2s^2 -3s +1
x = [1 2 -3  1];
r = roots(x); 

% muliplying two polynomials
% (s+1)(s^2 -2s +6)
x1 = [1 1];
x2 = [1 -2 6];
xMul = conv(x1,x2);

% dividing two vectors
% xMul / (s+1) should result (s^2 -2s + 6)
xDiv = deconv(xMul, x1);

A = [3 2 1; -1 3 2; 1 -1 1];
b = [10 -5 1]';
% find polynomial eq for matrix A
polyA  = poly(A);
% find polynomial and find its value at x = 4
polyX4 = polyval(poly(A),4);


% TF
% (6s^2+1)/(s3 + 3s2 +3s + 1)
gsnum = [6 0 1];
gsdenom = [1 3 3 1];
% find poles and zeros
[P ,Z] = pzmap(gsnum, gsdenom); 
% lets verify Z and P
% we know that roots of numerator are zeros
% and roots of denom are poles
z = roots(gsnum);
p = roots(gsdenom);

% example
hn1 =[ 1 1];
hn2 = [1 2];
hd1  = [ 1 2*i];
hd2 = [1 -2*i];
numh = conv(hn1, hn2);
denh = conv(hd1, hd2);
% print TF using system print 
printsys(numh, denh);
% pzmap(numh, denh);

% partial frac
n_partial = 32;
d_partial = poly([0 -4 -8]);
[p, r, k] = residue(n_partial,d_partial) 


% TF
s = tf("s");
h = s/(s^2+1);

% system of equations

syms i1 i2 i3 s v
A= [ (s+1) s+2 5;
    s -s+4 s^2;
    5 2*s 4*s^4];
B = [ v
0 
0];
X = inv(A)*B;
pretty(X)