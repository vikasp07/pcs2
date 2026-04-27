close all;
clear;
clc;
disp('Program Started');
%% Define Transfer Function
% G(s) = 50(s+1) / [s(s+3)(s+5)]
num = 50*[1 1];                       % 50(s+1)
den = conv([1 0], conv([1 3],[1 5]));  % s(s+3)(s+5)
G = tf(num, den);
%% Bode Plot
figure;
bode(G);
grid on;
title('System 1 - Bode Plot');
%% Gain Margin & Phase Margin
[Gm, Pm, Wcg, Wcp] = margin(G);
%% Bandwidth Calculation (-7 dB condition)
w = 0:0.01:20;
[M, ~, W] = bode(G, w);
M = squeeze(M);
W = squeeze(W);
wBW = NaN;   % initialize
for k = 1:length(M)
   if 20*log10(M(k)) <= -7
       wBW = W(k);
       break
   end
end
if isnan(wBW)
   error('Bandwidth not found in given frequency range');
end
%% Closed Loop System
T = feedback(G, 1);
figure;
step(T);
grid on;
title('Step Response - System 1');
%% Damping Ratio Approximation from Phase Margin
z = Pm / 100;     % standard approximation (valid for 30°–70° PM)
%% Time Domain Specifications
Po = exp(-z*pi/sqrt(1 - z^2));     % Percent Overshoot
Ts = 4/(wBW*z);                   % Settling Time (approx)
Tp = pi/(wBW*sqrt(1 - z^2));      % Peak Time
%% Display Results
fprintf('\n -------- RESULTS -------- \n');
fprintf('Bandwidth = %.4f rad/s\n', wBW);
fprintf('Phase Margin = %.4f deg\n', Pm);
fprintf('Gain Margin = %.4f\n', Gm);
fprintf('Gain Crossover Frequency = %.4f rad/s\n', Wcg);
fprintf('Phase Crossover Frequency = %.4f rad/s\n', Wcp);
fprintf('Damping Ratio = %.4f\n', z);
fprintf('Percent Overshoot = %.4f %%\n', Po*100);
fprintf('Settling Time = %.4f sec\n', Ts);
fprintf('Peak Time = %.4f sec\n', Tp);