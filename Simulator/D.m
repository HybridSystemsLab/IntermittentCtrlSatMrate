function inside = D(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Torstein Ingebrigtsen B??
%
% Description: Jump set
% Return 0 if outside of D, and 1 if inside D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tau1=x(5);
tau2=x(6);
if (tau1<=0||tau2<=0)
    inside = 1;
else
    inside = 0;
end
end