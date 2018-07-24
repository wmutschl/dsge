/////////////////////////////////////////////////////////////
////    Macroeconomics PhD Problem Set 2, Exercise 1     ////
////    Student: Dominik Hoffmann                        ////
////    Economics (Master of Science)  			   		 ////
////    Registration Number: 381035    			   		 ////
/////////////////////////////////////////////////////////////

%/////////////////////////////////////////////////////////////
%////    The Baxter and King (1993) model 	              ////
%////    Author:   Dominik Hoffmann                       ////
%////    Version: September 06, 2015				   	  ////
%/////////////////////////////////////////////////////////////
set_dynare_seed(123); %Set seed for random number generator
%% ----------------------------------------------------------------
% Variables and parameters (Exercise 1.1)
%----------------------------------------------------------------
    var C N G_B I_B w r K TR tau lambda K_B I Y z dY dC dI dN dw dr dTR dG_B dI_B; % ENDOGENOUS VARIABLES    
    varexo eps_z eps_GB eps_IB eps_tau; % STRUCTURAL INNOVATIONS
    varobs  dY dC dI dN dw dr dTR dG_B dI_B; % OBSERVABLE VARIABLES (equations 15.-23.)
    parameters beta theta_l delta eta alpha rho_z rho_GB rho_IB rho_tau sig_z sig_GB sig_IB sig_tau Ybar Gbar_B Ibar_B Kbar Kbar_B Nbar wbar rbar TRbar Ibar Cbar taubar zbar lambdabar; % PARAMETERS AND STEADY STATE VALUES

%% ----------------------------------------------------------------
% Calibration
%----------------------------------------------------------------
% As suggested I started setting values for beta, delta and eta. 
% Based on these values and the target values I derived the values for the other parameters and steady state values (see exercise 1.2).
   beta     = 0.99;   % I set beta to 0.99 to achieve a slight reduction in the real interest rate compared to the value 0.95 Baxter and King propose. 
   theta_l  = 1.9123; % calculated from initial values
   delta    = 0.1;    % (see Baxter and King (1993))
   eta      = 0.05;    % Baxter and King (1993) propose a value of 0.05. 
                      % for exercise 5 with increased productivity of
                      % public capital I choose a value of 0.2 which
                      % implies for z and zbar=2.1552. (in total 3 values
                      % have to be exchanged) 
   alpha    = 1/3;    % calculated from initial values
% given values from exercise:
   rho_z    = 0.75;
   rho_GB   = 0.75; 
   rho_IB   = 0.75;
   rho_tau  = 0.75;
   sig_z    = 0.01;
   sig_GB   = 0.01;
   sig_IB   = 0.01;
   sig_tau  = 0.01;
% steady-state values of model calculated in exercise 1.2
   Ybar = 1;
   Gbar_B = 0.2*Ybar;
   Ibar_B = 0.02*Ybar;
   TRbar = 0;
   wbar = 2;
   Nbar = 1/3;
   Kbar_B = 0.2;
   taubar = 0.22;
   rbar = 0.1412;
   Kbar = 2.3615;
   zbar = 1.6929; %1.6929 for eta=0.05; 2.1552 for eta=0.2
   Ibar = 0.2361;
   Cbar = 0.5439;
   lambdabar = 1.8387;
  

