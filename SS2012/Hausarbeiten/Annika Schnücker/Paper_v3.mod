% Model: Smets and Wouters 2002
% Annika Schnücker
% July 2012
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% 1. Declare variables and parameters
%--------------------------------------------------------------------------
	var pi w K Q I C R r L Y e_a e_I e_b e_L e_G e_pi; 
	varexo ee_a ee_I ee_b ee_L ee_G ee_pi n_p n_Q n_R n_w; 
	parameters h sigma_c beta adj tau gamma_p xi_p alpha gamma_w xi_w sigma_L lambda_w psi phi k g rho r_pi r_Y r_dpi r_dY r_a r_L r_k rho_a rho_I rho_b rho_L rho_G rho_pi sd_Q sd_p sd_w sd_R;
	varobs Y C I pi w L; % Variablen, die simuliert werden 

%--------------------------------------------------------------------------
% 2. Set parameters
%--------------------------------------------------------------------------

% Werte aus dem Paper von Smets and Wouters (S. 22 und Tabelle1)
	h=0.541; % habit
    sigma_c=1.607;  % sigma consumption utility
    beta=0.99; % Discountfactor
    adj=5.911 ; % adjustment cost of investment
    tau=0.025; % Depreciationrate
    gamma_p=0.408; % inflation indexation prices
    xi_p=0.91; % calvo prices
    alpha=0.3; % steady stae share of lapor income in total output of 70%
    gamma_w=0.656; % inflation indexation wages
    xi_w=0.763;  % calvo wages
    sigma_L=0.755; % sigma labour utility
    lambda_w=0.5;  % mark-up in wage setting
    psi=1/0.169;   % inverse of elasticity of capital utilitsation cost function
    phi=1.488;  % 1+share of fixed cost
    k=2.2;  % steady state capital output ratio
    g=0.18;  % steady state government spending output ratio= 1 - share of steady state investment in output - share of steady state consumption: (1-0.22-0.6)
    rho=0.942;  % r von R aus t-1
    r_pi=1.658;  % alle r_i sind Koeffizienten aus der Monetary Policy Rule
    r_Y=0.148;
    r_dpi=0.199;
    r_dY=0.173;
    r_a=0.096;
    r_L=0.047;
    
    r_k=(1/beta)-1+tau; % steady state return on capital 
    
    % Schocks
    rho_I=0.939;
    rho_b=0.905;
    rho_L=0.962;
    rho_G=0.966;
    rho_a=0.834;
    rho_pi=0.924;
    sd_Q=0.603; 
    sd_p=0.16;
    sd_w=0.279;
    sd_R=0.116;

%--------------------------------------------------------------------------
% 3. Model equations
%--------------------------------------------------------------------------
	model;
	C=(h/(1+h))*C(-1)+(1/(1+h))*C(+1)-((1-h)/((1+h)*sigma_c))*(R-pi(+1))+((1-h)/((1+h)*sigma_c))*e_b;
    I=(1/(1+beta))*I(-1)+(beta/(1+beta))*I(+1)+(adj/(1+beta))*Q-e_I/(1+beta);
    Q=-(R-pi(+1))+((1-tau)/(1-tau+r_k))*Q(+1)+(r_k/(1-tau+r_k))*r(+1)+n_Q;
    K = (1-tau)*K(-1)+tau*I(-1);
    pi=(beta/(1+beta*gamma_p))*pi(+1)+(gamma_p/(1+beta*gamma_p))*pi(-1)+(((1-beta*xi_p)*(1-xi_p))/((1+beta*gamma_p)*xi_p))*(alpha*r+(1-alpha)*w-e_a+n_p);
    w=(beta/(1+beta))*w(+1)+(1/(1+beta))*w(-1)+(beta/(1+beta))*pi(+1)-((1+beta*gamma_w)/(1+beta))*pi+(gamma_w/(1+beta))*pi(-1)-((1/1+beta)*((1-beta*xi_w)*(1-xi_w))/((1+(1/lambda_w)*((1+lambda_w)*sigma_L)*xi_w)))*(w-sigma_L*L-(sigma_c/(1-h))*(C-h*C(-1))+e_L-n_w);
    L=-w+(1+psi)*r+K(-1);
    Y=phi*e_a+phi*alpha*K(-1)+phi*alpha*psi*r+phi*(1-alpha)*L;
    Y=(1-tau*k-g)*C+tau*k*I+g*e_G;
    R=rho*R(-1)+(1-rho)*(e_pi +r_pi*(pi(-1)-e_pi)+r_Y*Y)+r_dpi*(pi-pi(-1))+r_dY*(Y-Y(-1))-r_a*ee_a-r_L*ee_L+n_R;
	   
    % Schocks
    
    e_I=rho_I*e_I(-1)+ee_I;
    e_b=rho_b*e_b(-1)+ee_b;
    e_L=rho_L*e_L(-1)+ee_L;
    e_G=rho_G*e_G(-1)+ee_G;
    e_a=rho_a*e_a(-1)+ee_a;
    e_pi=rho_pi*e_pi(-1)+ee_pi;
    
    end;
