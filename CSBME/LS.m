% isplay TF
% zpk
    % zero pole gain model
    % gain is the numerator
% factors should be known
% repeated factors add to power
F = zpk([2 3 4 4],[1 -2 -2], 1);

% similarly we have
% tf <--- uses polynomial 
% it takes denom and numerator only
F1  = tf([1], [1 2]); 

 %  alternantive method
s = tf("s");
hd1 = 2*s/(4*s+1);

% Easily solve the TF
% symoblic toolbox
% dummy variable s
syms s
f = ilaplace(32/(s*(s^2+12*s+32)));
f1 = ilaplace(1/(s*(s-1)));
pretty(f1)

%  partial fractions
% residue command
numf = 32; % numirator
denf = poly([0 -4 -8]);
% R --> A. B. C etc
[R,p,k] = residue(numf, denf);

% solving systems
% electrical and mechanical
% using vectorized implementation
% using syms v1 v2 v2 ...
% X = inv(A)B

% state space systems
% define all matrices
% X' = Ax+Bu
% y = Cx+ Du
% use ss command
    % ss(A,B,C,D)

% TF to Space state
    % tf2ss(num, denom)

% cascading two blocks in block diagram
    % series
num1 = [1]; 
den1 = [500 0 0];
num2 = [1 1];
den2 = [1 2];

[numS, denS] = series(num1, den1, num2, den2);
printsys(numS,denS);

% solving blocks in parallel
    % paraller command

% closed loop
    % input to a system / block with unity feedback
    % cloop fn
[num, den] = cloop(numS, denS);
printsys(num,den);

% closed loop
    % non-unity feebdback
    % feedback

[numF, denF] = feebdback(num1, den1, num2,den2, -1);
printsys(numF, denF);