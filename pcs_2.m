clc;
close all;
clear;
xi = 0.7;
wn = 1;
wd = wn * (sqrt(1-xi^2)/xi);
Num = wn^2;
Den = [1 2*xi*wn wn^2];
Gs = tf(Num,Den);
figure(1)
step(Gs)
grid;
xlabel('t')
ylabel('Y(t)')
title("step response of second order system 01")
s=tf('s');
Gs1=wn^2/(s^2+2*xi*wn*s+wn^2);
figure(2)
step(Gs1)
grid;
xlabel('t')
ylabel('Y(t)')
title("step response of second order system 02")
