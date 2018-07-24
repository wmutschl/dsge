%    Exercises abcdef  			                    


%----------------------------------------------------------------
% 1. Declare variables and parameters
%----------------------------------------------------------------
	var l c k y A a i;
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
	sigma   =   0.01;

%----------------------------------------------------------------
% 3. Model equations
%----------------------------------------------------------------
	model;
    % "model local" variables
    #f = (alpha*(k(-1)^psi) + (1-alpha)*(l^psi))^(1/psi);
    #fl = 1/psi*(alpha*k(-1)^psi+(1-alpha)*l^psi)^(1/psi-1)*((1-alpha)*psi*l^(psi-1));
    #fk = 1/psi*(alpha*k(-1)^psi+(1-alpha)*l^psi)^(1/psi-1)*(alpha*psi*k(-1)^(psi-1));
    #fk1 = 1/psi*(alpha*k^psi+(1-alpha)*l(+1)^psi)^(1/psi-1)*(alpha*psi*k^(psi-1));
    #uc = (c^theta*(1-l)^(1-theta))^(-tau)*(theta*c^(theta-1)*(1-l)^(1-theta));
    #uc1 = (c(+1)^theta*(1-l(+1))^(1-theta))^(-tau)*(theta*c(+1)^(theta-1)*(1-l(+1))^(1-theta));
    #ul = (c^theta*(1-l)^(1-theta))^(-tau)*(c^theta*(1-theta)*(1-l)^(-theta)*(-1));
    
    % Standard variables
    A = A_ss*exp(a);
    a = rho*a(-1) + sigma*e;
    0 = uc - beta*(uc1*(A(+1)*fk1+1-delta));
    0 = -ul/uc - A*fl;
    0 = c + k - A*f - (1-delta)*k(-1);
    y = c+i;
    k = i+(1-delta)*k(-1);    
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
   i = delta*k;
end;

%----------------------------------------------------------------
% 6. Calculations
%----------------------------------------------------------------
% % Exercise 5a: Write and check mod file
%steady; check;
%stoch_simul(order=1,irf=0,nomoments,nocorr);

% % Exercise 5b: Simulate Dataset
%steady; check;
 % 	stoch_simul(periods=10000,irf=0,order=1);
  %	save('artificial_sample.mat','y','c','l');

% % Exercise 5c: Define Priors and observable variable 
 	estimated_params;
 	alpha, beta_pdf, .25, .05;
 	theta, beta_pdf, .30, .05;
 	tau, gamma_pdf, mode_and_variance_to_mean(2.0,.5^2,1,1),.5, 1; % the mode_and_variance_to_mean function computes the mean of a distribution given mode/variance
 	end;
 	varobs y;

% Exercise 5d: Compute the mode
	estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=0, mode_check,mode_compute=4);

% Exercise 5e: Estimatation using the mode_file, Scaling: mh_jscale=1.2
  estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mh_replic=1000,mh_nblocks=3,mode_compute=0,mode_file=Bayesian_mode,mh_jscale=1.4);

% Exercise 5f: Change your priors in estimated_params and rerun Exercise 5d and 5e