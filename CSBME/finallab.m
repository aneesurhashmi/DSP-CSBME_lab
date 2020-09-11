close all;
clear;
clc

% TASK: Check if system is stable, unstable or maginally stable

% block one gs
nume1 = [507];
denom1 = [1 3 10 30 169];
printsys(nume1,denom1)

% feedback gain
fbnum = [1];
fbdenom = [1 0];
printsys(fbnum,fbdenom)

% solve feedback
[numgs, denomgs] = feedback(nume1,denom1, fbnum, fbdenom,-1);
printsys(numgs,denomgs)

% find poles and zeros to check for stability
[p z] = pzmap(numgs, denomgs)
% display graph
pzmap(numgs, denomgs)

% display msg
p_real = real(p);
if length(p_real(p_real>0))
    disp("system is unstable.")
elseif length(p_real(p_real < 0)) == length(p_real)
    disp("system is stable")
else
    disp("system is marginally stable")
end

% ======================================== %

% During Viva
% Find poles for (10)/(1+10s)(1+s)

% num = 10;
% denom = conv([10 1], [1 1]);

% s =tf("s");
% h = 10/((1+10*s)*(1+s))

% p = pole(h)
% z = zero(h)

% % [p, z] = pzmap(num ,denom)
% % pzmap(num ,denom)

