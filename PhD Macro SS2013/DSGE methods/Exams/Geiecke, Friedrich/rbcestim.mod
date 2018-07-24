%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author:   Willi Mutschler (willi@mutschler.eu)  %%%%
%%%%    Version: July 23, 2013					   		%%%%
%%%%	Bayesian Estimation								%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
% Set seed for random number generator, if you want to replicate your results
rng(123);
%----------------------------------------------------------------
% 1. Declare variables and parameters
%----------------------------------------------------------------
	var l c k y A a;
	varexo e; 
	parameters theta tau alpha psi beta delta rho A_ss sigma;
	
%-------------------------------------------------------------
% 2. Set parameters
%----------------------------------------------------------------
% True parameter-values, data is simulated with these values
    theta   =   0.3500;
    tau     =   2.0000;
    alpha   =   0.4500;
    psi     =  -0.4000;
    beta    =   0.9900;
    delta   =   0.0200;
    rho     =   0.8000;
    A_ss    =   1.0000;
	sigma   =   1.0000;


%----------------------------------------------------------------
% 3. Model equations
%----------------------------------------------------------------
	model;
    A = A_ss*exp(a);
    a = rho*a(-1) + sigma*e;
    y = A*(alpha*(k(-1)^psi) + (1-alpha)*(l^psi))^(1/psi);
    y=c+k-(1-delta)*k(-1);
	((1-theta)/theta)*(c/(1-l)) = A^psi*(1-alpha)*(y/l)^(1-psi);
	(((c^theta)*((1-l)^(1-theta)))^(1-tau))/c = beta*((((c(1)^theta)*((1-l(1))^(1-theta)))^(1-tau))/c(1))*(alpha*A^psi*((y(1)/k)^(1-psi))+1-delta);
    end;
   
%----------------------------------------------------------------
% 4. Specify shocks (Std-error is in the model equations)
%----------------------------------------------------------------
	shocks;
	var e; stderr 1;
	end;
	
%----------------------------------------------------------------
% 5. Analytical Steady-State
%----------------------------------------------------------------
steady_state_model;
   A = A_ss;
   Y_K = (((1/beta)-1+delta)/(alpha*A^psi))^(1/(1-psi));
   C_K = Y_K - delta;
   L_K = (((Y_K)^psi-alpha)/(1-alpha))^(1/psi);
   Y_L = Y_K/L_K;
   C_L = C_K/L_K;

   l = 1/(1 + C_L/((theta*(1-alpha)*A^psi/(1-theta))*(Y_L^(1-psi))));
   c = C_L*l;
   k = l/L_K;
   y = Y_K*k;
end;

%----------------------------------------------------------------
% 6. Calculations
%----------------------------------------------------------------
% Simulate Dataset
 	steady; check;
 	stoch_simul(periods=10000,irf=0,order=1);
 	save('artificial_sample.mat','y','c','l');

% Define Priors and observable variables
	estimated_params;
	alpha, beta_pdf, .45, .05;
	theta, beta_pdf, .35, .05;
	tau, gamma_pdf, mode_and_variance_to_mean(2.0,.5^2,1,1),.5, 1;
	end;
	varobs y;

% Estimate posterior mode 
 	estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=0, mode_check);
 	steady; check;

% Run Metropolis-Hastings with already calculated posterior mode
	estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=5000,mh_nblocks=3,mode_compute=0,mode_file=rbcestim_mode,mh_jscale=1.7);
	
% Run Metropolis-Hastings again without discarding previous draws
    estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=1000,mh_nblocks=3,mode_compute=0,mode_file=rbcestim_mode,load_mh_file,mh_jscale=1.7);
	steady; check;

