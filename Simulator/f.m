function xdot = f(x)   
% state
x1 = x(1);
x2 = x(2);
z1 = x(3);
z2 = x(4);
tau1=x(5);
tau2=x(6);
tt=x(7);
global A K ubar_1 B
%lambda=rand(1,1);
x=[x1 x2]';
z=[z1 z2]';
K2=[0,K(1,2)];
u1=min(abs(K(1,1:2)*z),ubar_1)*sign(K(1,1:2)*z);
if(tt<=1)
    w=1;
elseif(tt>1&&tt<=2.5)
    w=0;
else
    w=1;
end
xd=A*x+B*u1;
zd=A*z+B*u1;
% differential equations
xdot=[xd;zd;-1;-1;1];
end