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

%% Set macro directive for which exercise (this is just for convenience), no semicolon
close all;

%% ----------------------------------------------------------------
% 1. Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
%     var pie x r rstar da tau dy; % DECLARATION OF THE ENDOGENOUS VARIABLES    
%     varexo eps_a eps_tau;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
%     varobs pie dy;                       % DECLARATION OF THE OBSERVABLE VARIABLES
%     parameters phi beta kappa phi_x phi_pie alpha rho lambda sig_a sig_tau; % DECLARATION OF THE PARAMETERS AND CALIBRATION
    var K tau a n c pie F pst da cst rst r x;
    varobs pie cst;
    %var K tau n pie F pst da r;
    varexo eps_a eps_tau;
    parameters v epsi phi betta theta rho_tau rho_a sig_a sig_tau alpha phi_pie phi_x;

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
    a0=1;
    %kappa   = ((1-theta)*(1-beta*theta)*(1+phi))/(theta);
%% ----------------------------------------------------------------
% 3. Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
% just use model; or model(block,bytecode) which is a little bit faster, works however only with order=1;


model;
K = (1-v)*epsi/(epsi-1)*exp(tau)*n^phi*c/exp(a) + betta*theta*pie(+1)^epsi*K(+1);
F = 1+betta*theta*pie(+1)^(epsi-1)*F(+1);
K = F*((1-theta*pie^(epsi-1))/(1-theta))^(1/(1-epsi));
pst = ((1-theta)*((1-theta*pie^(epsi-1))/(1-theta))^(epsi/(epsi-1))+theta*pie^epsi/pst(-1))^(-1);
1/c = betta*r/(c(+1)*pie(+1));
c = pst*exp(a)*n;
cst = exp(a)*exp(tau/(1+phi));
rst = 1/betta*c(+1)/c;
r = r(-1)^alpha*rst^(1-alpha)*pie^((1-alpha)*phi_pie)*exp(x)^((1-alpha)*phi_x);
x = log(c)-log(cst);
%log(r) = alpha*log(r(-1))+(1-alpha)*(log(rst+phi_pie*log(pie)+phi_x*log(c/cst)));
%     K = (1-v)*epsi/(epsi-1)*exp(tau+(1+phi)*n+pst) + betta*theta*exp(epsi*pie(+1))*K(+1);
%     F = 1+betta*theta*exp((epsi-1)*pie(+1))*F(+1);
%     K = F*((1-theta*exp((epsi-1)*pie))/(1-theta))^(1/(1-epsi));
%     exp(pst) = ((1-theta)*((1-theta*exp((epsi-1)*pie))/(1-theta))^(epsi/(epsi-1))+theta*exp(epsi*pie-pst(-1)))^(-1);
%     exp(-pst-n) = betta*exp(r-da(+1)-pst(+1)-n(+1)-pie(+1));
    %exp(rst) = exp(-pst-n)/(betta*exp(-da(+1)-pst(+1)-n(+1)-pie(+1)));
    %c = pst+a+n;
    %c = y;
    %r = alpha*r(-1) + (1-alpha)*(phi_pie*pie + phi_x*x); % Baseline Taylor rule
    % Natural Rate
    %exp(rst) = 1/(betta*exp(c-c(+1)));
    %r = rst + alpha*(r(-1)-rst(-1)) + (1-alpha)*(phi_pie*pie + phi_x*x);    
    % Output growth
    %yst = a+n;
    %dy  = y - y(-1);
    %x = y-yst;
    % Technology shock
    da = rho_a*da(-1) + sig_a*eps_a;
    a= da + da(-1);
    % Preference shock
    tau = rho_tau*tau(-1) + sig_tau*eps_tau;
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
    tau=0;
    da=0;
    a=0;
    pie=1;
    r=1/betta;
    pst=1;
    F=1/(1-betta*theta);
    K=F;
    n=exp(-tau/(1+phi));
    c = pst*exp(a)*n;
    cst = exp(a)*exp(-tau/(1+phi));
    rst = r;
    x=0;
end;

%% ----------------------------------------------------------------
% 6. Computations, simulation and/or estimation
%----------------------------------------------------------------
    % Calculate steady-state, check Blanchard-Khan-conditions
	steady; check;
    stoch_simul(order=1);
