%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author:   Manuel Peter  %%%
%%%% Matrikelnr.: 41444         %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
@#define scenario = 3
%% ----------------------------------------------------------------
% Preamble: Specifying variables
%-----------------------------------------------------------------
var tau_t C_t N_t r_t K_t K_gov_t I_t I_gov_t Y_t z_t G_gov_t TR_t omega_t lamda_t dC_t dY_t dI_t dN_t domega_t dr_t dTR_t dG_gov_t dI_gov_t;
% ENDOGENOUS VARIABLES - THERE ARE 24 UNKNOWN VARIABLES AND 24 EQUATIONS
varexo eps_z eps_tau eps_G eps_I_gov;
% FOUR KINDS OF SHOCKS IN THE MODEL 
varobs Y_t C_t N_t I_t I_gov_t G_gov_t;
parameters theta delta eta alpha beta phi_z phi_tau phi_G phi_I_gov z G_gov I_gov tau C N omega Y TR r I;  
% STEADY STATE VALUES OF SOME ENDOGENOUS VARIABLES ARE PARAMETERS AS WELL


%% ----------------------------------------------------------------
% Calibration: Set inital values for parameters
%------------------------------------------------------------------
theta    = 247/161;
delta    = 0.02;
eta      = 1/4;
alpha    = 1/3;
beta     = 0.97;
phi_z    = 0.75;
phi_tau  = 0.75;
phi_G    = 0.75;
phi_I_gov = 0.75;
z         = 1/(1^(0.25)*(97/19)^(1/3)*(1/3)^(2/3));
G_gov     = 0.2;
I_gov     = 0.02;
tau       = 0.22;
C         = 322/475;
N         = 1/3;
omega     = 2;
Y         = 1;
TR        = 0;
r         = 19/291;
I         = 97/950;


%% ----------------------------------------------------------------
% Model equations.
%------------------------------------------------------------------
model;
% Consumption Leisure Choice
(1-tau_t)*omega_t = theta*(C_t/(1-N_t));                     %1st EQUATION
% Euler Equation
lamda_t = beta*(lamda_t(+1)*((1-delta) + (1-tau_t)*r_t(+1)));  %2nd EQUATION
lamda_t = 1/C_t;                                             %3rd EQUATION
%Private Capital Accumulation Path
K_t = (1-delta)*K_t(-1)+I_t;                                 %4th EQUATION
%Public Capital Accumulation Path
K_gov_t = (1-delta)*K_gov_t(-1)+I_gov_t;                     %5th EQUATION
%Production Function
Y_t = z_t*K_gov_t^(eta)*K_t^(alpha)*N_t^(1-alpha);           %6th EQUATION
%Factor Demand
omega_t*N_t = (1-alpha)*Y_t;                                 %7th EQUATION
r_t*K_t(-1) = alpha*Y_t;                                     %8th EQUATION
%Productivity
log(z_t/z) = phi_z*log(z_t(-1)/z) + eps_z;                   %9th EQUATION
%Public Budget Constraint
G_gov_t + I_gov_t + TR_t = tau_t*(omega_t*N_t+r_t*K_t(-1));  %10th EQUATION
%Public Behavior Persistence
G_gov_t-G_gov = phi_G*(G_gov_t(-1)-G_gov) + eps_G;           %11th EQUATION
I_gov_t-I_gov = phi_I_gov*(I_gov_t-I_gov) + eps_I_gov;       %12th EQUATION
log(tau_t/tau) = phi_tau*log(tau_t(-1)/tau) + eps_tau;       %13th EQUATION
%Budget Constraint for the Economy
Y_t = C_t + I_t +G_gov_t + I_gov_t;                          %14th EQUATION
%Defining First Differences 
dY_t = 100*(Y_t-Y)/Y;                                        %15th EQUATION
dC_t = 100*(C_t-C)/C;                                        %16th EQUATION
dI_t = 100*(I_t-I)/I;                                        %17th EQUATION
dN_t = 100*(TR_t-TR);                                        %18th EQUATION
domega_t = 100*(omega_t-omega)/omega;                        %19th EQUATION
dr_t = 100*(r_t-r);                                          %20th EQUATION
dTR_t = 100*(TR_t-TR);                                       %21th EQUATION
dG_gov_t = 100*(G_gov_t/Y_t-G_gov/Y);                        %22th EQUATION
dI_gov_t = 100*(I_gov_t/Y_t-I_gov/Y);                        %23th EQUATION
end;


%% ----------------------------------------------------------------
% Specify steady_state_model
%------------------------------------------------------------------

initval;
Y_t=1;  
N_t=1/3; 
omega_t=2; 
G_gov_t=0.2; 
I_gov_t=0.02; 
TR_t=0;
tau_t=0.22;
K_gov_t=1;
lamda_t=475/322;
r_t=19/291;
K_t=97/19;
z_t=1/(1^(0.25)*(97/19)^(1/3)*(1/3)^(2/3));
I_t=97/950;
C_t=322/475;
dY_t=0; 
dC_t=0; 
dI_t=0; 
dN_t=0; 
domega_t=0; 
dr_t=0; 
dTR_t=0; 
dG_gov_t=0; 
dI_gov_t=0;
end;
%Steady State Values from Excercise 1.2 are specified in Dynare

%% ----------------------------------------------------------------
% Calculate steady-state, check Blanchard-Khan-conditions and residuals
%------------------------------------------------------------------
steady; check; resid;


%% ----------------------------------------------------------------
% SCENARIO 1: Stochstic model - Public Consumption Shock
%----------------------------------------------------------------
@#if scenario==1
shocks;
var eps_G; stderr 1;
end;
stoch_simul(order=1,nocorr,nomoments,irf=200);
@#endif

%% ----------------------------------------------------------------
% SCENARIO 2: Stochstic model - Public Investment Shock
%------------------------------------------------------------------
@#if scenario==2
shocks;
var eps_I_gov; stderr 1;
end;
stoch_simul(order=1,nocorr,nomoments,irf=200);
@#endif

%% ----------------------------------------------------------------
% SCENARIO 3: Deterministic model - 1% Tax Increase
%------------------------------------------------------------------
@#if scenario==3
initval;
eps_tau=0;
end;
steady;

endval;
eps_tau=0.0111;
end;
steady;

shocks;
var eps_tau;
periods 1:5;
values 0;
end;

simul(periods=300);
rplot C_t;
rplot Y_t;
rplot K_t;
@#endif
