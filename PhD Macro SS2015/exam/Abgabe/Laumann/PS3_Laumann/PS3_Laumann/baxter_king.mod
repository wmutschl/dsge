%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Problem set 3         %%%%%
%%%%% Baxter-King-model     %%%%%
%%%%% Author: Lasse Laumann %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Variables

var C, N, w, r, tau, lambda, TR, z, Y, K, I, K_B, I_B, G_B, dY, dC, dI, dN, dw, dr, dTR, dG, dI_B; % declare endogenous variables
varexo epsilon_z, epsilon_G_B, epsilon_I_B, epsilon_tau;                                           % declare exogenous varibles
parameters beta, theta_l, delta, eta, alpha rho_z, rho_G_B, rho_I_B, rho_tau,                      % declare parameters and steady-state values 
           z_q, G_B_q, I_B_q, tau_q, Y_q, I_q, N_q, w_q, C_q, TR_q, r_q;

% Calibration

beta = 0.99;
theta_l = 1.9123; % not in line with e.g. Gali Gertler Lopez-Saldido (2003)
delta = 0.10;
eta = 0.05; %0.20 for comparison in 5.
alpha = 1/3;
rho_z = 0.75;
rho_G_B = 0.75;
rho_I_B = 0.75;
rho_tau = 0.75;
G_B_q = 0.2;
I_B_q = 0.02; 
tau_q = 0.22; 
z_q = 1.69291;  %2.1552 for eta = 0.2
Y_q = 1;
I_q = 0.23615; 
N_q = 1/3;
w_q = 2;
C_q = 0.54385;
TR_q = 0;
r_q = 0.141155;

% Model 

model;


(1-tau)*w = theta_l*(C/(1-N));                              % Equation 1

lambda = beta*(lambda(+1)*((1-delta)+(1-tau(+1))*r(+1)));   % Equation 2 

lambda = 1/C;                                               % Equation 3

K = (1-delta)*K(-1)+I;                                      % Equation 4

K_B = (1-delta)*K_B(-1)+I_B;                                % Equation 5

Y = z*(K_B(-1)^eta)*(K(-1)^alpha)*(N^(1-alpha));            % Equation 6

w*N = (1-alpha)*Y;                                          % Equation 7

r*K(-1)= alpha*Y;                                           % Equation 8

log(z/z_q) = rho_z*log(z(-1)/z_q) + epsilon_z;              % Equation 9

G_B + I_B + TR = tau*(w*N+r*K(-1));                         % Equation 10

G_B - G_B_q = rho_G_B*(G_B(-1)-G_B_q) + epsilon_G_B;        % Equation 11

I_B - I_B_q = rho_I_B*(I_B(-1)-I_B_q) + epsilon_I_B;        % Equation 12

log(tau/tau_q) = rho_tau*log(tau(-1)/tau_q) + epsilon_tau;  % Equation 13

Y = C + G_B + I_B + I;                                      % Equation 14

% Reported values

dY = 100*((Y-Y_q)/Y_q);

dC = 100*((C-C_q)/C_q); 

dI = 100*((I-I_q)/I_q);

dN = 100*(N-N_q);

dw = 100*((w-w_q)/w_q);

dr = 100*(r-r_q);

dTR = 100*(TR-TR_q);

dG = 100*((G_B/Y)-(G_B_q/Y_q));

dI_B = 100*((I_B/Y)-(I_B_q/Y_q));


end;

% Initial values

initval;

C = C_q;
N = N_q;
w = w_q;
r = r_q;
tau = tau_q;
TR = TR_q;
lambda = 1/C;
Y = Y_q;
K = 2.3615;
I = I_q;
K_B = 0.20;
I_B = I_B_q;
G_B = G_B_q;
z = z_q; 

end;


% Calculations (Choose between scenarios 1-3)
% Scenario 1: Shock on government spending
% Scenario 2: Shock on public investment
% Scenario 3: Unexpected permanent increase in the tax rate

@# define scenario = 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% SCENARIO 1 %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

@# if scenario == 1  

steady(solve_algo=3);
check;
resid;

% Shocks

shocks;

   var epsilon_G_B = 0.0001;

end;

% Simulation

stoch_simul(order=1,irf=100,periods=200);
do_own_plots_stochastic;

@# endif

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% SCENARIO 2 %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

@# if scenario == 2  

steady(solve_algo=3);
check;
resid;

% Shocks

shocks;

 var epsilon_I_B = 0.0001;

end;

% Simulation

stoch_simul(order=1,irf=100,periods=200);
do_own_plots_stochastic;

@# endif

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% SCENARIO 3 %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

@# if scenario == 3  

initval;
    epsilon_tau = 0;
    end;
steady(solve_algo=3);

endval;
    epsilon_tau = 1/90;
    end;
steady(solve_algo=3);

% Simulation



simul(periods=100);

subplot(331),plot(tau),title('Tax rate')
subplot(332),plot(dY),title('GDP')
subplot(333),plot(dC),title('Consmption')
subplot(334),plot(dI),title('Investment')
subplot(335),plot(dN),title('Employment')
subplot(336),plot(dw),title('Real wage')
subplot(337),plot(dr),title('Real interest rate')
subplot(338),plot(dTR),title('Transfers')
subplot(339),plot(dG),title('Government spending')

@# endif

