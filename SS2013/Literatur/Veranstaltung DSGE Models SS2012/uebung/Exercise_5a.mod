%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author:   Willi Mutschler (willi@mutschler.eu)  %%%%
%%%%    Version: July 5, 2012					   		%%%%
%%%%	Bayesian Estimation								%%%%
%%%%    Exercise 5					                    %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% You still have to declare sensible parameter values!
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
    theta   =   ;
    tau     =   ;
    alpha   =   ;
    psi     =   ;
    beta    =   ;
    delta   =   ;
    rho     =   ;
    A_ss    =   ;
	sigma   =   ;


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
steady; check;

share_of_capital = alpha^(1/(1-psi))*A_ss^psi/(1/beta-1+delta)^(psi/(1-psi));
disp(['THE SHARE OF CAPITAL IS: ' num2str(share_of_capital)]);
disp('If it is not between 0.2 and 0.3, try to change parameters.');	