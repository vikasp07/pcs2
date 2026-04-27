%For Type 0 Systems
s = tf('s');
G = 1/((s+2) * (s+3));
sys_cl = feedback(G,1);
[y,t] = step(sys_cl);
u = ones(size(t));
%Plot the response with custom colors
figure; %Open a new figure window
plot(t,y,'b',t,u,'b--')
axis([0,2.9,0,1.1])
xlabel('Time (secs)')
ylabel('Amplitude')
title('Type 0 System - STEP INPUT')
hold on;
s = tf('s');
G = 1/((s+2)* (s+3));
t = 0:0.1:200;
u = t;
[y,t,x] = lsim(sys_cl, u, t);
plot(t,y,'r',t,u,'r--')
xlabel('Time (secs)')
ylabel('Amplitude')
title('Type 0 System - Ramp Input')
hold on;
s = tf('s');
G = 1/((s+2)* (s + 3));
sys_cl = feedback(G,1);
t = 0:0.1:200;
u = 0.5*t.*t;
[y,t,x] = lsim(sys_cl,u,t);
plot(t,y,'g',t,u,'g--')
xlabel('Time (secs)')
ylabel('Amplitude')
title('Type 0 System - STEP, RAMP, PARABOLIC INPUT')



%For Type 1 Systems
G = 1/(s * (s+2) * (s+3));
sys_cl = feedback(G,1);
[y,t] = step(sys_cl);
u = ones(size(t));
%Plot the response with custom colors
figure; %Open a new figure window
plot(t,y,'b',t,u,'b--')
axis([0,2.9,0,1.1])
xlabel('Time (secs)')
ylabel('Amplitude')
title('Type 1 System - STEP INPUT')
hold on;
s = tf('s');
G = 1/(s * (s+2)* (s+3));
t = 0:0.1:200;
u = t;
[y,t,x] = lsim(sys_cl, u, t);
plot(t,y,'r',t,u,'r--')
xlabel('Time (secs)')
ylabel('Amplitude')
title('Type 1 System - Ramp Input')
hold on;
s = tf('s');
G = 1/(s * (s+2)* (s + 3));
sys_cl = feedback(G,1);
t = 0:0.1:200;
u = 0.5*t.*t;
[y,t,x] = lsim(sys_cl,u,t);
plot(t,y,'g',t,u,'g--')
xlabel('Time (secs)')
ylabel('Amplitude')
title('Type 1 System - STEP, RAMP, PARABOLIC INPUT')

