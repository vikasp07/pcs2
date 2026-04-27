clc;
clear;
close all;
s = tf('s');
Gs = 1/(s*(s+1));
%% Step response of open loop
figure(1)
step(Gs);
title('Unit Step Response of the Open Loop System');
%% Design specifications
Mp = 0.04;
ts = 3.5;
z = (log(Mp)/pi)^2;
xi = sqrt(z/(1+z));
wn = 4/(xi*ts);
%% Desired dominant pole
sd = -xi*wn + wn*sqrt(1-xi^2)*1i;
figure(2)
plot(real(sd), imag(sd), 'mx', 'LineWidth', 2);
hold on
rlocus(Gs);
%% Evaluate G(s) at sd
[num, den] = tfdata(Gs,'v');
n_den = length(den);
denSd = 0;
for k = 1:n_den
   denSd = denSd + den(k)*sd^(n_den-k);
end
n_num = length(num);
numSd = 0;
for k = 1:n_num
   numSd = numSd + num(k)*sd^(n_num-k);
end
%% Angle condition
phi = -pi - angle(numSd/denSd);
phi_deg = rad2deg(phi);
theta = acos(xi);     % radians
gamma = 0.5*(pi - theta - phi);
%% Lead compensator parameters
zc = wn*sin(gamma)/sin(pi - theta - gamma);
pc = wn*sin(gamma + phi)/sin(pi - theta - gamma - phi);
alpha = zc/pc;
gc = (s + zc)/(s + pc);
%% Root locus with compensator
figure(3)
plot(real(sd), imag(sd), 'mx', 'LineWidth', 2);
hold on
rlocus(Gs*gc);
%% Gain calculation (magnitude condition)
[numc, denc] = tfdata(Gs*gc,'v');
n_denc = length(denc);
denSdc = 0;
for k = 1:n_denc
   denSdc = denSdc + denc(k)*sd^(n_denc-k);
end
n_numc = length(numc);
numSdc = 0;
for k = 1:n_numc
   numSdc = numSdc + numc(k)*sd^(n_numc-k);
end
Kc = abs(denSdc/numSdc);
Gc = Kc*gc;
%% Closed loop system
Gcl = minreal((Gs*Gc)/(1 + Gs*Gc));
figure(4)
step(Gcl);
title('Closed Loop Step Response');
