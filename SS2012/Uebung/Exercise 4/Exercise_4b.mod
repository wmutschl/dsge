%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Model:  An und Schorfheide (2007)    		 	%%%%
%%%%    Author:   Willi Mutschler (willi@mutschler.eu)  %%%%
%%%%    Version: June 28, 2012					   		%%%%
%%%%	Maximum-Likelihood with simulated data          %%%%
%%%%    Not identified coefficients                     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 0. Settings
%----------------------------------------------------------------
@#define Setting = 1
    % 1: Estimate all parameters 
    % 0: Estimate all parameters except psi1

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
% True parameter-values, simdat2.mat is simulated with these values
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
	r_A=4.00; %here is the difference to Ex. 4a)
	
    bet=1/(1+r_A/400); 
    %However, in steady-state the model implies 
    %beta = gamma/r = exp(gam_Q/100 - r_A/400)
    %this can lead to absurd parameter values

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
    % Maximum-Likelihood-Estimation
    estimated_params;
    % Parameter, Initial Value, Lower Bound, Upper Bound;
    tau,   2    ,0   ,4;    	
    kap,   0.15 ,0.1 ,0.2;    	
    psi2,   1    ,0.5 ,1.5;
    rhoR,  0.5  ,0   ,1;   
    rhoz,  0.5  ,0   ,1;
    rhog,  0.9  ,0.5 ,1;  	 	
    stdR,  0.5  ,0   ,1; 		
    stdz,  0.5  ,0   ,1;
    stdg,  0.5  ,0   ,1;   
    p_A,   4    ,3   ,5;
    gam_Q, 0.5  ,0.3 ,0.6;
    % Macro-Language depending on Setting above
    @#if Setting
        psi1,  1.5  ,1   ,2; %psi1 and psi2 are not identifiable
        r_A,   4  ,3 ,5;
    @#else
        r_A,   4  ,3 ,5;
    @#endif
    end;

    steady; check;
    estimation(order=1,datafile=simdat2,nobs=1000,first_obs=1,nograph);
		
