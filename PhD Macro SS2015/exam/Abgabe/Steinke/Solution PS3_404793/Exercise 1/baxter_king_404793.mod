% Carmen Steinke
% 404793 (Master)
% 
%--------------------------------------------------------------------------
% Simulation of the Baxter and King (1993) model 
%--------------------------------------------------------------------------
%
%set_dynare_seed(123); %This should be "commented in" for the random number generator. However, 
%                       in order to be able to compare exact values I have taken it out.
%
%---------------------------------------------------------------------------------------------
% Declaration of variables and parameters
%% Endogenous and exogenous variables as well as the paramters have been defined in exercise 1.
%---------------------------------------------------------------------------------------------


var c dc di di_b dg_b dn dw dr dtr dy g_b i i_b k k_b lambda n r tau tr w y z;
% Definition of endogenous variables

varexo  epsilon_g_b epsilon_i_b epsilon_tau epsilon_z;
% Definition of exogenous variables

parameters alpha beta delta eta rho_g_b rho_i_b rho_z rho_tau theta_l c_bar 
g_b_bar i_bar i_b_bar k_b_bar n_bar r_bar tau_bar tr_bar w_bar y_bar z_bar;   
% Definition of parameters  

%--------------------------------------------------------------------------
% Calibration of parameters
%% For more information on the calibration see exercise 2.
%--------------------------------------------------------------------------

alpha       = (1/3);    
beta        = 0.988;    
delta       = 0.025;       
eta         = 0.05;      
theta_l     = 1.7192;      

rho_g_b     = 0.75;     
rho_i_b     = 0.75;     
rho_z       = 0.75;     
rho_tau     = 0.75;     
 
 c_bar       = 0.6049;
 i_bar       = 0.1751;
 r_bar       = 0.0476;
 g_b_bar     = 0.2;          
 i_b_bar     = 0.02;
 k_b_bar     = 0.8;
 n_bar       = (1/3);
 tau_bar     = 0.22;
 tr_bar      = 0;
 w_bar       = 2;
 y_bar       = 1;
 z_bar       = 1.0994; 


%-------------------------------------------------------------------------------------------
% Model equations 
%% Here we specify the model using all relevant model equations, marked from (1) to (23)
%% and using the above specified variables and parameters.  
%-------------------------------------------------------------------------------------------

model;
    %(1)
    (1-tau)*w = theta_l*(c/(1-n)); 
   
    %(2)
    lambda = beta*(lambda(+1)*((1-delta)+(1-tau(+1))*r(+1))); 

    %(3)
    lambda = 1/c; 

    %(4)
    k = (1-delta)*k(-1)+i; %law of motion for the capital stock   
  
    %(5)
    k_b = (1-delta)*k_b(-1)+i_b;                                  

    %(6)
    y = z*k_b(-1)^(eta)*k(-1)^(alpha)*n^(1-alpha);                

    %(7) 
    w*n = (1-alpha)*y;                             

    %(8)
    r*k(-1) = alpha*y;     

    %(9)
    log(z/z_bar) = rho_z*log(z(-1)/z_bar)+epsilon_z;    

    %(10)
    g_b+i_b+tr = tau*(w*n+r*k(-1));                

    %(11)
    g_b-g_b_bar = (rho_g_b*(g_b(-1)-g_b_bar))+epsilon_g_b;    
    
    %(12)
    i_b-i_b_bar = rho_i_b*(i_b(-1)-i_b_bar)+epsilon_i_b;      

    %(13)
    log(tau/tau_bar)=rho_tau*log(tau(-1)/tau_bar)+epsilon_tau;  

    %(14)
    y=c+i+g_b+i_b; 

    %(15)
    dy=100*(y-y_bar)/y_bar; 

    %(16)
    dc=100*(c-c_bar)/c_bar; 

    %(17)
    di=100*(i-i_bar)/i_bar;

    %(18)
    dn=100*(n-n_bar);
    
    %(19)
    dw=100*(w-w_bar)/w_bar;
    
    %(20)
    dr=100*(r-r_bar);
    
    %(21)
    dtr=100*(tr-tr_bar);

    %(22)
    dg_b=100*((g_b/y)-(g_b_bar/y_bar));

    %(23)
    di_b=100*((i_b/y)-(i_b_bar/y_bar));

end;

% -------------------------------------------------------------------------
% Steady state values
%% Here we set the start values for the estimation. 
%% The values are taken from the steady state values derived in exercise 2. 
% -------------------------------------------------------------------------
initval;
   c     = 0.6049;
   g_b   = 0.2;
   i     = 0.1751;
   i_b   = 0.02;
   k     = 7.0028;
   k_b   = 0.8;
   lambda= 1.6532;
   n     = (1/3);
   r     = 0.0476;
   tau   = 0.22;
   tr    = 0;
   w     = 2;
   y     = 1;
   z     = 1.0994;
end;

%--------------------------------------------------------------------------
% Computations
%--------------------------------------------------------------------------

% Scenario 0: Compute steady-state,check Blanchard-Khan and residuals of model equations in steady-state
% Scenario 1: Unexpected deterministic shock: (i) unexpected temporary public consumption shock and 
%             (ii) unexpected temporary public investment shock
% Scenario 2: Unexpected permanent increase in tax rate (deterministic shock)

%--------------------------------------------------------------------------
%% Please choose your scenario here: 
@# define scenario = 2
%--------------------------------------------------------------------------

@# if scenario == 0
steady; 
check;
resid;
@# endif
%--------------------------------------------------------------------------

@# if scenario == 1
shocks;
    var epsilon_g_b = 0.0001;
    var epsilon_i_b = 0.0001;
   end;

stoch_simul(order=1,irf=100,periods=200);
@# endif
%--------------------------------------------------------------------------

@# if scenario == 2
initval;
    epsilon_tau = 0;
    end;
    steady(solve_algo=3); 

    endval;
    epsilon_tau = log(0.23/0.22)-0.75*log(0.23/0.22);
    end;
    steady(solve_algo=3); 

    simul(periods=200);
    rplot tau;
    rplot dc;
    rplot di;
    rplot dy;
    rplot dn;
    rplot dw;
    rplot dr;
    rplot dtr;
@# endif
