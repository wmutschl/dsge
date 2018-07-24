%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%    author: Mathias Middendorf,                                    %%%%
%%%%            matriculation number: 372111                           %%%%
%%%%	        Exercise Baxter and King (1993) - task 4 and 5         %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Because I do not want to write several files for each modification (which  
% only differ slightly due to other specified shocks or parameters), I use 
% the following scenario choice for task 4 and 5:

@#define scenario = 3

% scenario 1: scenario 1 gives you the solution of task 4 (without any 
%             calculations (there is only checked whether you can do 
%             computations with the model)). 
% scenario 2: task 5 - unexpected temporary public consumption and 
%             investment shock with eta equal to its base level (0.05)
% scenario 3: task 5 - unexpected temporary public consumption and invest-
%             ment shock with eta equal to a higher level (0.10)

%----------------------------------------------------------------
% 1. Definition of variables and parameters 
%----------------------------------------------------------------	

% This block gives information about the question which variables are 
% endogenous and exogenous and gives the parameters of the model. Since a
% steady-state value is a fix number, the steady-states are treated as
% "parameters".

    var tau w c n k i k_b i_b y z r g_b tr dy dc di dn dw dr dtr dg_b di_b
        lambda;   % endogenous variables (same order as in task 1)
    
    varexo eps_z eps_g_b eps_i_b eps_tau;   % exogenous variables (same  
           % order as in task 1)

    parameters theta_l beta delta alpha eta rho_z sigma_z rho_g_b sigma_g_b
               rho_i_b sigma_i_b rho_tau sigma_tau g_b_ss i_b_ss y_ss c_ss
               i_ss n_ss w_ss r_ss tr_ss z_ss tau_ss k_ss k_b_ss;   
               % parameters: in contrast to task 1 the standard deviations
               % instead of the variances of the shocks are considered
               % here and ss stands for steady-state (same order as in
               % task 1)
  
%----------------------------------------------------------------
% 2. Calibration: Set inital values for parameters
%----------------------------------------------------------------

% The values and derivations of the parameters (which are functions of 
% other parameters) are taken from task 2. Based on these values you 
% can simulate (realistic) data.

    beta        =   0.9900;
    delta       =   0.0250;
    rho_z       =   0.7500;
    rho_g_b     =   0.7500;
    rho_i_b     =   0.7500;
    rho_tau     =   0.7500;
    sigma_z     =   0.0100;
    sigma_g_b   =   0.0100;
    sigma_i_b   =   0.0100;
    sigma_tau   =   0.0100;
    n_ss        =   1/3;
    w_ss        =   2.0000;
    tr_ss       =   0;
    y_ss        =   1.0000;
    g_b_ss      =   0.2000*y_ss;
    i_b_ss      =   0.0200*y_ss; 
    alpha       =   1-(w_ss*n_ss)/y_ss;
    eta         =   0.05;
@#if scenario == 3
    eta = 0.10; 
@#endif
    tau_ss      =   (g_b_ss+i_b_ss+tr_ss)/(w_ss*n_ss+alpha*y_ss);
    r_ss        =   (1/beta-1+delta)/(1-tau_ss);
    k_ss        =   alpha*y_ss/r_ss;
    i_ss        =   delta*k_ss;
    c_ss        =   y_ss-i_ss-g_b_ss-i_b_ss;
    k_b_ss      =   i_b_ss/delta;
    z_ss        =   y_ss/((k_b_ss^eta)*(k_ss^alpha)*(n_ss^(1-alpha)));
    theta_l     =   ((1-tau_ss)*w_ss*(1-n_ss))/c_ss;
   
%----------------------------------------------------------------
% 3. Model equations
%----------------------------------------------------------------

% The model equations are given on the exercise sheet. Here I use the same 
% order (equation (1) - (23)).

model;   

% Households:    
    (1-tau)*w = theta_l*c/(1-n);
    lambda = beta*lambda(+1)*(1-delta+(1-tau(+1))*r(+1));
    lambda = 1/c;
    k = (1-delta)*k(-1)+i;
    k_b = (1-delta)*k_b(-1)+i_b;
