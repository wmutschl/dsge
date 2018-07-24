%% ----------------------------------------------------------------
% Preamble: Declare variables and parameters.
%----------------------------------------------------------------
    var C Y N I K w r GB IB KB tau TR z dY dC dI dN dw dr dTR dGB dIB  ; % DECLARATION OF THE ENDOGENOUS VARIABLES    
    varexo eps_GB eps_IB eps_tau eps_z;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
    parameters beta theta delta eta alpha rho_z rho_G rho_I rho_tau GB_bar z_bar tau_bar IB_bar sig_z sig_tau sig_IB sig_GB;% DECLARATION OF THE PARAMETERS AND CALIBRATION
alpha = 1/3;
beta = 340/341;
delta = 0.025;
theta = 1.9;
eta = 0.05;
rho_z = 0.75;
rho_G = 0.75;
rho_I = 0.75;
rho_tau = 0.75;
GB_bar = 0.2;
z_bar = 1/(0.8^0.05*(884/95)^alpha*(1/3)^(1-alpha));
IB_bar = 0.02;
tau_bar = 0.22;
sig_z = 0.01;
sig_IB = 0.01;
sig_tau = 0.01;
sig_GB = 0.01;

%Next step: Define the model equation.
model;
%1 comsumption-leisure choice
(1-tau)*w=(theta/(1-N))*C;
%2 savings decision
1/C=beta*(1/C(+1))*((1-delta)+(1-tau(+1))*r(+1));
%3 private capital stock
K=(1-delta)*K(-1)+I;
%4 public capital stock
KB=(1-delta)*(KB(-1))+IB;
%5 factor input function
Y=z*KB(-1)^eta*K(-1)^alpha*N^(1-alpha);
%6&7 factor prices
w*N=(1-alpha)*Y;
r*K(-1)=alpha*Y;
%8 productivity 
log(z/z_bar)=(rho_z)*log(z(-1)/z_bar)+eps_z*sig_z;
%9fiscal budget constraint
GB+IB+TR = tau*(w*N+r*K(-1));
%10,11,12 AR(1) processes
GB-GB_bar=(rho_G)*(GB(-1)-GB_bar)+eps_GB*sig_GB;
IB-IB_bar=(rho_I)*(IB(-1)-IB_bar)+eps_IB*sig_IB;
log(tau/tau_bar)=(rho_tau)*log(tau(-1)/tau_bar)+eps_tau*sig_tau;
%13 market clearing
Y=C+I+GB+IB;
%For reporting issues
dY=100*((Y-steady_state(Y))/steady_state(Y));
dC=100*(C-steady_state(C))/steady_state(C);
dI=100*(I-steady_state(I))/steady_state(I);
dN=100*(N-steady_state(N));
dw=100*(w-steady_state(w))/steady_state(w);
dr=100*(r-steady_state(r));
dTR=100*(TR-steady_state(TR));
dGB=100*(GB/Y-steady_state(GB)/steady_state(Y));
dIB=100*(IB/Y-steady_state(IB)/steady_state(Y));
end;

%Define the initial values
initval;
Y = 1;
N = 1/3;
w = 2;
TR = 0;
IB = IB_bar;
GB = GB_bar; 
C = 52/95;
r = 95/2652;
K = 884/95;
tau = tau_bar;
I = 221/950;
KB = 0.8;
eps_GB = 0;
eps_IB = 0;
eps_tau = 0;
eps_z = 0;
z = z_bar;
end;

%Next step: Scenarios for the different tasks

%Scenario 0: Estimate Steady State and Check Residuals

%Shock to public consumption: Stochastic and Deterministic
%Scenario 1: Stochastic shock to public consumption (for comparison)
%Scenario 2: Unexpected temporary shock to public consumption (deterministic)

%Shock to public investment: Stochastic and Deterministic
%Scenario 3: Stochastic shock to public investment (for comparison)
%Scenario 4: Unexpected temporary shock to public investment (deterministic)

%Scenario 5: Increase in productivity of public capital - Unexpected temporary shock to public consumption (deterministic)
%Scenario 6: Increase in productivity of public capital - Unexpected temporary shock to public investment (deterministic)

%Scenario 7: Permanent increase in the tax rate of 1 percentage point

@# define scenario=0

@# if scenario == 0
    steady; check; resid;
@#endif

@# if scenario == 1
%Stochastic shock to government spending
steady;
shocks;
var eps_GB; stderr 1; 
end;
stoch_simul(periods=500);
own_plot;
@#endif

@# if scenario == 2
%Unexpected temporary shock to public consumption. 
%To receive an unexpected shock the value for the period has to be 1.
%(Otherwise perfect foresight)
steady;
shocks;
var eps_GB;
periods 1; 
values 1;
end;
simul(periods=500);
own_plot;
@#endif

@# if scenario == 3
%Stochastic shock to government investment
steady;
shocks;
var eps_IB; stderr 1; 
end;
stoch_simul(periods=500);
own_plot;
@#endif

@# if scenario == 4
%Unexpected temporary shock to public investment. 
%To receive an unexpected shock the value for the period has to be 1.
%(Otherwise perfect foresight)
steady;
shocks;
var eps_IB;
periods 1; 
values 1;
end;
simul(periods=500);
own_plot;
@#endif


@# if scenario == 5
parameters eta;
eta = 0.15;
steady;

shocks;
var eps_GB;
periods 1;
values 1;
end;
simul(periods=500);
own_plot;
@#endif

@# if scenario == 6
parameters eta;
eta = 0.15;
steady;

shocks;
var eps_IB;
periods 1;
values 1;
end;
simul(periods=500);
own_plot;
@#endif



@# if scenario == 7
initval;
eps_tau=0;
end;
steady;

endval;
eps_tau=1;
end;
steady;

%Transition path from the old to the new steady state 
shocks;
var eps_tau;
periods 1:500;
values 1;
end;
simul(periods=500);
own_plot;
@# endif

