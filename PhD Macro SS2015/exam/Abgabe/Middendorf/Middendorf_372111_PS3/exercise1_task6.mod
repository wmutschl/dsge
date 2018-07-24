%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%    author: Mathias Middendorf,                                    %%%%
%%%%            matriculation number: 372111                           %%%%
%%%%	        Exercise Baxter and King (1993) - task 6               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% task 6 - permanent increase in the tax rate of one percentage point

% Since you have to do the same steps as in exercise 4 (and 5), I only 
% mention if there are differences.

% Because I do not know whether the shock already affects the economy today
% or in the future, I make a scenario choice again. But since the 
% adjustment of the tax rate is announced, there are no differences in the
% results.

% scenario 1: tax rate shock immediately affects the economy
% scenario 2: tax rate shock affects the economy (permanently) in period
%             6 and the subsequent periods

@#define scenario = 2

%----------------------------------------------------------------
% 1. Definition of variables and parameters 
%----------------------------------------------------------------	

    var tau w c n k i k_b i_b y z r g_b tr dy dc di dn dw dr dtr dg_b di_b
        lambda;   
    
    varexo eps_z eps_g_b eps_i_b eps_tau;   

    parameters theta_l beta delta alpha eta rho_z sigma_z rho_g_b sigma_g_b
               rho_i_b sigma_i_b rho_tau sigma_tau g_b_ss i_b_ss y_ss c_ss
               i_ss n_ss w_ss r_ss tr_ss z_ss tau_ss k_ss k_b_ss;   
  
%----------------------------------------------------------------
% 2. Calibration: Set inital values for parameters
%----------------------------------------------------------------

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

model;   

    (1-tau)*w = theta_l*c/(1-n);
    lambda = beta*lambda(+1)*(1-delta+(1-tau(+1))*r(+1));
    lambda = 1/c;
    k = (1-delta)*k(-1)+i;
    k_b = (1-delta)*k_b(-1)+i_b;
    y = z*(k_b(-1))^eta*(k(-1))^alpha*(n^(1-alpha));
    w*n = (1-alpha)*y;
    r*k(-1) = alpha*y;
    log(z/z_ss) = rho_z*log(z(-1)/z_ss)+eps_z;
    g_b+i_b+tr = tau*(w*n+r*k(-1));
    g_b-g_b_ss = rho_g_b*(g_b(-1)-g_b_ss)+eps_g_b;
    i_b-i_b_ss = rho_i_b*(i_b(-1)-i_b_ss)+eps_i_b;
    log(tau/tau_ss) = rho_tau*log(tau(-1)/tau_ss)+eps_tau;
    y = c+i+g_b+i_b;
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
% 4. Steady-States
%----------------------------------------------------------------

% As stated in the text (Problem Set 3, p. 11), I use the old steady-state
% values as starting points for the new steady-state.

initval;

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
% 5. Calculations
%----------------------------------------------------------------

    steady; check; resid;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% task 6 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The initval-Block computes the old steady-state again, the endval-block
% instead calculates the new steady-state (with an increase in the tax 
% rate of one percentage point).

@#if scenario == 1

initval;
    eps_tau = 0;
end;
    steady;

endval;
    eps_tau = 0.011113;
end;
    steady;

% The (in the following) generated figures show the transition path of all
% endogenous variables to their new steady-state value.

    simul(periods=300);

    rplot tau; rplot w; rplot c; rplot n; rplot k; rplot i; rplot k_b;
    rplot i_b; rplot y; rplot z; rplot r; rplot g_b; rplot tr; rplot dy;
    rplot dc; rplot di; rplot dn; rplot dw; rplot dr; rplot dtr; 
    rplot dg_b; rplot di_b; rplot lambda;   

@#endif

% Scenario 2 considers the case where the shock affects the economy in 
% period 6 and onwards.

@#if scenario == 2

initval;
    eps_tau = 0;
end;
    steady;

endval;
    eps_tau = 0.011113;
end;
    steady;

shocks;
    var eps_tau;
    periods 1:5; 
    values 0;
end;

    simul(periods=300);

    rplot tau; rplot w; rplot c; rplot n; rplot k; rplot i; rplot k_b;
    rplot i_b; rplot y; rplot z; rplot r; rplot g_b; rplot tr; rplot dy;
    rplot dc; rplot di; rplot dn; rplot dw; rplot dr; rplot dtr; 
    rplot dg_b; rplot di_b; rplot lambda;   

@#endif


