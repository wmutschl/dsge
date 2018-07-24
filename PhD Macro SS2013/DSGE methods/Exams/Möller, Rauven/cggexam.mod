%/////////////////////////////////////////////////////////////
%////    The Clarida-Gali-Gertler model	( for examination)////
%////    Based upon lecture notes of Lawrence Christiano  ////
%////    Author:   Willi Mutschler (willi@mutschler.eu)   ////
%////    Version: July 27, 2013					   		  ////
%////    !!    Don't forget the semicolons  !!            ////
%/////////////////////////////////////////////////////////////

close all; %This just closes all windows
% Set seed for random number generator, if you want to replicate your results
rng(123);
%% ----------------------------------------------------------------
% 1. Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
    var pie x r rstar da tau dy lagsignal;        % DECLARATION OF THE ENDOGENOUS VARIABLES    
    varexo eps_a eps_tau signal_a;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
    varobs pie dy;                       % DECLARATION OF THE OBSERVABLE VARIABLES
    parameters phi beta kappa phi_x phi_pie alpha rho lambda sig_a sig_tau; % DECLARATION OF THE PARAMETERS AND CALIBRATION

%% ----------------------------------------------------------------
% 2. Set values for parameters
%----------------------------------------------------------------
    beta    = 0.97;
    phi_x   = 0;
    phi_pie = 1.5;
    alpha   = 0;
    rho     = 0.2;
    lambda  = 0.5;
    phi     = 1;
    theta   = 0.75;
    sig_a   = 0.02;
    sig_tau = 0.02;    
    kappa   = ((1-theta)*(1-beta*theta)*(1+phi))/(theta);

%% ----------------------------------------------------------------
% 3. Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
model;
    % Calvo Pricing Equation
    pie = beta*pie(+1) + kappa*x;
    % Intertemporal Equation
    x = -(r - pie(+1) - rstar) + x(+1);
    % Monetary Policy Rule
    %r = rstar + alpha*(r(-1)-rstar(-1)) + (1-alpha)*(phi_pie*pie + phi_x*x);
    r = alpha*r(-1) + (1-alpha)*(phi_pie*pie + phi_x*x); % Baseline Taylor rule
    % Natural Rate
    %rstar = rho*da + (1-lambda)/(1+phi)*tau;
    rstar = -(1-rho)*da +(1-lambda)/(1+phi)*tau + signal_a;
    % Output growth
    dy  = x - x(-1) + da - (tau - tau(-1))/(1+phi);
    lagsignal=signal_a;
    % Technology shock
    da = rho*da(-1) + eps_a+lagsignal(-1);
    % Preference shock
    tau = lambda*tau(-1) + eps_tau;    
end;



%% ----------------------------------------------------------------
% 4. Specify shocks. Don't forget: shocks; ... end;
%----------------------------------------------------------------
% For each subtask change shocks eps_a to signal_a
 shocks;
     var signal_a; stderr 1;
     var eps_tau; stderr 1;  
     
 end;
% 
%% ----------------------------------------------------------------
% 5. Specify steady_state_model or initval. Don't forget ... end;
%----------------------------------------------------------------
steady_state_model;
pie=0; x=0; dy=0; da=0; tau=0; ystar=0; y=0; rstar=0; r=0;
end;

%% ----------------------------------------------------------------
% 6. Computations, simulation and/or estimation
%----------------------------------------------------------------
    % Calculate steady-state, check Blanchard-Khan-conditions
	steady; check;
stoch_simul(order=1,nocorr,nomoments,irf=7);
% For each subtask change command to plots, plots_2 or plots_3
plots_3;	