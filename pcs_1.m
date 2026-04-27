clc; 
close all; 
clear;

T = 0.5;
Num = 1;
Den = [T 1];        % Correct denominator (not a cell array)

Gs = tf(Num, Den);

% Step response using built-in function
figure(1)
step(Gs)
grid on;
xlabel('t')
ylabel('y(t)')
title('Step Response of First Order System')

% Analytical step response
t = 0:0.1:4.5;
yt = zeros(size(t));    % Preallocate for speed

for i = 1:length(t)
    yt(i) = 1 - exp(-t(i)/T);
end

figure(2)
plot(t, yt, 'r', 'LineWidth', 2)
grid on;
xlabel('t')
ylabel('y(t)')
title('Analytical Step Response of First Order System')