% Firms:
    y = z*(k_b(-1))^eta*(k(-1))^alpha*(n^(1-alpha));
    w*n = (1-alpha)*y;
    r*k(-1) = alpha*y;
    log(z/z_ss) = rho_z*log(z(-1)/z_ss)+eps_z;
% Fiscal authority:
    g_b+i_b+tr = tau*(w*n+r*k(-1));
    g_b-g_b_ss = rho_g_b*(g_b(-1)-g_b_ss)+eps_g_b;
    i_b-i_b_ss = rho_i_b*(i_b(-1)-i_b_ss)+eps_i_b;
    log(tau/tau_ss) = rho_tau*log(tau(-1)/tau_ss)+eps_tau;
% Market clearing:
    y = c+i+g_b+i_b;
% Observables:
    dy = 100*((y-y_ss)/y_ss);
    dc = 100*((c-c_ss)/c_ss);
    di = 100*((i-i_ss)/i_ss);
    dn = 100*(n-n_ss);
    dw = 100*((w-w_ss)/w_ss);
    dr = 100*(r-r_ss);
    dtr = 100*(tr-tr_ss);
    dg_b = 100*((g_b/y)-(g_b_ss/y_ss));
    di_b = 100*((i_b/y)-(i_b_ss/y_ss));

end;

%----------------------------------------------------------------
% 4. Specification of the shocks
%----------------------------------------------------------------

% All shocks are identical and independent normally distributed
% (with expectation zero and a small standard deviation of 0.01).

@#if scenario == 1

shocks;

    var eps_z; stderr sigma_z;
    var eps_g_b; stderr sigma_g_b;
    var eps_i_b; stderr sigma_i_b;
    var eps_tau; stderr sigma_tau;

end;        

@#endif
   
%----------------------------------------------------------------
% 5. Steady-States
%----------------------------------------------------------------

% The (derived) values are taken from task 2.

steady_state_model;

    y = y_ss;
    g_b = 0.20*y_ss;
    i_b = 0.02*y_ss;
    tr = 0;
    w = 2;
    n = 1/3;
    dy = 0;
    dc = 0;
    di = 0;
    dn = 0;
    dw = 0;
    dr = 0;
    dtr = 0;
    dg_b = 0;
    di_b = 0;
    tau = (g_b+i_b+tr)/(w*n+alpha*y);
    r = (1/beta-1+delta)/(1-tau);
    k = alpha*y/r;
    i = delta*k;
    c = y-i-g_b-i_b;
    lambda = 1/c;
    k_b = i_b/delta;
    z = y/((k_b^eta)*k^alpha*n^(1-alpha));

end;    
  
%----------------------------------------------------------------
% 6. Calculations
%----------------------------------------------------------------

% Checking whether computation of steady-states is possible, Blanchard-Khan 
% conditions are satisfied (i.e. model is stable) and that the residuals
% of each model equation is indeed zero (at steady-state values):

    steady; check; resid;

% result: Computation of steady-states possible, Blanchard-Khan conditions 
% satisfied and all residuals are zero.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% task 5 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The description of the shocks is given in task 5, p. 6-7 (i.e. shocks 
% occur unexpected and temporary, with an amount of (the same) one unit 
% change and the response of the observables is modelled over 200 periods).
    
@#if scenario == 2 

    shocks; 
    var eps_g_b = 1;
    var eps_i_b = 1;
    end;
    stoch_simul(periods=0, irf=200, order=1, nomoments) dy dc di dn dw dr dtr dg_b di_b; 

@#endif

% As stated above, we use exactlx the same code for scenario 3, but 
% consider that eta takes on a higher value (compared to scenario 2) to
% evaluate the effect of a higher productivity of public capital.
    
@#if scenario == 3 

    shocks; 
    var eps_g_b = 1;
    var eps_i_b = 1;
    end;
    stoch_simul(periods=0, irf=200, order=1, nomoments) dy dc di dn dw dr dtr dg_b di_b; 

@#endif
    

    