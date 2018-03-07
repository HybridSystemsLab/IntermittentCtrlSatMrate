clear all;

A=[-0.8000   -0.0100;
    1.0000    0.1000];

B=[0.4000;
   0.1000];
 
K=[-1.2625   -1.2679];

ubar_1=1;

np=max(size(A));
nu=min(size(B));
np1=1;
np2=1;

W=sdpvar(np,np,'symmetric');
Mw=sdpvar(np,np,'symmetric');
R1=sdpvar(np1,np1,'symmetric');
R2=sdpvar(np2,np2,'symmetric');
Z1=sdpvar(nu,np,'full');
G2=sdpvar(nu,np,'full');
delta=sdpvar(1,1,'full');
S=diag(sdpvar(nu,1));
Q=blkdiag(R1,R2);

sigma1=1.8;
sigma2=2.3;

T1_1=0.1;
T1_2=T1_1;
T2_1=0.3;
T2_2=2.35*T2_1;

Phi1=blkdiag(1,1);  
Phi2=blkdiag(exp(sigma1*T2_1),1);  
Phi3=blkdiag(1,exp(sigma2*T2_2)); 
Phi4=blkdiag(exp(sigma1*T2_1),exp(sigma2*T2_2));
PhiList{1}=Phi1;
PhiList{2}=Phi2;
PhiList{3}=Phi3;
PhiList{4}=Phi4;

Sigma=blkdiag(sigma1,sigma2);

Ptilde0=blkdiag(W,Q);

V1=[Z1'; G2'];

Poly_1=[Ptilde0, V1;
      V1', ubar_1^2*delta];
 
problem=Poly_1>=0; 

for i=1:4
Phi=PhiList{i};

Ncal=[(A+B*K)*W+W*(A+B*K)', -B*K, B*S-W*K'-Z1';
    (-B*K)',(Q*Phi*A)+(Q*Phi*A)'-Sigma*Q*Phi, K'-G2';
    (B*S-W*K'-Z1')',(K'-G2')', -2*S];
 
Condition{i}=Ncal;

problem=problem+[Condition{i}<=-1e-6*eye(size(Condition{i}))];
end

Opt=[Mw, eye(np);eye(np) W];

problem=problem+[W>=1e-9*eye(np), delta>=0,R1>=1e-9*eye(np1),R2>=1e-9*eye(np2), Mw>=1e-9*eye(np), Opt>=0, Poly_1>=0];

options=sdpsettings('solver','mosek', 'verbose',2);
solution=solvesdp(problem,trace(Mw+R1*exp(sigma1*T2_1)+R2*exp(sigma2*T2_2))+delta,options);
trace(R1*exp(sigma1*T2_1)+R2*exp(sigma2*T2_2)+delta)
delta=double(delta);
P=inv(double(W));
Q=double(blkdiag(R1*exp(sigma1*T2_1),R2*exp(sigma2*T2_2)));
hold on;
grid on;
plotellisa((P+Q)*delta,[0,0],'-','g');

warning('off')
global A B K T1_1 T1_2 T2_1 T2_2 ubar_1;
