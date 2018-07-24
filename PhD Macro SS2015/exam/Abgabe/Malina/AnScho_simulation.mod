/////////////////////////////////////////////////////////////
////    Model:  An and Schorfheide (2007)    		 	 ////
////    Author:  Willi Mutschler (willi@mutschler.eu)    ////
////    Version: August 04, 2015    			   		 ////
////    Augmented by Christiane Malina to simulate data    ////
////    on observables                                     ////
/////////////////////////////////////////////////////////////
set_dynare_seed(123);
var y c p R g z YGR INFL INT;
varexo e_z e_g e_R;




parameters tau kap psi1 psi2 rhoR rhog rhoz r_A p_A gam_Q stdR stdg stdz;

tau     = 2.00; 
kap     = 0.15;
psi1    = 1.50; 
psi2    = 1.00;  
rhoR    = 0.60; 
rhog    = 0.95;
rhoz    = 0.65;
p_A     = 4.00; 
r_A     = 4.00;
gam_Q   = 0.50;
stdR    = 0.20; 
stdg    = 0.80; 
stdz    = 0.45; 

model;
#bet = 1/(1+r_A/400);
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
c    = 0; 
p    = 0;
y    = 0;
R    = 0;
g    = 0;
z    = 0;
YGR  = gam_Q;
INFL = p_A;
INT  = p_A + r_A + 4*gam_Q;
end;

steady;
check;
resid;

stoch_simul(periods=5000);
