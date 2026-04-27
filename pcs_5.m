
clc;
clear all;
close all;
Gh1 = tf([1],[1 2 2 0]) ;%chnage this acc to TF
rlocus(Gh1)
