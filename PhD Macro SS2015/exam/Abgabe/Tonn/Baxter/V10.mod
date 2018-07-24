 %/////////////////////////////////////////////////////////////
%////    The Baxter and King (1993) model	 	      ////
%////    Author:   Stefan Tonn (tonn-stefan@t-online.de)   ////
%/////////////////////////////////////////////////////////////

% Scenario 0: Compute steady-state,check Blanchard-Khan and residuals of model equations in steady-state
% Scenario 1: A temporary shock on government spending in deterministic model
% Scenario 2: A temporary shock on government investment in deterministic model
% Scenario 3: A permanent increase in the tax rate of 1 percent in deterministic model



%----------------------------------------------------------------%
%---------------Declare variables and parameters-----------------%
%----------------------------------------------------------------%
 
var C N I K w r Y tau z TR GB IB KB lambda dY dC dI dN dw dr dTR dGB dIB; % DECLARATION OF THE ENDOGENOUS VARIABLES    
varexo eps_z eps_GB eps_IB eps_tau;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
varobs dY dC dI dN dw dr dTR dGB dIB;              % DECLARATION OF THE OBSERVABLE VARIABLES
parameters alpha beta eta delta theta rho_z rho_GB rho_IB rho_tau sig_z sig_tau sig_IB sig_GB; % Steady State Werte einfügen? einfügen DECLARATION OF THE PARAMETERS AND CALIBRATION

% ---------------------------------------------------------------%
% -------Calibration: Set inital values for parameters-----------%
%----------------------------------------------------------------%
alpha = 1/3;            % share of capital in production
beta = 0.99;            % Discount rate
theta = 1.776;          % Fisch labor supply elasticity - 
delta = 0.03;           % Depreciation rate
eta = 0.05;             % Productivity of public capital
rho_z = 0.75;           % Smoothing parameter
rho_GB = 0.75;          % Smoothing parameter
rho_IB = 0.75;          % Smoothing parameter
rho_tau = 0.75;         % Smoothing parameter
sig_z = 0.01;           % Technology shock standard error
sig_IB = 0.01;          % Government investment shock standard error   
sig_GB = 0.01;          % Government consumption shock standard error
sig_tau = 0.01;         % Tax shock standard error

% ----------------------------------------------------------------%
% --------------------------Model equations-----------------------%
%-----------------------------------------------------------------%
model;
%1Consumption leisure choice
(1-tau)*w=theta*(C/(1-N));
%2Saving decision
lambda=beta*(lambda(+1)*((1-delta)+(1-tau(+1))*r(+1)));
%3Marginal utility of consumption
lambda = 1/C;
%4Private capital stock
K=(1-delta)*K(-1)+I;
%5Public capital stock
KB=(1-delta)*KB(-1)+IB;
%6Production function
Y=z*((KB(-1))^eta)*((K(-1))^alpha)*(N^(1-alpha));
%7,8Factor demand
w*N=(1-alpha)*Y;
r*K(-1)=alpha*Y;
%9 Productivity
log(z/steady_state(z))=rho_z*log(z(-1)/steady_state(z))+ sig_z*eps_z;
%10 Fiscal budget constraint
GB+IB+TR=tau*(w*N+r*K(-1)); 
%11-13 Behaviour as AR(1)-process
GB-steady_state(GB)=rho_GB*(GB(-1)-steady_state(GB))+sig_GB*eps_GB;
IB-steady_state(IB)=rho_IB*(IB(-1)-steady_state(IB))+sig_IB*eps_IB;
log(tau/steady_state(tau))=rho_tau*log(tau(-1)/steady_state(tau))+sig_tau*eps_tau;
%14 Market clearing
Y=C+I+GB+IB;
%15-23 Observables for reporting issues
dY=100*((Y-steady_state(Y))/steady_state(Y));
dC=100*((C-steady_state(C))/steady_state(C));
dI=100*((I-steady_state(I))/steady_state(I));
dN=100*((N-steady_state(N)));
dw=100*((w-steady_state(w))/steady_state(w));
dr=100*((r-steady_state(r)));
dTR=100*((TR-steady_state(TR)));
dGB=0;
dIB=0;
end;

%----------------------------------------------------------------%
%---------------------Specify initial values---------------------%
%----------------------------------------------------------------%
initval;
Y=1; GB = 0.2; IB = 0.02; TR = 0; w = 2; 
N = 1/3; r = 0.0514; K = 6.485;  tau = 0.22; 
C = 0.5855; lambda = 1.708; KB = 2/3; 
I = 0.19455; z= 1.1383;
end;


%----------------------------------------------------------------%
%-------------------------Computations---------------------------%
%----------------------------------------------------------------%

@# define scenario = 2
%----------------------------Scenario 0 ------------------------------%
% Calculate steady-state, check Blanchard-Khan- conditions and residuals
%---------------------------------------------------------------------%

