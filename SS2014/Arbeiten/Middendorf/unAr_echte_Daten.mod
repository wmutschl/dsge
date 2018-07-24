%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%    Autor: Mathias Middendorf,                      %%%%
%%%%           Matrikelnummer: 372111                   %%%%
%%%%	Bayesianische Schätzung 					    %%%%
%%%%    mit unelastischem Arbeitsangebot (=-nachfrage)  %%%%
%%%%    und echten Daten                                %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 1. Definierung von Variablen und Parametern
%----------------------------------------------------------------
	var c k y A a i;
	varexo e; 
	parameters tau alpha beta delta rho A_ss sigma;
	
%-------------------------------------------------------------
% 2. Festlegung von Parametern 
%----------------------------------------------------------------
    tau     =   1.1000;
    alpha   =   0.3300;
    beta    =   0.9900;
    delta   =   0.0200;
    rho     =   0.8000;
    A_ss    =   1.0000;
    sigma   =   1.0000;

%----------------------------------------------------------------
% 3. Modellgleichungen
%----------------------------------------------------------------
	model;
    #f = k(-1)^alpha;
    #fk = alpha*k(-1)^(alpha-1);
    #fk1 = alpha*k^(alpha-1);
    #u = 1/(1-tau)*c^(1-tau);
    #uc = c^(-tau);
    #uc1 = c(+1)^(-tau);
    A = A_ss*exp(a);
    a = rho*a(-1)+sigma*e;
    0 = uc-beta*(uc1*(A(+1)*fk1+1-delta));
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
   y = ((beta^(-1)-1+delta)/(alpha*A^(1/alpha)))^(alpha/(alpha-1));
   k = (y/A)^(1/alpha);
   i = delta*k;
   c = y-delta*k;
   end;

%----------------------------------------------------------------
% 6. Kalkulationen
%----------------------------------------------------------------
% Nr. 5a: Berechnung der Steady-States sowie Überprüfung der Blanchard-Khan-Bedingungen
   steady; check;
   stoch_simul(order=1,irf=0,nomoments,nocorr);

% Nr. 5b: Laden der BIP-Daten 
   load('Bruttoinlandsprodukt_Daten.mat', 'y');

% Nr. 5c: Definition der Priori-Verteilungen für die ausgewählten Parameter
%         sowie "Festlegung" auf eine beobachtbare Variable (da dem einem 
%         Schock e eine beobachtbare Variable (hier y) gegenüber stehen muss)  
  	estimated_params;
    alpha, beta_pdf, 0.01, 0.003;
    tau, normal_pdf, 1.10, 0.500; 
	end;
  	varobs y;
  
% Nr. 5d: Schätzung des Modus der Posteriori-Verteilung (je Parameter), wobei jeweils 
%         nur 200 Beobachtungen berücksichtigt werden, damit die obige Vermutung
%         (Priori-Verteilung) einen Einfluss auf unser Ergebnis hat (sonst Maximum-
%         Likelihood-Schätzung bei genügend großem Stichprobenumfang, Verwendung eines
%         auf Simulationen basierenden Optimierers).    
  	estimation(datafile=Bruttoinlandsprodukt_Daten,first_obs=1,nobs=93,mh_replic=0, mode_check,mode_compute=8);
  	steady; check;

% Nr. 5e: Anwendung des Metropolis-Hastings-Algorithmus (mit 50000 Replikationen, dem in 
%         Aufgabenteil d) ermittelten Modus sowie 3 Startpunkten, um dem Autokorrel-
%         ationsproblem entgegenzuwirken)  
  	estimation(datafile=Bruttoinlandsprodukt_Daten,first_obs=1,nobs=93,mh_replic=50000,mh_nblocks=3,mode_compute=0,mode_file=unAr_echte_Daten_mode,mh_jscale=2.5);
 	steady; check;


