%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author:   Willi Mutschler (willi@mutschler.eu)    %%%%
%%%%    Version: July 10, 2012					   		  %%%%
%%%%	Bayesian Estimation								  %%%%
%%%%    Examination with Cobb-Douglas-Production-Function %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
% Set seed for random number generator, if you want to replicate your results
rng(123);
%----------------------------------------------------------------
% 1. Declare variables and parameters
%----------------------------------------------------------------
	var l c k y A a;
	varexo e; 
	parameters theta tau alpha beta delta rho A_ss sigma;
	
%-------------------------------------------------------------
% 2. Set parameters
%----------------------------------------------------------------
% True parameter-values, data is simulated with these values
    %theta   =   0.3500;
    %tau     =   2.0000;
    %alpha   =   0.4500;
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
    y = A*(k(-1)^alpha)*(l^(1-alpha));
    y=c+k-(1-delta)*k(-1);
	((1-theta)/theta)*(c/(1-l)) = A*(1-alpha)*y/l;
	(((c^theta)*((1-l)^(1-theta)))^(1-tau))/c = beta*((((c(1)^theta)*((1-l(1))^(1-theta)))^(1-tau))/c(1))*(A*alpha*y/k(-1)+1-delta);
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
   Y_K = ((1/beta)-1+delta)/(alpha*A);
   C_K = Y_K - delta;
   L_K = (Y_K/A)^(1/(1-alpha));
   Y_L = Y_K/L_K;
   C_L = C_K/L_K;

   l = 1/(1 + C_L/(theta*(1-alpha)*A*Y_L/(1-theta)));
   c = C_L*l;
   k = l/L_K;
   y = Y_K*k;
end;

%----------------------------------------------------------------
% 6. Calculations
%----------------------------------------------------------------


    % Important note: the following commands are mostly copied from the file
    % discussed in the the lecture: rbcestim.mod.
    % 
    % Furthermore, data has been created with this file rbcestim.mod before
    % estimating the model.
    
    
    % 1. Priors 
    %
    % The following prior distributions from the original file are reasonable.
    % Alpha and theta follow a beta and tau follows a gamma distribution.
    % In regard to observable variables, only output (the y vector) is used.

	estimated_params;
	alpha, beta_pdf, .45, .05;
	theta, beta_pdf, .35, .05;
	tau, gamma_pdf, mode_and_variance_to_mean(2.0,.5^2,1,1),.5, 1;
	end;
	varobs y;


    % 2. Estimation
    %
    % The following command estimates the parameters using observations
    % 8001 until 10000. Furthermore, it checks the poserior mode.
 	estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=0, mode_check);
 	steady; check;


    % 3. MH-Algorithm
    
	estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=5000,mh_nblocks=3,mode_compute=0,mode_file=rbcexamedited_mode,mh_jscale=1.7);

    % Some univariate and multivariate diognosis evidence does not look strong enough. Further draws keeping the previous ones:

    % Run Metropolis-Hastings again without discarding previous draws
    estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=1000,mh_nblocks=3,mode_compute=0,mode_file=rbcexamedited_mode,load_mh_file,mh_jscale=1.7);
	steady; check;


    % 4. See LaTeX document

    % 5. Comparing models by posterior model probabilities

    %model_comparison rbcestim(0.5) rbcexamedited(0.5);
