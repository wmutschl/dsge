%/////////////////////////////////////////////////////////////
%////    The Clarida-Gali-Gertler model	 	              ////
%////    Based upon lecture notes of Lawrence Christiano  ////
%////    Author:   Willi Mutschler (willi@mutschler.eu)   ////
%////    Version: July 03, 2013					   		  ////
%////	 Goal: Practicing Dynare                     	  ////
%////    !!    Don't forget the semicolons  !!            ////
%/////////////////////////////////////////////////////////////

% Set seed for random number generator, if you want to replicate your results
% rng(123);

%% Set variable for which model to use
%1: log-linearized version
%2: Nonlinear model in levels
%3: Nonlinear model in log of levels
@#define version= 1

%% ----------------------------------------------------------------
% 1. Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
%     var pie x r rstar da tau dy; % DECLARATION OF THE ENDOGENOUS VARIABLES    
%     varexo eps_a eps_tau;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
%     varobs pie dy;                       % DECLARATION OF THE OBSERVABLE VARIABLES
%     parameters phi beta kappa phi_x phi_pie alpha rho lambda sig_a sig_tau; % DECLARATION OF THE PARAMETERS AND CALIBRATION
    @#if version == 1
        var pie dy x r rst tau da;        
    @#endif    
    @#if version == 2
        var pie dy da tau C R PIE K F N Cst Rst X a pst;
    @#endif
    @#if version == 3
        var pie dy x r rst tau da K F n c cst a da logpst;        
    @#endif   
    varobs pie dy;
    varexo eps_a eps_tau;
    parameters v epsi phi betta kappa theta rho_tau rho_a sig_a sig_tau alpha phi_pie phi_x;

%% ----------------------------------------------------------------
% 2. Set values for parameters
%----------------------------------------------------------------
    betta    = 0.97;
    phi_x   = 0;
    phi_pie = 1.5;
    alpha   = 0;
    rho_a     = 0.2;
    rho_tau  = 0.5;
    phi     = 1;
    theta   = 0.75;
    sig_a   = 0.02;
    sig_tau = 0.02;    
    epsi = 2;
    v = 1 - (epsi-1)/epsi;    
    kappa   = ((1-theta)*(1-betta*theta)*(1+phi))/(theta);
%% ----------------------------------------------------------------
% 3. Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------

model;
da = rho_a*da(-1) + sig_a*eps_a;
tau = rho_tau*tau(-1) + sig_tau*eps_tau;
    
@#if version == 1
    pie = betta*pie(+1) + kappa*x;
    x = x(+1) - (r - pie(+1) - rst);
    r = alpha*r(-1) + (1-alpha)*(phi_pie*pie + phi_x*x);% Baseline Taylor rule    
    rst = rho_a*da + (1-rho_tau)/(1+phi)*tau;
    dy  = x - x(-1) + da - (tau - tau(-1))/(1+phi);
@#endif

@#if version == 2
    1/C = betta*R/(C(+1)*PIE(+1));
    K = F*((1-theta*PIE^(epsi-1))/(1-theta))^(1/(1-epsi));
    K = (1-v)*epsi/(epsi-1)*exp(tau)*N^phi*C/exp(a) + betta*theta*PIE(+1)^epsi*K(+1);
    F = 1+betta*theta*PIE(+1)^(epsi-1)*F(+1);    
    pst = ((1-theta)*((1-theta*PIE^(epsi-1))/(1-theta))^(epsi/(epsi-1))+theta*PIE^epsi/pst(-1))^(-1);
    C = pst*exp(a)*N;
    R = R(-1)^alpha*Rst^(1-alpha)*PIE^((1-alpha)*phi_pie)*X^((1-alpha)*phi_x);
    Cst = exp(a-tau/(1+phi));
    Rst = 1/betta*exp(da(+1)-(tau(+1)-tau)/(1+phi));
    X = C/Cst;
    pie = log(PIE) - log(1);
    dy  = log(X) - log(X(-1)) + da - (tau - tau(-1))/(1+phi);
    a = da + a(-1);
@#endif

@#if version == 3
    -c = r-c(+1)+pie(+1);
    K = F*((1-theta*exp((epsi-1)*pie))/(1-theta))^(1/(1-epsi));
    K = (1-v)*epsi/(epsi-1)*exp(tau+phi*n+c-a) + betta*theta*exp(epsi*pie(+1))*K(+1);
    F = 1+betta*theta*exp((epsi-1)*pie(+1))*F(+1);    
    exp(logpst) = ((1-theta)*((1-theta*exp((epsi-1)*pie))/(1-theta))^(epsi/(epsi-1))+theta*exp(epsi*pie)/exp(-logpst))^(-1);
    c = logpst + a + n;    
    r = alpha*r(-1) + (1-alpha)*(phi_pie*pie + phi_x*x);
    cst = a-tau/(1+phi);
    rst = (da(+1)-(tau(+1)-tau)/(1+phi));
    x = c-cst;    
    dy  = x - x(-1) + da - (tau - tau(-1))/(1+phi);
    a = da + a(-1);
@#endif
end;

%% ----------------------------------------------------------------
% 4. Specify shocks. Don't forget: shocks; ... end;
%----------------------------------------------------------------
 shocks;
     var eps_a; stderr 1;
     var eps_tau; stderr 1;     
 end;
% 
%% ----------------------------------------------------------------
% 5. Specify steady_state_model or initval. Don't forget ... end;
%----------------------------------------------------------------
% If you have analytical solution for the steady state use
% steady_state_model, else if you want to numerically find the SS, use
% initval and set initial values
steady_state_model;
tau=0; da=0; dy=0; pie=0;
@#if version == 1
     x=0; y=0; rst=0; r=0;
@#endif

@#if version == 2    
    R=1/betta; PIE=1; K=1/(1-betta*theta); F=K; N=1; C=1; pst=1; Cst=1; Rst=1/betta; X=1; a=0;
@#endif
@#if version == 3
    x=0; r=0; rst=0; K=1/(1-betta*theta); F=K; n=0; c=0; cst=0; a=0; logpst=0;
@#endif
end;

%% ----------------------------------------------------------------
% 6. Computations, simulation and/or estimation
%----------------------------------------------------------------
    % Calculate steady-state, check Blanchard-Khan-conditions
	steady; check;
    stoch_simul(order=1,nocorr,nomoments,irf=7) pie dy;
