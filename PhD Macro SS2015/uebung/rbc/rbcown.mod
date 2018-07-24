%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author:   Willi Mutschler (willi@mutschler.eu)  %%%%
%%%%    Version: August 05, 2015				   		%%%%
%%%%	Practicing Dynare								%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set_dynare_seed(123); %Set seed for random number generator
%----------------------------------------------------------------
% Declare variables and parameters
%----------------------------------------------------------------
var k, y, l, c, A, a, i, uc,ul,fk,fl,f;
varexo e;
parameters beta, theta, tau, alpha, psi, delta, rho, Abar;
	
%-------------------------------------------------------------
% Calibrate intial parameters
%----------------------------------------------------------------
% True parameter-values, data is simulated with these values
theta   =   0.3570;
tau     =   2.0000;
alpha   =   0.4500;
psi     =  -0.1000;
beta    =   0.9900;
delta   =   0.0200;
rho     =   0.8000;
Abar    =   1.0000;


%----------------------------------------------------------------
% Model equations
%----------------------------------------------------------------
model;
  % Note that fk and fl can be simplified by using the definition of f
  %fk = 1/psi*f^(1-psi)*alpha*psi*k(-1)^(psi-1);
  %fl = 1/psi*f^(1-psi)*(1-alpha)*psi*l^(psi-1);
  fk = alpha*(f/k(-1))^(1-psi);                                                     %eq1
  fl = (1-alpha)*(f/l)^(1-psi);                                                     %eq2
  uc = (c^theta*(1-l)^(1-theta))^(-tau)*theta*c^(theta-1)*(1-l)^(1-theta);          %eq3
  ul = (c^theta*(1-l)^(1-theta))^(-tau)*(1-theta)*c^theta*(1-l)^(-theta)*(-1);      %eq4
  uc = beta*uc(+1)*(A(+1)*fk(+1)+1-delta);                                          %eq5
  A = Abar*exp(a);                                                                  %eq6
  a = rho*a(-1) + e;                                                                %eq7
  f = (alpha*(k(-1)^psi)+(1-alpha)*(l^psi))^(1/psi);                                %eq8
  y = A*f;                                                                          %eq9
  k = i+(1-delta)*k(-1);                                                            %eq10
  ul/uc + A*fl = 0;                                                                 %eq11
  c + k = A*f + (1-delta)*k(-1);                                                    %eq12
end;

%----------------------------------------------------------------
% Analytical or Numerical Steady-State
%----------------------------------------------------------------
% steady_state_model;
% a = e/(1-rho); %eq7 evaluated at steady-state -> steady-state for a
% A = Abar*exp(a); %eq6 evaluated at steady-state -> steady-state for A
% fk = (1/beta-1+delta)/A; %eq5 evaluated at steady-state -> steady-state for fk
% f_over_k = (fk/alpha)^(1/(1-psi)); %eq1 rewritten as ratio evaluated at steady-state
% c_over_k = f_over_k*A-delta; %eq12 rewritten as ratio evaluated at steady-state
% l_over_k = ((f_over_k^psi-alpha)/(1-alpha))^(1/psi);%eq8 rewritten as ratio evaluated at steady-state
% f_over_l = f_over_k/l_over_k;%identity
% c_over_l = c_over_k/l_over_k;%identity
% fl = (1-alpha)*(f_over_l)^(1-psi);%eq2 evaluated at steady-state -> steady-state for fl
% l = 1/ ( 1 + (c_over_l*(1-theta)/theta) / ( (1-alpha)*A*f_over_l^(1-psi) ) );%eq11 evalauted at steady-state -> steady-state for l
% c=c_over_l*l;%identity -> steady-state for c
% k=l/l_over_k;%identity -> steady-state for k
% f = (alpha*(k^psi)+(1-alpha)*(l^psi))^(1/psi);%eq8 evaluated at steady-state -> steady-state for f
% y=A*f;%identity -> steady-state for y
% i = delta*k;%eq10 evaluated at steady-state -> steady-state for i
% uc = (c^theta*(1-l)^(1-theta))^(-tau)*theta*c^(theta-1)*(1-l)^(1-theta);%eq3 evaluated at steady-state -> steady-state for uc
% ul = (c^theta*(1-l)^(1-theta))^(-tau)*(1-theta)*c^theta*(1-l)^(-theta)*(-1);%eq4 evaluated at steady-state -> steady-state for ul
% end;
initval;
k  		 = 20;
y  		 = 1;
l  		 = 0.5;
c  		 = 1.5;
A  		 = 1;
a  		 = 0;
i  		 = 0.5;
uc 		 = 0.5;
ul 		 = -1;
fk 		 = 0.1;
fl 		 = 3;
f  		 = 2;
end;


%----------------------------------------------------------------
% Computations
%----------------------------------------------------------------

