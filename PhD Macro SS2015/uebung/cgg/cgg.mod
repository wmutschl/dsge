%/////////////////////////////////////////////////////////////
%////    The Clarida-Gali-Gertler model	 	              ////
%////    Based upon lecture notes of Lawrence Christiano  ////
%////    Author:   Willi Mutschler (willi@mutschler.eu)   ////
%////    Version: July 22, 2015					   		  ////
%////	 Goal: Practicing Dynare                     	  ////
%////    !!    Don't forget the semicolons  !!            ////
%/////////////////////////////////////////////////////////////
%   Note that I use DYNARE special language (@#), so we do not need to uncomment stuff below
%   That is, whenever you see " @# " the DYNARE preprocessor will execute only
%   those computations depending on the macro variable scenario
% scenario = 1: Deterministic model - temporary shock on technology
% scenario = 2: Stochastic model - temporary shock on technology
% scenario = 3: Stochastic model - Simulate data
% scenario = 4: Maximum Likelihood Estimation large sample size
% scenario = 5: Maximum Likelihood Estimation small sample size
% scenario = 6: Bayesian Estimation small sample size
% Set macro directive for which scenario (this is just for convenience), no semicolon
@#define scenario = 6




%% ----------------------------------------------------------------
% Preamble: Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
    var pie x r rstar da tau dy; % DECLARATION OF THE ENDOGENOUS VARIABLES    
    varexo eps_a eps_tau;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
    varobs pie dy;                       % DECLARATION OF THE OBSERVABLE VARIABLES
    parameters phi beta kappa phi_x phi_pie alpha rho lambda sig_a sig_tau; % DECLARATION OF THE PARAMETERS AND CALIBRATION




%% ----------------------------------------------------------------
% Calibration: Set inital values for parameters
%----------------------------------------------------------------
    beta    = 0.97;
    phi_x   = 0;
    phi_pie = 0.99;
    alpha   = 0;
    rho     = 0.2;
    lambda  = 0.5;
    phi     = 1;
    theta   = 0.75;
    sig_a   = 0.02;
    sig_tau = 0.02;    
    @#if scenario > 2
        phi_x = 0.15; alpha = 0.8; rho = 0.9;
    @#endif
    kappa   = ((1-theta)*(1-beta*theta)*(1+phi))/(theta);




%% ----------------------------------------------------------------
% Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
model;
    % Calvo Pricing Equation
    pie = beta*pie(+1) + kappa*x;
    % Intertemporal Equation
    x = -(r - pie(+1) - rstar) + x(+1);
    % Different Monetary Policy Rules (uncomment the one you want to use)
    r = alpha*r(-1) + (1-alpha)*(phi_pie*pie + phi_x*x); % Baseline Taylor rule    
    %r = rstar;      % Natural equilibrium
    %r = rstar + alpha*(r(-1)-rstar(-1)) + (1-alpha)*(phi_pie*pie + phi_x*x); % Extended Taylor rule
    % Natural Rate
    rstar = rho*da + (1-lambda)/(1+phi)*tau;
    % Output growth
    dy  = x - x(-1) + da - (tau - tau(-1))/(1+phi);
    % Technology shock
    da = rho*da(-1) + sig_a*eps_a;
    % Preference shock
    tau = lambda*tau(-1) + sig_tau*eps_tau;    
end;




%% ----------------------------------------------------------------
% Specify steady_state_model or initval. Don't forget ... end;
%----------------------------------------------------------------
% If you have analytical solution for the steady state use steady_state_model, 
% else if you want to numerically find the SS, use initval and set initial values
initval;
pie=0; x=0; dy=0; da=0; tau=0; rstar=0; r=0;
end;




%% ----------------------------------------------------------------
% Calculate steady-state, check Blanchard-Khan-conditions and residuals
%----------------------------------------------------------------
steady; 
check; 
resid;




%% ----------------------------------------------------------------
% SCENARIO 1: Deterministic model - temporary shock
%----------------------------------------------------------------
@#if scenario == 1
    shocks;
    var eps_a; periods 1; values 1;
    end;
    simul(periods=200); %deterministic simulation
    do_own_plots_deterministic; %this is a own programmed MATLAB function to compute IRFs
@#endif




%% ----------------------------------------------------------------
% SCENARIO 2: Stochastic model - temporary shock
%----------------------------------------------------------------
@#if scenario == 2
    shocks;
        var eps_a; stderr 1;
        var eps_tau; stderr 1;     
    end;
    stoch_simul(order=1,nocorr,nomoments,irf=10); %stochastic simulation
    do_own_plots_stochastic; %this is a own programmed MATLAB function to compute IRFs
@#endif




%% ----------------------------------------------------------------
% SCENARIO 3: Stochastic model - simulate data
%----------------------------------------------------------------
@#if scenario == 3
    shocks;
        var eps_a; stderr 1;
        var eps_tau; stderr 1;     
    end;
    % Simulate 1000 periods
    stoch_simul(order=1,nocorr,nomoments,irf=0,periods=1000);  %stochastic simulation
    % Save data to excel file
    xlswrite('simdat.xls', pie(401:500),'Simulated data', 'B4:B103');
    xlswrite('simdat.xls', dy(401:500),'Simulated data', 'C4:C103');
    % Save data to mat file
    save('simdat','pie','dy');
    plot(dy(401:500));
@#endif




%% ----------------------------------------------------------------
% SCENARIO 4: Maximum Likelihood Estimation large sample size
%----------------------------------------------------------------
@#if scenario == 4
    shocks;
        var eps_a; stderr 1;
        var eps_tau; stderr 1;     
    end;
    % Maximum-Likelihood-Estimation:
    % syntax: parameter, lower bound, upper bound
    estimated_params;
        rho,      0.1, 0.001, 0.99;
        lambda,   0.1, 0.001, 0.99;  
    end;
    estimation(order=1,datafile=simdat,nobs=1000,first_obs=1,nograph);        
@#endif




%% ----------------------------------------------------------------
% SCENARIO 5: Maximum Likelihood Estimation small sample size
%----------------------------------------------------------------
@#if scenario == 5
    shocks;
        var eps_a; stderr 1;
        var eps_tau; stderr 1;     
    end;
    % Maximum-Likelihood-Estimation:
    % parameter, lower bound, upper bound
    estimated_params;
        rho,      0.9, 0.001, 0.99;
        lambda,   0.5, 0.001, 0.99;  
    end;
    estimation(order=1,datafile=simdat,nobs=100,first_obs=51,nograph);        
@#endif




%% ----------------------------------------------------------------
% SCENARIO 6: Bayesian Estimation small sample size
%----------------------------------------------------------------
@#if scenario == 6
   shocks;
        var eps_a; stderr 1;
        var eps_tau; stderr 1;     
    end;
    %Bayesian estimation
    %Syntax: parameter, prior type, prior par1, prior par2,... 
    estimated_params;
       rho, beta_pdf, 0.9, .04;
       lambda, normal_pdf, 0.5, .04; 
    end;
    estimation(datafile=simdat,first_obs=51,nobs=100,mode_check,mh_replic=15000,mh_jscale=2.5,mh_nblocks=2);
@#endif