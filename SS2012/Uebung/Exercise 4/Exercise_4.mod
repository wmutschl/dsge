/////////////////////////////////////////////////////////////
////    Modell:  An und Schorfheide (2007)    		 	 ////
////    Author:   Willi Mutschler (willi@mutschler.eu)   ////
////    Version: June 28, 2012					   		 ////
////	Maximum-Likelihood								 ////
/////////////////////////////////////////////////////////////
% NO ESTIMATION YET
%----------------------------------------------------------------
% 1. Declare variables and parameters
%----------------------------------------------------------------
	var y c p R g z YGR INFL INT;
	varexo e_z e_g e_R; 
	parameters tau kap psi1 psi2 rhoR rhog rhoz r_A p_A gam_Q stdR stdg stdz bet;
	varobs YGR INFL INT;
	
%-------------------------------------------------------------
% 2. Set parameters
%----------------------------------------------------------------
% True parameter-Values
	tau=2.000; 
	kap=0.150; 
	psi1 =1.500;
	psi2=1.000; 
	rhoR=0.600; 
	rhoz =0.650;
	rhog=0.950;  
	stdR=0.2; 
	stdg=0.8; 
	stdz=0.45;	
	p_A=4.000; 
	gam_Q=0.500;
	r_A=0.400;

	bet=1/(1+r_A/400); %However, in steady-state: beta = gamma/r = exp(gam_Q/100 - r_A/400)

%----------------------------------------------------------------
% 3. Model equations
%----------------------------------------------------------------
	model(linear,block,bytecode);
	y = y(+1) + g - g(+1) -1/tau * (R-p(+1)-z(+1));
	p = bet*p(+1) + kap*(y-g);
	c = y-g;
	R = rhoR*R(-1) + (1-rhoR)*psi1*p+(1-rhoR)*psi2*(y-g) + stdR/100*e_R;
	g = rhog*g(-1) + stdg/100*e_g;
	z = rhoz*z(-1) + stdz/100*e_z;
	YGR = gam_Q+100*(y-y(-1)+z);
	INFL = p_A+400*p;
	INT = p_A+r_A+4*gam_Q+400*R;
	end;
%----------------------------------------------------------------
% 4. Specify shocks (Std-error is in the model equations)
%----------------------------------------------------------------
	shocks;
	var e_R; stderr 1;
	var e_g; stderr 1;
	var e_z; stderr 1;
	end;
	
%----------------------------------------------------------------
% 5. Initial values (all variables are percentual deviations from SS)
%----------------------------------------------------------------
	initval; 
	c=0; p=0; y=0; R=0; g=0; z=0;
	end;

%----------------------------------------------------------------
% 6. Calculations
%----------------------------------------------------------------
	steady;check;
		
		
		
