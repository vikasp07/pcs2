clc; 
clear;
close all;
% % System - 1
A =[0 1 0; 0 0 1; 1 -3 2];
B =[0 0 2]';
% Step 01: Check the controllable
Qc = ctrb(A, B);
if rank(Qc)==length(A)
   disp('The system-1 is full state controllable')
else
   disp('The system-1 is not full state controllable')
end
%Step 02: Obtain the closed-loop characteristic polynomial
syms s k1 k2 k3; % declare the symbols
% state feedback matrix
K = [k1 k2 k3];
%closed loop matrix
Ac = A-B*K;
%closed-loop characteristic polynomial;
Pd = charpoly(Ac);
%Desired pole location -1,-2,-3
Pc = poly([-1 -2 -3]);
%Step 03: Obtain state feedback matrix by comparing desired and
% closed-loop characteristic polynomial
delta = Pc-Pd; %LHS-RHS=0
sol = solve(delta, [k1 k2 k3]);
k1 = double(sol.k1);
k2 = double(sol.k2);
k3 = double(sol.k3);
%state feedback matrix
K = [k1 k2 k3];
disp('closed loop eigenvalues are: ')
eig(A-B*K)
% % Open and Closed Loop responses;
% assume y=x1; So
C = [1 0 0]; D = 0;
% Open loop System
sys = ss(A, B, C, D);
%Step Response of Open loop system
figure(1)
step(sys);
%closed loop system
sysc = ss(A-B*K, B, C, D);
%step response
figure(2)
step(sysc)
% % Alternate method
% Step 02: Compute state feedback matrix
K1 = place(A, B, [-1 -2 -3]);
eig(A-B*K1)