%% ----------------------------------------------------------------
% Model equations. The model is summarized by equations (1)-(23)
%----------------------------------------------------------------
model;
  % Eq. (1) consumption-leisure choice;  
  (1-tau)*w = theta_l*(C/(1-N));
  % Eq. (2) savings decision;
  lambda = beta*lambda(+1)*((1-delta)+(1-tau(+1))*r(+1));
  % Eq. (3) marginal utility of consumption;
  lambda = 1/C;
  % Eq. (4) private capital stock;
  K = (1-delta)*K(-1)+I;
  % Eq. (5) public capital stock;
  K_B = (1-delta)*K_B(-1)+I_B; 
  % Eq. (6) production function;
  Y = z*K_B(-1)^(eta)*K(-1)^alpha*N^(1-alpha);
  % Eq. (7) labor demand;
  w*N = (1-alpha)*Y;
  % Eq. (8) capital demand;
  r*K(-1) = alpha*Y;
  % Eq. (9) productivity;
  log(z/zbar) = rho_z*log(z(-1)/zbar)+eps_z;
  % Eq. (10) fiscal authority budget constraint;
  G_B+I_B+TR = tau*(w*N+r*K(-1));
  % Eq. (11) behavior of government consumption;
  G_B-Gbar_B = rho_GB*(G_B(-1)-Gbar_B)+eps_GB;
  % Eq. (12) behavior of government investment;
  I_B-Ibar_B = rho_IB*(I_B(-1)-Ibar_B)+eps_IB;
  % Eq. (13) behavior of tax rate on output;
  log(tau/taubar) = rho_tau*log(tau(-1)/taubar)+eps_tau;
  % Eq. (14) market clearing equation;
  Y = C+I+G_B+I_B;
  % Eq. (15) - (23) deviations from steady-state;
  % Eq. (15);
  dY = 100*(Y-Ybar)/Ybar;
  % Eq. (16);
  dC = 100*(C-Cbar)/Cbar;
  % Eq. (17);
  dI = 100*(I-Ibar)/Ibar;
  % Eq. (18);
  dN = 100*(N-Nbar);
  % Eq. (19);
  dw = 100*(w-wbar)/wbar;
  % Eq. (20);
  dr = 100*(r-rbar);
  % Eq. (21);
  dTR = 100*(TR-TRbar);
  % Eq. (22);
  dG_B = 100*((G_B/Y)-(Gbar_B/Ybar));
  % Eq. (23);
  dI_B = 100*((I_B/Y)-(Ibar_B/Ybar));
end;

%% ----------------------------------------------------------------
% Specify steady_state_model or initval. 
%----------------------------------------------------------------
initval;
dY=0; dC=0; dI=0; dN=0; dw=0; dr=0; dTR=0; dG_B=0; dI_B=0; % follows from Y = Ybar etc. in steady state for equations 15.-23.
% Target values:
Y = 1;
G_B = 0.2*Y;
I_B = 0.02*Y;
TR = 0;
w = 2;
N = 1/3;
% see pdf file for calculations:
K_B = 0.2;
tau = 0.22;
r = 0.1412;
K = 2.3615;
z = 1.6929; %1.6929 for eta=0.05; 2.1552 for eta=0.2
I = 0.2361;
C = 0.5439;
lambda = 1.8387;

end;
steady;

%----------------------------------------------------------------
% Computations
%----------------------------------------------------------------

% for exercise 1.5 use scenario 1 to 2. For increased productivity of
% public capital change values of eta and zbar respectively and use scenarios 3 and 4 to generate new figures. 
% for exercise 1.6 use scenario 5. 
% Scenario 0: Compute steady-state, check Blanchard-Khan and residuals of model equations in steady-state
% Scenario 1: An unexpected temporary shock to public consumption in the deterministic model 
% Scenario 2: An unexpected temporary shock to public investment in the deterministic model 
% Scenario 3: An unexpected temporary shock to public consumption with
% increased productivity of public capital (change eta, zbar and z)
% Scenario 4: An unexpected temporary shock to public investment with
% increased productivity of public capital (change eta, zbar and z)
% Scenario 5: Return to equilibrium in deterministic model after a
% permanent increase in tax rate

 

@# define scenario = 5


@# if scenario == 0
    steady(solve_algo=3);check;resid;
@# endif


@# if scenario == 1
    steady(solve_algo=3);check;resid;
    % A temporary shock to public consumption, economy starts from steady state, there is an unexpected shock in period 1
    shocks; 
    var eps_GB; % shock refers to G_B 
    periods 1; 
    values -0.01; % one percent decrease in public consumption
    end;
    simul(periods=60); 
    % reaction of observables
    figure(1)
    subplot(3,3,1), plot(Y), title('Y'), axis tight
    subplot(3,3,2), plot(C), title('C'), axis tight
    subplot(3,3,3), plot(I), title('I'), axis tight
    subplot(3,3,4), plot(N), title('N'), axis tight
    subplot(3,3,5), plot(w), title('w'), axis tight
    subplot(3,3,6), plot(r), title('r'), axis tight
    subplot(3,3,7), plot(TR), title('TR'), axis tight
    subplot(3,3,8), plot(I_B), title('I^B'), axis tight
    subplot(3,3,9), plot(G_B), title('G^B'), axis tight;

