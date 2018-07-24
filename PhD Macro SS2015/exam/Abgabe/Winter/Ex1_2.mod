%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author: Maximilian Winter                       %%%%
%%%%	Problem set 3                                   %%%%
%%%%    Ex1 (eta=0.2)                                   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set_dynare_seed(123); %Set seed for random number generator

%----------------------------------------------------------------
% Declare variables and parameters
%----------------------------------------------------------------

var         C, dC, dGB, dI, dIB, dN, domega, dr, dTR, dY, GB, I, 
            IB, K, KB, lambda, N, omega,  r, tau, TR, Y, z;        
            
varexo      epsilon_GB, epsilon_IB, epsilon_tau, epsilon_z;

parameters  alpha, beta, C_ss, delta, eta, GB_ss, IB_ss, I_ss, 
            KB_ss, K_ss,lambda_ss, N_ss, omega_ss,  rho_GB, rho_IB, 
            rho_tau, rho_z, rK, r_ss, tau_ss, theta, TR_ss, Y_ss, z_ss; 
                 
	
%----------------------------------------------------------------
% Calibrate intial parameters
%----------------------------------------------------------------

% given parameters
beta=0.988; 
delta=0.05; 
eta=0.2;        % changed eta from 0.05 to 0.2
Y_ss=1;
GB_ss=0.2*Y_ss;  
IB_ss=0.02*Y_ss; 
TR_ss=0; 
omega_ss=2;
N_ss=1/3;  
rho_GB=0.75; 
rho_IB=0.75; 
rho_tau=0.75;            
rho_z=0.75;

% for equation see Ex1.2
alpha=1-(omega_ss*N_ss)/Y_ss;
rK=alpha*Y_ss;
tau_ss=(GB_ss+IB_ss+TR_ss)/(omega_ss*N_ss+rK);  
r_ss=(1-beta*(1-delta))/(beta*(1-tau_ss));
K_ss=(alpha*Y_ss)/r_ss;
I_ss=delta*K_ss; 
C_ss=Y_ss-I_ss-GB_ss-IB_ss;
lambda_ss=1/C_ss; 
theta=((1-tau_ss)*omega_ss*(1-N_ss))/C_ss;
KB_ss=IB_ss/delta; 
z_ss=Y_ss/(KB_ss^eta*K_ss^alpha*N_ss^(1-alpha));

%----------------------------------------------------------------
% Model equations
%----------------------------------------------------------------

model;
%HOUSEHOLDS
% (1)optimal consumption-leisure choice
(1-tau)*omega=theta*(C/(1-N));

% (2)optimal saving decision
lambda=beta*(lambda(+1)*((1-delta)+(1-tau(+1))*r(+1)));

% (3)marginal utility of consumption
lambda=1/C;

% (4)private capital stock
K=(1-delta)*K(-1)+I;

% (5)public capital stock
KB=(1-delta)*KB(-1)+IB;

%FIRMS
% (6)production function
Y=z*((KB(-1))^eta)*((K(-1))^alpha)*(N^(1-alpha));

% (7)optimal labor demand
omega*N=(1-alpha)*Y;

% (8)optimal capital demand
r*K(-1)=alpha*Y;

% (9)evolving of productivity
log(z/z_ss)=rho_z*log((z(-1)/z_ss))+epsilon_z;

%FISCAL AUTHORITY
% (10)budget constrait of fiscal authority
GB+IB+TR=tau*(omega*N+r*K(-1));

% (11)behavior in puplic consumption (GB)
GB-GB_ss=rho_GB*(GB(-1)-GB_ss)+epsilon_GB;

% (12)behavior in puplic investment (IB)
IB-IB_ss=rho_IB*(IB(-1)-IB_ss)+epsilon_IB;

% (13)behavior in taxes (tau)
log(tau/tau_ss)=rho_tau*log(tau(-1)/tau_ss)+epsilon_tau;

% MARKET CLEARING
% (14)market clearing
Y=C+I+GB+IB;

%OBSERVABLES
%(15)change in outcome in percentage deviation from ss
dY=100*(Y-Y_ss)/Y_ss;

%(16)change in consumption in percentage deviation from ss
dC=100*(C-C_ss)/C_ss;

%(17)change in investment in percentage deviation from ss
dI=100*(I-I_ss)/I_ss;

%(18)change in real labor supply in percentage point deviation from ss
dN=100*(N-N_ss);

%(19)change in real wage in percentage point deviation from ss
domega=100*(omega-omega_ss)/omega_ss;

%(20)change in real interest rate in percentage point deviation from ss
dr=100*(r-r_ss);

%(21)change in real lump sum transfers in percentage point deviatio from ss
dTR=100*(TR-TR_ss);

%(22)change in public consumption relative to outcome in percentage point 
%       deviation from ss
dGB=100*((GB/Y)-(GB_ss/Y_ss));

%(23)change in public investment relative to outcome in percentage point 
%       deviation from ss
dIB=100*((IB/Y)-(IB_ss/Y_ss));
end;

%----------------------------------------------------------------
% Steady-State values
%----------------------------------------------------------------

initval;
dC=0; 
dGB=0; 
dI=0; 
dIB=0; 
dN=0; 
domega=0; 
dr=0; 
dTR=0; 
dY=0;  
N=1/3; 
omega=2;  
TR=0; 
Y=1; 
GB=0.2*Y_ss;  
IB=0.02*Y_ss;   
tau=tau_ss;  
r=r_ss;
K=K_ss;
I=I_ss; 
C=C_ss;
lambda=lambda_ss; 
KB=KB_ss; 
z=z_ss;
end;

%----------------------------------------------------------------
% Computations
%----------------------------------------------------------------

% choose your scenario
% scenario 0:   Compute steady-state,check Blanchard-Khan and residuals 
%               of model equations in steady-state (see Ex1.1)
% scenario 1:   Simulation of an unexpected temporary puplic consumption shock (see Ex1.1)
% scenario 2:   Simulation of an unexpected temporary public investment shock (see Ex1.1)
% scenario 3:   Simulation of an unexpected temporary puplic consumption shock
%               with an increased eta 
% scenario 4:   Simulation of an unexpected temporary public investment shock
%               with an increased eta 
% scenario 5:   Simulation of the transition path of a permanent increase in 
%               the tax rate of 1 percentage point (see Ex1.1)

@# define scenario = 3  
%(here, only scenario 3 and 4 are available)

@# if scenario == 3
    steady;
    check;
    resid;

    shocks;
        var epsilon_GB  =0.0001;
    end;

    stoch_simul(order=1,irf=100,periods=200);
@# endif

@# if scenario == 4
    steady;
    check;
    resid;

    shocks;
        var epsilon_IB  =0.0001;
    end;

    stoch_simul(order=1,irf=100,periods=200);
@# endif