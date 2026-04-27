a=[-1.5,-2;1,0];
b=[0.5;0];
c=[0,1];
d=1;
sys =ss(a,b,c,d);
co=ctrb(sys);
rank(co)
ob=obsv(sys);
rank(ob)