@# endif

@# if scenario == 2
    steady(solve_algo=3);check;resid;
    % A temporary shock to public investment, economy starts from steady state, there is an unexpected shock in period 1
    shocks; 
    var eps_IB;
    periods 1;
    values  -0.01; 
    end;
    simul(periods=80); 
    % reaction of observables
    figure(2)
    subplot(3,3,1), plot(Y), title('Y'), axis tight
    subplot(3,3,2), plot(C), title('C'), axis tight
    subplot(3,3,3), plot(I), title('I'), axis tight
    subplot(3,3,4), plot(N), title('N'), axis tight
    subplot(3,3,5), plot(w), title('w'), axis tight
    subplot(3,3,6), plot(r), title('r'), axis tight
    subplot(3,3,7), plot(TR), title('TR'), axis tight
    subplot(3,3,8), plot(I_B), title('I^B'), axis tight
    subplot(3,3,9), plot(G_B), title('G^B'), axis tight;
@# endif

@# if scenario == 3 
    % change values for eta, zbar and z
    steady(solve_algo=3);check;resid;
    % A temporary shock to public consumption for increased productivity of public capital
    shocks; 
    var eps_GB; % shock refers to G_B 
    periods 1; 
    values -0.01; % one percent decrease in public consumption
    end;
    simul(periods=60);
    % reaction of observables
    figure(3)
    subplot(3,3,1), plot(Y), title('Y'), axis tight
    subplot(3,3,2), plot(C), title('C'), axis tight
    subplot(3,3,3), plot(I), title('I'), axis tight
    subplot(3,3,4), plot(N), title('N'), axis tight
    subplot(3,3,5), plot(w), title('w'), axis tight
    subplot(3,3,6), plot(r), title('r'), axis tight
    subplot(3,3,7), plot(TR), title('TR'), axis tight
    subplot(3,3,8), plot(I_B), title('I^B'), axis tight
    subplot(3,3,9), plot(G_B), title('G^B'), axis tight;

@# endif

@# if scenario == 4 
    % change values for eta, zbar and z
    steady(solve_algo=3);check;resid;
    % A temporary shock to public investment for increased productivity of public capital
    shocks; 
    var eps_IB;
    periods 1;
    values  -0.01; 
    end;
    simul(periods=80); 
    % reaction of observables
    figure(4)
    subplot(3,3,1), plot(Y), title('Y'), axis tight
    subplot(3,3,2), plot(C), title('C'), axis tight
    subplot(3,3,3), plot(I), title('I'), axis tight
    subplot(3,3,4), plot(N), title('N'), axis tight
    subplot(3,3,5), plot(w), title('w'), axis tight
    subplot(3,3,6), plot(r), title('r'), axis tight
    subplot(3,3,7), plot(TR), title('TR'), axis tight
    subplot(3,3,8), plot(I_B), title('I^B'), axis tight
    subplot(3,3,9), plot(G_B), title('G^B'), axis tight;
@# endif

@# if scenario == 5
    % Return to equilibrium in deterministic model after a
    % permanent increase in tax rate
    initval;
    eps_tau = 0;
    end;
    steady(solve_algo=3); %old steady state as initial value

    endval;
    eps_tau = 0.01; %Jumps to the new value
    end;
    steady(solve_algo=3); %new steady state as endvalue

    simul(periods=100);
    figure(5)
    subplot(3,3,1), plot(Y), title('Y'), axis tight
    subplot(3,3,2), plot(C), title('C'), axis tight
    subplot(3,3,3), plot(I), title('I'), axis tight
    subplot(3,3,4), plot(N), title('N'), axis tight
    subplot(3,3,5), plot(w), title('w'), axis tight
    subplot(3,3,6), plot(r), title('r'), axis tight
    subplot(3,3,7), plot(TR), title('TR'), axis tight
    subplot(3,3,8), plot(I_B), title('I^B'), axis tight
    subplot(3,3,9), plot(G_B), title('G^B'), axis tight;
@# endif




