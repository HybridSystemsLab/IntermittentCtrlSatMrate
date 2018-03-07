function [value discrete] = C(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Torstein Ingebrigtsen B??
%
% Description: Flow set
% Return C if outside of D, and 1 if inside C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tau1=x(5);
tau2=x(6);
global T2_1 T2_2
if (tau1>=0 && tau1<=T2_1 && tau2>=0 && tau2<=T2_2);
   
    value = 1;
else
    value = 0;
end
end