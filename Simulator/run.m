function out= run(x0)
x0(1)
x1_0 =x0(1);
x2_0 =x0(2);
x3_0 =x0(3);
x4_0 =x0(4);
x5_0 =x0(5);
x6_0 =x0(6);
x0 = [x1_0;x2_0;x3_0;x4_0;x5_0;x6_0;0];

% simulation horizon
TSPAN=[0  40];
JSPAN = [0 4000];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

options = odeset('RelTol',1,'MaxStep',0.5);

maxStepCoefficient = .5;  % set the maximum step length. At each run of the
                   % integrator the option 'MaxStep' is set to 
                   % (time length of last integration)*maxStepCoefficient.
                   %  Default value = 0.1

% simulate
[t x j] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options,maxStepCoefficient);
out=[x,j,t];

end
