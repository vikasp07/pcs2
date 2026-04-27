%%Nyquist plot =G(s) H(s)=1/s^2+2s%%
sys =tf(1,[1,2,0]);
n=nyquistplot(sys);
