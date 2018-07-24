%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Author: Simon Hoof                                                %%%
%%%   Date: August 10, 2015                                             %%%
%%%   Problem Set Macro Phd                                             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% scenario = 1: temporary shock on public consumption
% scenario = 2: temporary shock on public investment
% scenario = 3: permanent shock on tax

@#define scenario = 3

%% ------------------------------------------------------------------------
% Preamble: Declare Variables and Parameters 
%% ------------------------------------------------------------------------
var tau r w z C G_b I I_b K K_b N TR Y; 
varexo e_t e_z e_g e_i;
parameters alpha beta delta eta theta rho_t rho_z rho_g rho_i tau_bar z_bar;


%% ------------------------------------------------------------------------
% Calibration: Fix Parameters 
%% ------------------------------------------------------------------------
alpha = 1/3;
beta  = 0.99;
delta = 0.02;
eta   = 0.05;
theta = 1.04 / (0.78 - 0.02/(3*(1/0.99-0.98)/0.78));
rho_z = 0.75;
rho_t = 0.75;
rho_g = 0.75;
rho_i = 0.75;
z_bar = 1/((1/(3*(1/0.99-0.98)/0.78))^(1/3) * (1/3)^(2/3));
tau_bar = 0.22;

%% ------------------------------------------------------------------------
% Model equations 
%% ------------------------------------------------------------------------
model;
(1-tau)*w       = (theta*C)/(1-N);
C(+1)           = C*beta*(1 - delta + (1-tau(+1))*r(+1));
K               = (1-delta)*K(-1) + I;
K_b             = (1-delta)*K_b(-1) + I_b;
Y               = z*K_b(-1)^eta*K(-1)^alpha*N^(1-alpha);
w*N             = (1-alpha)*Y;
r*K(-1)         = alpha*Y;
G_b + I_b + TR  = tau*(w*N + r*K(-1));
log(z/z_bar)    = rho_z*log(z(-1)/z_bar) + e_z; 
log(tau/tau_bar)= rho_t*log(tau(-1)/tau_bar) + e_t;
G_b - 0.2       = rho_g*(G_b(-1) - 0.2) + e_g;
I_b - 0.02      = rho_i*(I_b(-1) - 0.02) + e_i;
Y               = C + I + G_b + I_b;
end;

%% ------------------------------------------------------------------------
% Compute Steady State  
%% ------------------------------------------------------------------------
%steady_state_model;                % ANALYTICAL SOLUTION
initval;                            % NUMERICAL SOLUTION
tau = tau_bar;
r   = (1/0.99-0.98)/0.78;
w   = 2;
z   = z_bar; 
C   = 0.78 - 0.02/(3*(1/0.99-0.98)/0.78); 
G_b = 0.2;
I   = 0.02/(3*(1/0.99-0.98)/0.78);
I_b = 0.02;
K   = 1/(3*(1/0.99-0.98)/0.78);
K_b = 1;
N   = 1/3;
TR  = 0;
Y   = 1;
end;
steady; check; resid;

%% ------------------------------------------------------------------------
% SCENARIO 1: temporary public conumption shock
%% ------------------------------------------------------------------------
@#if scenario == 1
    shocks; 
    var e_g;
    periods 1;
    values 0.01;
    end;
    simul(periods=400);
do_own_plots_deterministic;
@#endif

%% ------------------------------------------------------------------------
% SCENARIO 2: temporary public investment shock
%% ------------------------------------------------------------------------
@#if scenario == 2
    shocks; 
    var e_i;
    periods 1;
    values 0.01;
    end;
    simul(periods=400);
do_own_plots_deterministic;
@#endif

%% ------------------------------------------------------------------------
% SCENARIO 3: permanent tax shock
%% ------------------------------------------------------------------------
@#if scenario == 3
    initval;
        e_t = 0;  
    end;
    steady;

    endval;
        e_t = log(0.23/0.22)-rho_t*log(0.23/0.22);
    end;
    steady;
    
    simul(periods=400);
    do_own_plots_deterministic; 
@#endif


% SAVE FIGURE
%print('<name>','-dpng')