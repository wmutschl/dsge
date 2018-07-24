%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author:   Willi Mutschler (willi@mutschler.eu)  %%%%
%%%%    Version: August 05, 2015				   		%%%%
%%%%	Practicing Dynare								%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%----------------------------------------------------------------
% Declare variables and parameters
%----------------------------------------------------------------
var a, k, c;
varexo e;
varobs c;

parameters betta, alph, delt, rho;
	
%-------------------------------------------------------------
% Calibrate intial parameters
%----------------------------------------------------------------
% True parameter-values, data is simulated with these values
alph   =   0.4500;
betta  =   0.9900;
delt   =   0.0200;
rho    =   0.8000;

%----------------------------------------------------------------
% Model equations
%----------------------------------------------------------------
model;
  1/c = betta*1/c(+1)*( alph*exp(a(+1))*k^(alph-1)+1-delt);
  a = rho*a(-1) + e;
  k = (1-delt)*k(-1) + exp(a)*k(-1)^alph -c;
end;

%----------------------------------------------------------------
% Analytical or Numerical Steady-State
%----------------------------------------------------------------
steady_state_model;
a = e/(1-rho);
k = ( (1/betta - 1+delt)/(alph*exp(a)))^(1/(alph-1));
c = exp(a)*k^alph-delt*k;
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

@# define scenario = 0


@# if scenario == 0
    steady;
    check;
    resid;
    stoch_simul(order=1);
@# endif

@# if scenario == 1    
    steady;check;resid;
    
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
    steady;check;resid;
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
    steady;check;resid;
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
    steady; %old steady state as initial value

    endval;
    e = 0.01; %Jumps to the new value
    end;
    steady; %new steady state as endvalue

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
    steady;

    endval;
    e = 0.01;
    end;
    steady;

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
    stoch_simul(order=1,periods=10000);
    % Save observations to mat file
    save('simdat','k','c');    
@# endif


@# if scenario == 7
    shocks;
	var e; stderr 1;
	end;
    % Maximum-Likelihood-Estimation
    estimated_params;
    %parameter, inital guess, lower bound, upper bound
    alph, .45, .1, 0.9;
    end;
    %identification;
    % You should play around with mode_compute values!
    estimation(mode_compute=7,order=1,datafile=simdat,first_obs=201,nobs=200,mode_check);            
    steady; check; resid;
@# endif


@# if scenario == 8 
    shocks;
	var e; stderr 1;
	end;
    % Define Priors and observable variables
	estimated_params;
	alph, beta_pdf, .45, .05;
	end;
    % Estimate posterior mode 
 	estimation(mode_compute=7,datafile=simdat,first_obs=201,nobs=200,mh_replic=0, mode_check);
 	steady; check; resid;

    % Run Metropolis-Hastings with already calculated posterior mode
	estimation(mode_compute=0,mode_file=rbcsimple_mode,datafile=simdat,first_obs=201,nobs=200,mh_replic=5000,mh_nblocks=3,mh_jscale=4);
	steady; check; resid;
    
    % Run Metropolis-Hastings again without discarding previous draws
    estimation(mode_compute=0,mode_file=rbcsimple_mode,datafile=simdat,first_obs=201,nobs=200,mh_replic=1000,mh_nblocks=3,load_mh_file,mh_jscale=4);
	steady; check;  resid;
@#endif