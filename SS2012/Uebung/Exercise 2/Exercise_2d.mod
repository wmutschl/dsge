/////////////////////////////////////////////////////////////
////    Exercise 2d): Based upon Dynare User Guide	 	 ////
////    Author:   Willi Mutschler (willi@mutschler.eu)   ////
////    Version: June 13, 2012					   		 ////
////	Goal: First steps in Dynare and calibration, 	 ////
////    !!    Don't forget the semicolon   !!            ////
/////////////////////////////////////////////////////////////

% Set seed for random number generator, if you want to replicate your results
% rng(123);

%----------------------------------------------------------------
% 1. Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
	var y_hat c_hat k_hat i_hat l_hat w_hat r_hat A_hat;
	varexo e; 
	parameters alpha beta delta rho sigma r_ss l_ss c_y;
    varobs c_hat y_hat i_hat w_hat r_hat;
		
%-------------------------------------------------------------
% 2. Set values for parameters
%----------------------------------------------------------------
	alpha = 0.33;
    beta = 0.99;
    delta = 0.023;
    rho = 0.95;
    sigma = 0.001;
	r_ss = 0.03;
	l_ss = 0.3;
	c_y = 0.8; 
 
%----------------------------------------------------------------
% 3. Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
	model;
    exp(-c_hat) = beta* exp(c_hat(+1))*(1+r_ss*exp(r_hat(+1)-delta));
    w_hat = c_hat+l_ss/(1-l_ss)*l_hat;
    exp(y_hat) = c_y*exp(c_hat) + (1-c_y)*exp(i_hat);
    y_hat = A_hat + alpha*k_hat(-1) +(1-alpha)*l_hat;
    w_hat = y_hat - k_hat;
    r_hat = y_hat - k_hat(-1);
    delta*exp(i_hat)=exp(k_hat)-(1-delta)*exp(k_hat(-1));
    A_hat = rho*A_hat(-1)+e;
	end;
    
%----------------------------------------------------------------
% 4. Specify shocks. Don't forget: shocks; ... end;
%----------------------------------------------------------------
	shocks;
	var e; stderr sigma;
	end;
	
%----------------------------------------------------------------
% 5. Specify steady-state or initial values. Don't forget initval;... end;
%----------------------------------------------------------------
	initval; 
	y_hat=0; c_hat=0; k_hat=0; i_hat=0; l_hat=0; w_hat=0; r_hat=0; A_hat=0; e=0;
	end;
    
%----------------------------------------------------------------
% 6. Computations, simulation and/or estimation
%----------------------------------------------------------------
	% Calculate steady-state, check Blanchard-Khan-conditions
	steady; check;
	
	% Simulate 1000 periods
    stoch_simul(order=1,nocorr,nomoments,IRF=0,periods=1000,solve_algo =3) ;