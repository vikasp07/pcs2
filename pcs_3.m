clc;
close all;
clear;
s = tf('s');
%set1 - Over Damped System
m1 = 1;
b1 = 16;
k1 = 20;
wn1 = sqrt(k1/m1);
zetal = (b1/m1) / (2*wn1);
num1 = 20;
den1 = m1*s^2 + b1*s + k1;
G1 = tf (num1 / den1);
step(G1);
hold on;
grid;
xlabel('t')
ylabel('C(t)')
title("Step Response of Second Order System")
%set2 - Underdamped System
m2 = 1;
b2 = 2;
k2 = 20;
wn2 = sqrt(k2 / m2);
zeta2 = (b2 / m2) / (2 * wn2);
num2 = 20;
den2 = m2*s^2 + b2*s + k2;
G2 = tf(num2 / den2);
step(G2);
hold on;
%set3 - Critically Damped System
m3 = 1;
b3 = 8;
k3 = 20;
wn3 = sqrt(k3 / m3);
zeta3 = (b3 / m3) / (2 * wn3);
num3 = 20;
den3 = m3*s^2 + b3*s + k3;
G3 = tf(num3 / den3);
step(G3);
xlim ([0, 6]);
