%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%    Autor: Mathias Middendorf,                      %%%%
%%%%           Matrikelnummer: 372111                   %%%%
%%%%	Bayesianische Schätzung 					    %%%%
%%%%    mit additiv separabler Nutzenfunktion		    %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 1. Definierung von Variablen und Parametern
%----------------------------------------------------------------
	var l c k y A a i;
	varexo e;  
	parameters theta tau alpha beta delta rho A_ss sigma psi;
	
%-------------------------------------------------------------
% 2. Festlegung von Parametern (zur Datengenerierung) 
%----------------------------------------------------------------
    theta   =   1.8252846703315300000;
    tau     =   1.1000;
    alpha   =   0.4500;
    beta    =   0.9900;
    delta   =   0.0200;
    rho     =   0.8000;
    A_ss    =   1.0000;
    sigma   =   1.0000;
    psi     =  -0.4000;

%----------------------------------------------------------------
% 3. Modellgleichungen
%----------------------------------------------------------------
	model;
    #f = (alpha*(k(-1)^psi)+(1-alpha)*(l^psi))^(1/psi);
    #fl = 1/psi*(alpha*k(-1)^psi+(1-alpha)*l^psi)^(1/psi-1)*((1-alpha)*psi*l^(psi-1));
    #fk = 1/psi*(alpha*k(-1)^psi+(1-alpha)*l^psi)^(1/psi-1)*(alpha*psi*k(-1)^(psi-1));
    #fk1 = 1/psi*(alpha*k^psi+(1-alpha)*l(+1)^psi)^(1/psi-1)*(alpha*psi*k^(psi-1));
    #u = 1/(1-tau)*c^(1-tau)+theta*(1/(1-tau))*(1-l)^(1-tau);
    #uc = c^(-tau);
    #uc1 = c(+1)^(-tau);
    #ul = (-1)*theta*(1-l)^(-tau);
    A = A_ss*exp(a);
    a = rho*a(-1)+sigma*e;
    0 = uc-beta*(uc1*(A(+1)*fk1+1-delta));
    0 = -ul/uc-A*fl;
    0 = c+k-A*f-(1-delta)*k(-1);
    y = c+i;
    k = i+(1-delta)*k(-1);    
    end;
   
%----------------------------------------------------------------
% 4. Spezifikation des Schocks 
%----------------------------------------------------------------
	shocks;
	var e; stderr 1;
	end;
	
%----------------------------------------------------------------
% 5. Analytisch ermittelte Steady-States
%----------------------------------------------------------------
   steady_state_model;
   A = A_ss;
   Y_K = ((beta^(-1)-1+delta)/(alpha*A^psi))^(1/(1-psi));
   C_K = Y_K-delta;
   L_K = (((Y_K/A)^psi-alpha)*(1-alpha)^(-1))^(1/psi);
   Y_L = Y_K/L_K;
   C_L = C_K/L_K;

   c = ((C_L)^(-1)+(theta/((1-alpha)*A^psi)*(Y_L)^(psi-1))^(1/tau))^(-1);
   l = (C_L)^(-1)*c;
   k = l/L_K;
   y = Y_K*k;
   i = delta*k;
   end;

%----------------------------------------------------------------
% 6. Kalkulationen
%----------------------------------------------------------------
% Nr. 5a: Berechnung der Steady-States sowie Überprüfung der Blanchard-Khan-Bedingungen
    steady; check;
    stoch_simul(order=1,irf=0,nomoments,nocorr);

% Nr. 5b: Simulation von Daten (10000 Beobachtungen)
    steady; check;
    stoch_simul(periods=10000,irf=0,order=1);
    save('simsepU.mat','y');

% Nr. 5c: Definition der Priori-Verteilungen für die ausgewählten Parameter
%         sowie "Festlegung" auf eine beobachtbare Variable (da dem einem 
%         Schock e eine beobachtbare Variable (hier y) gegenüber stehen muss)  
  	estimated_params;
  	alpha, beta_pdf, 0.45, 0.05;
  	tau, normal_pdf, 1.10, 0.40;
 	end;
  	varobs y;
  
% Nr. 5d: Schätzung des Modus der Posteriori-Verteilung (je Parameter), wobei jeweils 
%         nur 200 Beobachtungen berücksichtigt werden, damit die obige Vermutung
%         (Priori-Verteilung) einen Einfluss auf unser Ergebnis hat (sonst Maximum-
%         Likelihood-Schätzung bei genügend großem Stichprobenumfang, Verwendung eines
%         auf Simulationen basierenden Optimierers).    
  	estimation(datafile=simsepU,first_obs=8001,nobs=200,mh_replic=0, mode_check,mode_compute=8);
  	steady; check;

% Nr. 5e: Anwendung des Metropolis-Hastings-Algorithmus (mit 25000 Replikationen, dem in 
%         Aufgabenteil d) ermittelten Modus sowie 3 Startpunkten, um dem Autokorrel-
%         ationsproblem entgegenzuwirken)  
  	estimation(datafile=simsepU,first_obs=8001,nobs=200,mh_replic=25000,mh_nblocks=3,mode_compute=0,mode_file=Additiv_sep_U_mode,mh_jscale=2.1);
 	steady; check;


