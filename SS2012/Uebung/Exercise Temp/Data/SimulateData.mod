/////////////////////////////////////////////////////////////
////    Modell:  An und Schorfheide (2007)    		 	 ////
////    Autor:   Willi Mutschler (willi@mutschler.eu)    ////
////    Version: April 10, 2012					   		 ////
////				Daten Simulation					 ////
/////////////////////////////////////////////////////////////
%----------------------------------------------------------------
% 0. Einstellungen festlegen 
%----------------------------------------------------------------
	% 1: Wahren Datensatz simulieren
	% 2: Datensatz simulieren mit kalibrierten Parametern
	Einstellung = 1 ;
	
%----------------------------------------------------------------
% 1. Variablen und Parameter deklarieren
%----------------------------------------------------------------
	var y c p R g z YGR INFL INT AGR CGR;
	varexo e_z e_g e_R;
	parameters tau kap psi1 psi2 rhoR rhog rhoz r_A p_A gam_Q  stdR stdg stdz bet;
	varobs YGR INFL INT AGR CGR;
	
%----------------------------------------------------------------
% 2. Parameterwerte festlegen, je nach Einstellung
%----------------------------------------------------------------
	if Einstellung == 1;
		% Parameter wie An & Schorfheide (2007,Table 2)
		tau=2.000; kap=0.150; psi1 =1.500; psi2=1.000; rhoR=0.600; rhog=0.950;  rhoz =0.650;
		stdR=0.2; stdg=0.8; stdz=0.45;
		r_A=4.00; p_A=4.000; gam_Q=0.500; 
	elseif Einstellung == 2;
		% Kalibrierte Parameter
		tau=2.000; kap=0.1750; psi1 =2.000; psi2=1.000; rhoR=0.500; rhog=0.90;  rhoz =0.70;
		stdR=0.3; stdg=0.5; stdz=0.4;
		p_A=4.006491505; gam_Q=0.470040407; r_A=6.41918092 - p_A - 4*gam_Q;
	end;	
		
	% HILFSPARAMETER %	
	bet = 1/(1+r_A/400); 	

%----------------------------------------------------------------
% 3. Modelgleichungen
%----------------------------------------------------------------
	model;
	y = y(+1) + g - g(+1) -1/tau * (R-p(+1)-z(+1));
	p = bet*p(+1) + kap*(y-g);
	c = y-g;
	R = rhoR*R(-1) + (1-rhoR)*psi1*p+(1-rhoR)*psi2*(y-g) + stdR/100*e_R;
	g = rhog*g(-1) + stdg/100*e_g;
	z = rhoz*z(-1) + stdz/100*e_z;
	YGR = gam_Q+100*(y-y(-1)+z);
	INFL = p_A+400*p;
	INT = p_A+r_A+4*gam_Q+400*R;
	AGR = gam_Q+100*z; 			 % Nur relevant für die Datensimulation
	CGR = gam_Q+100*(c-c(-1)+z); % Nur relevant für die Datensimulation
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
	% Simuliere 1000 Perioden, verwende mittlere 100
	steady; check; % steady-state berechnen, Blanchard-Khan-Bedingungen überprüfen
	set_dynare_seed =123;
	stoch_simul(order=1,IRF=0,periods=1000,solve_algo=3);
	% Daten in excel-Datei speichern
	if Einstellung == 1; % Wahren Daten
		xlswrite('simdat.xls', YGR(401:500),'Simulierte Daten', 'B4:B103');
		xlswrite('simdat.xls', INFL(401:500),'Simulierte Daten', 'C4:C103');
		xlswrite('simdat.xls', INT(401:500),'Simulierte Daten', 'D4:D103');
		xlswrite('simdat.xls', AGR(401:500),'Simulierte Daten', 'E4:E103');
		xlswrite('simdat.xls', CGR(401:500),'Simulierte Daten', 'F4:F103');				
		% Daten in mat-Datei speichern
		save('simdat','YGR', 'INFL','INT');
	
	elseif Einstellung == 2; % Kalibrierte Daten
		xlswrite('simdat.xls', YGR(401:500),'Daten im Vergleich', 'D3:D102');
		xlswrite('simdat.xls', INFL(401:500),'Daten im Vergleich', 'E3:E102');
		xlswrite('simdat.xls', INT(401:500),'Daten im Vergleich', 'F3:F102');
	end;	

	