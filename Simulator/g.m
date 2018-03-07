function xplus = g(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file               Author: Torstein Ingebrigtsen B??
%
% Project: Simulation of a hybrid system (bouncing ball)
%
% Description: Jump map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% state
x1 = x(1);
x2 = x(2);
z1 = x(3);
z2 = x(4);
tau1=x(5);
tau2=x(6);
tt=x(7);
global T1_1 T1_2 T2_1 T2_2
%lambda=rand(1,1);
x=[x1 x2]';
z=[z1 z2]';
a1=(T2_1-T1_1)/2;
b1=1/2*(T2_1+T1_1);
a2=(T2_2-T1_2)/2;
b2=1/2*(T2_2+T1_2);
taunext1=a1*sin(tt)+b1;
taunext2=a2*sin(10*tt)+b2;
if (tau1<=0)
xplus=[x;[x1;z2];taunext1;tau2;tt];
elseif (tau2<=0)
xplus=[x;[z1;x2];tau1;taunext2;tt];
end
end