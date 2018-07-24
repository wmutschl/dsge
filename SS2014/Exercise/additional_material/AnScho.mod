% Variablen und Parameter
var c R pie y g z YGR INFL INT;
varexo eps_R eps_g eps_z;
parameters beta tau v kap phi pi2 gst rho_R rho_g rho_z psi1 psi2 gamQ piA rA sigR sigg sigz;
varobs YGR INFL INT;
% Parameterwerte festlegen - kalibrieren
tau = 2; v =0.1; gst = 0.85; rho_R = 0.75; rho_g = 0.95; rho_z = 0.9;
psi1 = 1.5; psi2 =0.125; gamQ = 0.55; piA = 3.2; rA = 1; 
sigR =0.2; sigg =0.6; sigz = 0.3; kap = 0.33;
beta=1/(1+rA/400); pi2 = (1+piA/400)^2; phi = tau*(1-v)/v/kap/pi2;
% Modellgleichungen
model;
1 = exp(-tau*c(+1)+tau*c+R-z(+1)-pie(+1));% Gleichung 21
(1-v)/(v*phi*pi2)*(exp(tau*c)-1) = (exp(pie)-1)*((1-1/(2*v))*exp(pie)+1/(2*v))-beta*((exp(pie(+1))-1)*exp(-tau*c(+1)+tau*c+y(+1)-y+pie(+1))); %Gl 22
exp(c-y) = exp(-g) - phi*pi2*gst/2*(exp(pie)-1)^2; %Gl 23
R = rho_R*R(-1) + (1-rho_R)*psi1*pie + (1-rho_R)*psi2*(y-g) + eps_R; %Gl 24
g = rho_g*g(-1) + eps_g; %Gl 25
z = rho_z*z(-1) + eps_z; %Gl 26
%Measurement equations
YGR = gamQ + 100*(y-y(-1)+z);
INFL = piA + 400*pie;
INT = piA + rA + 4*gamQ+400*R;
end;
%%% Shocks spezifieren
shocks;
var eps_R; stderr sigR;
var eps_g; stderr sigg;
var eps_z; stderr sigz;
end;
%%%%%%%% Steady state
steady_state_model;
c=0; R=0; pie=0; y=0; g=0; z=0; 
YGR=gamQ; INFL=piA; INT=piA+rA+4*gamQ;
end;
%%% Kalkulationen
steady; check;
stoch_simul(order=2,pruning);