/////////////////////////////////////////////////////////////
////    Modell:  An und Schorfheide (2007)    		 	 ////
////    Autor:   Willi Mutschler (willi@mutschler.eu)    ////
////    Version: April 10, 2012					   		 ////
////	Maximum-Likelihood und bayesianische Schätzung	 ////
/////////////////////////////////////////////////////////////
%----------------------------------------------------------------
% 0. Einstellungen festlegen fürs Schätzen
%----------------------------------------------------------------
	% 1: Maximum-Likelihood-Schätzung (komplett)
	% 2: Maximum-Likelihood-Schätzung (ohne psi1)
	% 3: Maximum-Likelihood-Schätzung (ohne psi1, ohne tau)
	% 4: Bayesianische Schätzung
	EINSTELLUNG = 4 ;

%----------------------------------------------------------------
% 1. Variablen und Parameter deklarieren
%----------------------------------------------------------------
	var y c p R g z YGR INFL INT;
	varexo e_z e_g e_R; 
	parameters tau kap psi1 psi2 rhoR rhog rhoz r_A p_A gam_Q stdR stdg stdz bet;
	varobs YGR INFL INT;
	
%-------------------------------------------------------------
% 2. Parameterwerte festlegen, je nach Einstellung
%----------------------------------------------------------------
	% HILFSPARAMETER %
	p_A=4.006491505; gam_Q=0.470040407; r_A=6.41918092 - p_A - 4*gam_Q; bet=1/(1+r_A/400);
	
	if EINSTELLUNG == 1; % Maximum-Likelihood-Schätzung (komplett)
	elseif EINSTELLUNG == 2; % Maximum-Likelihood-Schätzung (ohne psi1)
		psi1 =1.500;
	elseif EINSTELLUNG == 3; % Maximum-Likelihood-Schätzung (ohne psi1,ohne tau)
		psi1 =1.500; tau=2;
	elseif EINSTELLUNG == 4; % Bayesianische Schätzung, Parameter für Steady-State
	end;
%----------------------------------------------------------------
% 3. Modelgleichungen
%----------------------------------------------------------------
	model(block,bytecode);
	%model;
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
% 4. Schocks spezifizieren
%----------------------------------------------------------------
	shocks;
	var e_R; stderr 1;
	var e_g; stderr 1;
	var e_z; stderr 1;
	end;
	
%----------------------------------------------------------------
% 5. Startwerte bzw. steady-state spezifizieren
%----------------------------------------------------------------
	initval; 
	c=0; p=0; y=0; R=0; g=0; z=0;
	end;
%----------------------------------------------------------------
% 6. Berechnungen durchführen, je nach Einstellungen
%----------------------------------------------------------------
	 if EINSTELLUNG == 1; % Maximum-Likelihood-Schätzung (komplett)
		estimated_params;
		% Parametername, Startwert, Untere Grenze, Obere Grenze;
		tau,2,0,4;    	kap,0.15,0.1,0.2;   psi1,1.5,1,2;    	psi2,0.75,0,1.5;
		rhoR,0.5,0,1;   rhog,0.5,0,1;  	 	rhoz,0.5,0,1;
		stdg,0.5,0,1;   stdR,0.5,0,1; 		stdz,0.5,0,1;
		end;
		estimation(order=1,datafile=simdat,nobs=100,first_obs=401,mode_compute=7,
														   nograph,solve_algo=3);

	 elseif EINSTELLUNG == 2; % Maximum-Likelihood-Schätzung (ohne psi1)
		estimated_params;
		% Parametername, Startwert, Untere Grenze, Obere Grenze;
		tau,2,0,4;    	kap,0.15,0.1,0.2;   			    	psi2,0.75,0,1.5;
		rhoR,0.5,0,1;   rhog,0.5,0,1;  	 	rhoz,0.5,0,1;
		stdg,0.5,0,1;   stdR,0.5,0,1; 		stdz,0.5,0,1;
		end;
		estimation(order=1,datafile=simdat,nobs=100,first_obs=401,mode_compute=7,
																	   nograph,solve_algo=3);
	
	 elseif EINSTELLUNG == 3; % Maximum-Likelihood-Schätzung (ohne psi1, ohne tau)
		estimated_params;
		% Parametername, Startwert, Untere Grenze, Obere Grenze;
						kap,0.15,0.1,0.2;   			    	psi2,0.75,0,1.5;
		rhoR,0.5,0,1;   rhog,0.5,0,1;  	 	rhoz,0.5,0,1;
		stdg,0.5,0,1;   stdR,0.5,0,1; 		stdz,0.5,0,1;
		end;
		estimation(order=1,datafile=simdat,nobs=100,first_obs=401,mode_compute=7,
																	   nograph,solve_algo=3);
		
	elseif EINSTELLUNG == 4; % Bayesianische Schätzung
		%steady; check;
		estimated_params;
		% Parametername, Prior, Erster Parameter, Zweiter Parameter
		tau, gamma_pdf, 2, 0.5; 		kap, beta_pdf, 0.2, 0.1;
		psi1, gamma_pdf, 1.5, 0.25;		psi2, gamma_pdf, 0.5, 0.25;
		rhoR, beta_pdf, 0.5, 0.2;		rhog, beta_pdf, 0.8, 0.1;
		rhoz, beta_pdf, 0.66, 0.15;		stdR, inv_gamma_pdf,0.4,0.25;
		stdg, inv_gamma_pdf,1,0.25;		stdz, inv_gamma_pdf,0.5,0.25;
		end;
		estimation(order=1,datafile=simdat,nobs=100,first_obs=401,mode_compute=7,
		solve_algo=3,mh_jscale=0.8,mh_nblocks=5,mh_replic=20000,mh_init_scale=1);
	end;