%% PLEASE CHOOSE YOUR SCENARIO
% Scenario 0: Compute steady-state,check Blanchard-Khan and residuals of model equations in steady-state
% Scenario 1: Return to equilibrium in deterministic model
% Scenario 2: A temporary shock to TFP in deterministic model
% Scenario 3: Pre-announced favorable shocks in the future in deterministic model
% Scenario 4: A permanent shock in deterministic model
% Scenario 5: A pre-announced permanent shock in deterministic model
% Scenario 6: Simulate data in stochastic model
% Scenario 7: Maximum Likelihood Estimation
% Scenario 8: Bayesian Estimation

@# define scenario = 8


@# if scenario == 0
    steady(solve_algo=3);check;resid;
@# endif

@# if scenario == 1    
    steady(solve_algo=3);check;resid;
    
    ik = varlist_indices('k',M_.endo_names); % Retrieve Indices
    kbar = oo_.steady_state(ik); % Get value of steady-state capital    
    
    histval;
    k(0) = kbar/2; %Period 0 is the first period before simulation
    %If you don't specify terminate condition, DYNARE will us the steady-state
    end;
    simul(periods=300);
    rplot k;
    rplot c;
@# endif

@# if scenario == 2
    steady(solve_algo=3);check;resid;
    % A temporary shock to TFP, economy starts from ss, there is an unexpected shock in period 1
    % Unexpected because it is in period 1, agents cannot react yet
    shocks; 
    var e;
    periods 1;
    values -0.1;
    end;
    simul(periods=300);
    rplot k;
    rplot c;
@# endif

@# if scenario == 3
    steady(solve_algo=3);check;resid;
    %Pre-announced favorable shocks in the future, period 4 about 4%, period 5 to 8 just 1%. 
    %they are expected, because they don't happen in period 1: PERFECT FORESIGHT!
    shocks; 
    var e;
    periods 4, 5:8;
    values 0.04, 0.01;
    end;
    simul(periods=300);
    rplot k;
    rplot c;
@# endif

@# if scenario == 4
    % A permanent shock, TFP increases permanently by 5% (and this was unexpected because it happens in period 1)
    initval;
    e = 0;
    end;
    steady(solve_algo=3); %old steady state as initial value

    endval;
    e = 0.01; %Jumps to the new value
    end;
    steady(solve_algo=3); %new steady state as endvalue

    simul(periods=300);
    rplot k;
    rplot c;
@# endif

@# if scenario == 5
    % A pre-announced permanent shock, in period 6 TFP increases by 5% permanently
    % Agents react already in period 1: Perfect foresight
    initval;
    e = 0;
    end;
    steady(solve_algo=3);

    endval;
    e = 0.01;
    end;
    steady(solve_algo=3);

    % Shock jumps in period 6, so in period 1 to 5 it is at value 0
    shocks;
    var e;
    periods 1:5; 
    values 0;
    end;

    simul(periods=300);

    rplot k;
    rplot c;
@# endif


@# if scenario == 6    
    % Simulate data with stochastic model
	shocks;
	var e; stderr 1;
	end;
    stoch_simul(order=1,nocorr,nomoments,irf=0,periods=10000);
    % Save observations to mat file
    save('simdat','c','l','y');    
@# endif


@# if scenario == 7
    varobs y; %as many observable variables as shocks
    shocks;
	var e; stderr 1;
	end;
    % Maximum-Likelihood-Estimation
    estimated_params;
    %parameter, inital guess, lower bound, upper bound
    alpha, .45, .1, 0.9;
    theta, .35, .05, 0.9;
    tau, 2.0,.5,3;
    end;
    % You should play around with mode_compute values!
    estimation(mode_compute=7,order=1,datafile=simdat,first_obs=401,nobs=200,mode_check);            
    steady(solve_algo=3); check; resid;
@# endif


@# if scenario == 8 
    varobs y; %as many observable variables as shocks
    shocks;
	var e; stderr 1;
	end;
    % Define Priors and observable variables
	estimated_params;
	alpha, beta_pdf, .45, .05;
	theta, beta_pdf, .35, .05;
	tau, gamma_pdf, mode_and_variance_to_mean(2.0,.5^2,1,1),.5, 1;
	end;

    % Estimate posterior mode 
 	estimation(mode_compute=7,datafile=simdat,first_obs=401,nobs=200,mh_replic=0, mode_check);
 	steady(solve_algo=3); check; resid;

    % Run Metropolis-Hastings with already calculated posterior mode
	estimation(mode_compute=0,mode_file=rbcown_mode,datafile=simdat,first_obs=401,nobs=200,mh_replic=5000,mh_nblocks=3,mh_jscale=1.7);
	steady(solve_algo=3); check; resid;
    
    % Run Metropolis-Hastings again without discarding previous draws
    estimation(mode_compute=0,mode_file=rbcown_mode,datafile=simdat,first_obs=401,nobs=200,mh_replic=1000,mh_nblocks=3,load_mh_file,mh_jscale=1.7);
	steady(solve_algo=3); check;  resid;
@#endif