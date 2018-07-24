%////    Baxter/King (1993)  ////
%////    Author:   Kim Leonie Kellermann                  ////
%////    Version: September 3, 2015					   	  ////
%/////////////////////////////////////////////////////////////
% Specifiy different scenarios for the exercises!
% scenario = 1: Stochastic model - temporary shock on public consumption
% scenario = 2: Stochastic model - temporary shock on public investment
% scenario = 3: Stochastic model - temporary shock on public consumption (larger productivity of public capital)
% scenario = 4: Stochastic model - temporary shock on public investment (larger productivity of public capital)
% scenario = 5: Deterministic model - permanent shock on the tax rate
@#define scenario = 5

%% ----------------------------------------------------------------
% Preamble: Declare variables and parameters.
%----------------------------------------------------------------
    var c dc di di_b dg_b dn dw dr dtr dy g_b i i_b k k_b lambda n r tau tr w y z; % DECLARATION OF THE ENDOGENOUS VARIABLES    
    varexo eps_g_b eps_i_b eps_tau eps_z; % DECLARATION OF THE EXOGENOUS VARIABLES 
    varobs y c i w n r tr g_b i_b; % DECLARATION OF THE OBSERVABLE VARIABLES
    parameters alpha beta delta eta rho_g_b rho_i_b rho_z rho_tau theta_l c_bar 
    g_b_bar i_bar i_b_bar k_b_bar n_bar r_bar tau_bar tr_bar w_bar y_bar z_bar; % DECLARATION OF THE PARAMETERS

%% ----------------------------------------------------------------
% Calibration: Set inital values for parameters
%----------------------------------------------------------------
alpha       = (1/3);    % private capital share in production
beta        = 0.988;     % discount rate
delta       = 0.05;      % depreciation rate   
eta         = 0.2;      % productivity of public capital, must be set to a higher value to solve ex. 5
theta_l     = 1.8217;      

rho_g_b     = 0.75;     % see exercise!
rho_i_b     = 0.75;     %
rho_z       = 0.75;     %
rho_tau     = 0.75;     %
 
 c_bar       = 0.5709; % See calibration
 i_bar       = 0.2091;
 r_bar       = 0.0797;
 g_b_bar     = 0.2;          
 i_b_bar     = 0.02;
 k_b_bar     = 0.4;
 n_bar       = (1/3);
 tau_bar     = 0.22;
 tr_bar      = 0;
 w_bar       = 2;
 y_bar       = 1;
 z_bar       = 1.5507;  


    @#if scenario > 2
        eta         = 0.4; %higher productivity of public capital in the third and fourth scenario
    @#endif
   
     @#if scenario > 4
        eta         = 0.2; %lower productivity of public capital again
    @#endif

%% ----------------------------------------------------------------
% Model equations. 
%----------------------------------------------------------------
model;
    (1-tau)*w = theta_l*(c/(1-n)); % consumption-leisure choice
    lambda = beta*(lambda(+1)*((1-delta)+(1-tau(+1))*r(+1))); % savings decision
    lambda = 1/c; % marginal utility of consumption
    k = (1-delta)*k(-1)+i; %law of motion for the private capital stock   
    k_b = (1-delta)*k_b(-1)+i_b; % law of motion for the public capital stock
    y = z*k_b(-1)^(eta)*k(-1)^(alpha)*n^(1-alpha); % firms' budget constraint
    w*n = (1-alpha)*y;     % factor demand                        
    r*k(-1) = alpha*y;     % factor demand
    log(z/z_bar) = rho_z*log(z(-1)/z_bar)+eps_z;    % law of motion for productivity
    g_b+i_b+tr = tau*(w*n+r*k(-1));                % fiscal budget constraint
    g_b-g_b_bar = (rho_g_b*(g_b(-1)-g_b_bar))+eps_g_b;    % public consumption
    i_b-i_b_bar = rho_i_b*(i_b(-1)-i_b_bar)+eps_i_b;      % public investment
    log(tau/tau_bar)=rho_tau*log(tau(-1)/tau_bar)+eps_tau;  % taxes

    y=c+i+g_b+i_b; % deviations
    dy=100*(y-y_bar)/y_bar; 
    dc=100*(c-c_bar)/c_bar;  
    di=100*(i-i_bar)/i_bar;
    dn=100*(n-n_bar)/n_bar; 
    dw=100*(w-w_bar)/w_bar; 
    dr=100*(r-r_bar);
    dtr=100*(tr-tr_bar); 
    dg_b=100*((g_b/y)-(g_b_bar/y_bar));
    di_b=100*((i_b/y)-(i_b_bar/y_bar));

end;

% -----------------------------------
% Steady state values as computed
% -----------------------------------
initval;
   c     = 0.5709;
   g_b   = 0.2;
   i     = 0.2091;
   i_b   = 0.02;
   k     = 4.1824;
   k_b   = 0.4;
   lambda= 1.7516;
   n     = (1/3);
   r     = 0.0797;
   tau   = 0.22;
   tr    = 0;
   w     = 2;
   y     = 1;
   z     = 1.5507;
end;

steady; check; resid;

%% ----------------------------------------------------------------
% SCENARIO 1: Stochastic model - temporary shock on public consumption
%----------------------------------------------------------------
@#if scenario == 1
    shocks;
    var eps_g_b = 0.0001; % shock to public consumption
    end;
    stoch_simul(order=1,irf=100,periods=200); %stochastic simulation
@#endif

%% ----------------------------------------------------------------
% SCENARIO 2: Stochastic model - temporary shock on public investment
%----------------------------------------------------------------
@#if scenario == 2
    shocks;
    var eps_i_b = 0.0001; % shock to public consumption
    end;
    stoch_simul(order=1,irf=100,periods=200); %stochastic simulation
@#endif

%% ----------------------------------------------------------------
% SCENARIO 3: Stochastic model - temporary shock on public consumption (larger productivity of public capital)
%----------------------------------------------------------------
@#if scenario == 3
    shocks;
    var eps_g_b = 0.0001; % shock to public consumption
    end;
    stoch_simul(order=1,irf=100,periods=200); %stochastic simulation
@#endif

%% ----------------------------------------------------------------
% SCENARIO 4: Stochastic model - temporary shock on public investment (larger productivity of public capital)
%----------------------------------------------------------------
@#if scenario == 4
    shocks;
    var eps_i_b = 0.0001; % shock to public consumption
    end;
    stoch_simul(order=1,irf=100,periods=200); %stochastic simulation
@#endif

%% ----------------------------------------------------------------
% SCENARIO 5: Deterministic model - permanent shock on the tax rate
%----------------------------------------------------------------
@#if scenario == 5
initval;
    eps_tau = 0;
    end;
    steady(solve_algo=3); %old steady state

    endval;
    eps_tau = 0.01; %New value
    end;
    steady(solve_algo=3); %new steady state

    simul(periods=200); %deterministic simulation
    rplot tau; % plots
    rplot dc;
    rplot di;
    rplot dy;
    rplot dn;
    rplot dw;
    rplot dr;
    rplot dtr;
@#endif