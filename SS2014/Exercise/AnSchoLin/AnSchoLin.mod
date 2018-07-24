var y c p R g z YGR INFL INT;
varexo e_z e_g e_R;
parameters tau kap psi1 psi2 rhoR rhog rhoz r_A p_A gam_Q stdR stdg stdz bet dumpy;
varobs YGR INFL INT;

tau =2; psi1=1.5; psi2=1; rhoR =0.6; rhoz=0.65; rhog=0.95;
stdR = 0.2; stdg =0.8; stdz = 0.45; p_A =4; gam_Q=0.5; r_A =4;
bet = 1/(1+r_A/400); kap=0.15;

model;
y = y(+1) + g - g(+1) -1/tau*(R-p(+1)-z(+1));
p = bet*p(+1) + kap*(y-g);
c = y-g;
R = rhoR*R(-1) + (1-rhoR)*psi1*p + (1-rhoR)*psi2*(y-g) + stdR/100*e_R;
g = rhog*g(-1) + stdg/100*e_g;
z = rhoz*z(-1) + stdz/100*e_z;
YGR = gam_Q + 100*(y-y(-1)+z);
INFL = p_A + 400*p;
INT = p_A + r_A + 4*gam_Q+400*R;
end;

shocks;
var e_R; stderr 1;
var e_g; stderr 1;
var e_z; stderr 1;
end;

steady_state_model;
c=0;p=0;y=0;R=0;g=0;z=0;
YGR=gam_Q;
INFL = p_A;
INT = p_A + r_A + 4*gam_Q;
end;

%identification;
%steady;check;
% Simulate 1000 periods
%stoch_simul(order=1,irf=70,periods=1000);    
% Save data to mat file
%save('simdat','YGR','INFL','INT');

%%%%% Maximum Likelihood %%%%%%%
% parameter, startwert, untere grenze, obere grenze
estimated_params;
    tau,   2, 1, 3;
    kap, 0.15, 0.01, 0.2;
    %psi1, 1.5, 1, 2;
    psi2, 2;
    rhoR, 0.6; 
    rhoz, 0.65; 
    rhog, 0.95;
    stdR,0.2; 
    stdg,0.8; 
    stdz,0.45; 
    p_A,4; 
    gam_Q,0.5; 
    r_A,4;
end;
estimation(datafile=simdat,nobs=1000,first_obs=1,mode_check,mode_compute=9);        
% 
% 
% 
