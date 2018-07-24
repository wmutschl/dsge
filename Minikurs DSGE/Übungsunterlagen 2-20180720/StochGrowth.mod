% Stochastic Growth model solved by Dynare
%
% Author:       Fabian Goessling
% Email:        Fabian.Goessling@wiwi.uni-muenster.de
% This Version: 12.01.2016
%
% The .mod file provides the Dynare equivalent to the Klein_StochGrowth.m
% file. 


var c a k;
varexo u_e  ;          
                         
parameters beta alpha delta rho sigma; 

    beta    = 0.95;
    sigma   = 1;
    delta   = 0.01;
    alpha   = 0.33;
    rho     = 0.95;

model;
    0 = -c^(-sigma) + beta*c(+1)^(-sigma)*(alpha*exp(a(+1))*k^(alpha-1)+1-delta);
    0 = -k + exp(a)*k(-1)^alpha - c + (1-delta)*k(-1);
    0 = -a + rho*a(-1)+ u_e;
end;

shocks;
    var u_e; stderr 1;
        
end;

steady_state_model;
    k = ((1/beta - (1-delta))/alpha)^(1/(alpha-1));
    c = k^alpha + (1-delta)*k - k;
    a = 0;
end;

steady; check;

	
stoch_simul(order=1,irf=0);
   