%--------------------------------------------------------------------------
% 4. Specify shocks 
%--------------------------------------------------------------------------
	
% Schocks mit ee_i sind normalverteilt mit (0,1), während die n_i Schocks
% normalverteilt mit (0, sigma^2i) sind 
% Werte für die stderr der Schocks, die nicht standardnormalverteilt sind,
% kommen aus der Schätzung des Papers von Smets and Wouters (Tabelle 1)
    shocks;
	var ee_b; stderr 1;
    var ee_I; stderr 1;
    var ee_a; stderr 1;
    var ee_L; stderr 1;
    var ee_G; stderr 1;
    var ee_pi; stderr 1;
    var n_Q; stderr sd_Q; 
    var n_p; stderr sd_p;
    var n_w; stderr sd_w;
    var n_R; stderr sd_R;
    
	end;
	
%--------------------------------------------------------------------------
% 5. Initial values 
%--------------------------------------------------------------------------
	% Variablen sind prozentuale Abweichungen vom steady state
    % Deshalb im steady state = 0 (wenn man im Gleichgewicht beginnt)
    initval; 
	C=0; I=0; Q=0; K=0; pi=0; w=0; L=0; Y=0; R=0; r=0; e_a=0; e_I=0; e_b=0; e_L=0; e_G=0; e_pi=0;
	end;

	
%--------------------------------------------------------------------------
% 6. Estimation
%--------------------------------------------------------------------------

stoch_simul(periods=10000,irf=100,order=1); 
save('output1.mat','Y', 'C','pi', 'I', 'L', 'w');  

estimated_params;           
h, beta_pdf, 0.70, 0.10;
sigma_c, normal_pdf, 1.00, 0.375;
adj, normal_pdf, 4.00, 1.5;
gamma_p, beta_pdf, 0.75, 0.15;
xi_p, beta_pdf, 0.75, 0.05;
gamma_w, beta_pdf, 0.75, 0.15;
xi_w, beta_pdf, 0.75, 0.05;
sigma_L, normal_pdf, 2.00, 0.75 ;
%psi, normal_pdf, 0.20, 0.075;
%phi, normal_pdf, 1.45, 0.25;
%rho, beta_pdf, 0.80, 0.10;
%r_pi, normal_pdf, 1.70, 0.10;
%r_Y, normal_pdf, 0.125, 0.05;
%r_dpi, normal_pdf, 0.30, 0.10 ;
%r_dY, normal_pdf, 0.0625, 0.05;
%r_a, normal_pdf, 0.0625, 0.05;
%r_L, normal_pdf, 0.0625, 0.05;
%rho_a, beta_pdf, 0.85, 0.10;
%rho_I, beta_pdf, 0.85, 0.10;
%rho_b, beta_pdf, 0.85, 0.10;
%rho_L, beta_pdf, 0.85, 0.10;
%rho_G, beta_pdf, 0.85, 0.10;
%rho_pi, beta_pdf, 0.85, 0.10;
%sd_Q, inv_gamma_pdf, 0.40, 2;
%sd_p, inv_gamma_pdf, 0.15, 2;
%sd_w, inv_gamma_pdf, 0.25, 2;
%sd_R, inv_gamma_pdf, 0.10, 2;
end;

%durch first_obs=1000: burn-in-phase, mode.compute=0: nimmt den vorher berechneten mode und rechnet nicht neu aus, mit mh_jscale kann die Annahmewahrscheinlichkeit vom Algorithmus angepasst werden
estimation(datafile=output1, first_obs=1000 , nobs=1000 , mh_replic=0, mode_check); 
estimation(datafile=output1, first_obs=1000 , nobs=1000 , mh_replic=10000, mh_nblocks=2,mode_compute=0, mode_file=Paper_v3_mode, mh_jscale=0.9); 
steady;check;

