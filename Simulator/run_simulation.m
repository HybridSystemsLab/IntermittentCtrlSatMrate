
%specify initial conditions for the plant state, controller state, and
%timers tau_1 and tau_2
xp_0=[-2 -4];
xc_0=[0 0];
tau1_0=T2_1;
tau2_0=T2_2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=[xp_0,xc_0,tau1_0, tau2_0];
Out=run(x0);
x=Out(:,1:8);
xplant=x(:,1:2);
xc=x(:,3:4);
tau1=x(:,5);
j=Out(:,8);
t=Out(:,7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(xplant(:,1), xplant(:,2),'-b'); %plot the plant state trajectory