@# if scenario == 0
    steady(solve_algo=3);check;resid;
@# endif

%---------------------------Scenario 1 -------------------------------%
%---------------Temporary shock on public consumption-----------------%
%---------------------------------------------------------------------%
@# if scenario == 1    
steady(solve_algo=3); check; resid;
shocks;
var eps_GB;
periods 1;
values 1;
end;
simul(periods=100);
%-------------Plot the reactions of observables---------------%
figure(1)
subplot(3,4,1), plot(Y), title('Output'), axis tight
subplot(3,4,2), plot(C), title('Consumption'), axis tight
subplot(3,4,3), plot(I), title('Investment'), axis tight
subplot(3,4,4), plot(N), title('Labor supply'), axis tight
subplot(3,4,5), plot(w), title('Real Wage'), axis tight
subplot(3,4,6), plot(r), title('Real Interest Rate'), axis tight
subplot(3,4,7), plot(TR), title('Lump-sum Transfers'), axis tight
subplot(3,4,8), plot(IB), title('Public Inverstment'), axis tight
subplot(3,4,9), plot(GB), title('Public Consumption'), axis tight
subplot(3,4,10), plot(KB), title('Public Capital'), axis tight
subplot(3,4,11), plot(K), title('Private Capital'), axis tight
subplot(3,4,12), plot(tau), title('Tax Rate'), axis tight
@#endif
%--------------------------Scenario 2------------------------------------%
%----------------Temporary shock on public investment--------------------%
%------------------------------------------------------------------------%
@# if scenario == 2    
steady(solve_algo=3); check; resid;
shocks; 
var eps_IB;
periods 1;
values 1;
end;
simul(periods=100);
%-------------Plot the reactions of observables---------------%
figure(2)
subplot(3,4,1), plot(Y), title('Output'), axis tight
subplot(3,4,2), plot(C), title('Consumption'), axis tight
subplot(3,4,3), plot(I), title('Investment'), axis tight
subplot(3,4,4), plot(N), title('Labor supply'), axis tight
subplot(3,4,5), plot(w), title('Real Wage'), axis tight
subplot(3,4,6), plot(r), title('Real Interest Rate'), axis tight
subplot(3,4,7), plot(TR), title('Lump-sum Transfers'), axis tight
subplot(3,4,8), plot(IB), title('Public Inverstment'), axis tight
subplot(3,4,9), plot(GB), title('Public Consumption'), axis tight
subplot(3,4,10), plot(KB), title('Public Capital'), axis tight
subplot(3,4,11), plot(K), title('Private Capital'), axis tight
subplot(3,4,12), plot(tau), title('Tax Rate'), axis tight
@#endif

% ----------------------------Scenario 3----------------------------------%
%-------A permanent increase in the tax rate in deterministic model-------%
%-------------------------------------------------------------------------%
                 % I was trying it this way:  
% @#if scenario == 3
% %initval;
% eps_tau= 0;
% end;
% steady(solve_algo=2); %old steady state as initial value
% endval;
% eps_tau = 0.01; %Jumps to the new value
% end;
% steady(steady_algo=2); %new steady state as endvalue
% simul(periods=300);
% rplot K;
% rplot C;
% @# endif
% 
% %But I am doing a mistake so that MATLAB does not calculate the long run steady state in the case of
% % permanent shocks. Therefore I simulate an unanticipated shock for a long
% % duration such as 1000 periods and simulate the model for the same
% % duration. I hope to have received similar results and explain exercise 5 using
% % my results. But of course I do not get new steady state values this way.

@#if scenario ==3
steady(solve_algo=3);check;resid;
shocks;
var eps_tau; 
periods 1:1000;
values 0.01;
end;
simul(periods=1000);
%-------------Plot the reactions of observables---------------%
figure(3)
subplot(3,4,1), plot(Y), title('Output'), axis tight
subplot(3,4,2), plot(C), title('Consumption'), axis tight
subplot(3,4,3), plot(I), title('Investment'), axis tight
subplot(3,4,4), plot(N), title('Labor supply'), axis tight
subplot(3,4,5), plot(w), title('Real Wage'), axis tight
subplot(3,4,6), plot(r), title('Real Interest Rate'), axis tight
subplot(3,4,7), plot(TR), title('Lump-sum Transfers'), axis tight
subplot(3,4,8), plot(IB), title('Public Inverstment'), axis tight
subplot(3,4,9), plot(GB), title('Public Consumption'), axis tight
subplot(3,4,10), plot(KB), title('Public Capital'), axis tight
subplot(3,4,11), plot(K), title('Private Capital'), axis tight
subplot(3,4,12), plot(tau), title('Tax Rate'), axis tight

@#endif