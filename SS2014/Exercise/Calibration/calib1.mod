/////////////////////////////////////////////////////////////
////    Exercise 2c): Based upon Dynare User Guide	 	 ////
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
	var y c k i l w r A;
	varexo e; 
	parameters beta psi delta alpha rho sigma epsilon;
    varobs c y i w r;
		
%-------------------------------------------------------------
% 2. Set values for parameters
%----------------------------------------------------------------
	alpha = 0.33;
    beta = 0.99;
    delta = 0.023;
    psi = 1.75;
    rho = 0.95;
    sigma = 0.01;
    epsilon = 10;
 
%----------------------------------------------------------------
% 3. Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
	model;
    (1/c) = beta*(1/c(+1))*(1+r(+1)-delta);
    w = psi*c/(1-l);
    y = c+i;
    y = A*(k(-1)^alpha)*(l)^(1-alpha);
    w = y*((epsilon-1)/epsilon)*(1-alpha)/l;
    r = y*((epsilon-1)/epsilon)*alpha/k(-1);
    i = k-(1-delta)*k(-1);
    log(A) = rho*log(A(-1))+e;
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
% 	initval; 
% 	y=1; c=0.7; k=9; i=0.2; l=0.3; w=2.0;r=0;A=1;e=0;
% 	end;

steady_state_model;
    A=1;
    r = 1/beta-1+delta;
    k_over_y = alpha*(epsilon-1)/epsilon/r;
    l_over_k = (1/(A*k_over_y))^(1/(1-alpha));
    y_over_l = (k_over_y)^(-1) * (l_over_k)^(-1);
    w = (1-alpha)*y_over_l*(epsilon-1)/epsilon;
    i_over_l = delta*l_over_k^(-1);
    c_over_l = y_over_l - delta/l_over_k;
    l = (psi/w*c_over_l + 1)^(-1);
    c = c_over_l*l;
    y = y_over_l*l;
    k = l/l_over_k;
    i = delta*k;
end;
%----------------------------------------------------------------
% 6. Computations, simulation and/or estimation
%----------------------------------------------------------------
	% Calculate steady-state, check Blanchard-Khan-conditions
	steady; check;
	
	% Simulate 1000 periods
%     stoch_simul(order=1,nocorr,nomoments,IRF=0,periods=1000,solve_algo =3) ;
    
	% Plot consumption path, middle 100 observations
% 	plot(c(401:500));
%     
	% Save data to excel file
% 	xlswrite('simdat.xls', c(401:500),'Simulierte Daten', 'B4:B103');
% 	xlswrite('simdat.xls', y(401:500),'Simulierte Daten', 'C4:C103');
% 	xlswrite('simdat.xls', i(401:500),'Simulierte Daten', 'D4:D103');
% 	xlswrite('simdat.xls', w(401:500),'Simulierte Daten', 'E4:E103');
%     xlswrite('simdat.xls', r(401:500),'Simulierte Daten', 'E4:E103');
% 	
% 	% Save data to mat file
% 	save('simdat','c', 'y','i','w','r');	
%     
    