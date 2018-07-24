/////////////////////////////////////////////////////////////
////    Advanced Macroeconomics                          ////
////    Problem Set 3                               	 ////
////    Author:  Lena Gerling (PhD Student)              ////
////    Date: September 04, 2015    			   		 ////
/////////////////////////////////////////////////////////////

%//////////////////////////////////////////////////////////////////////////
%////   EXERCISE 1.5: Code for IRF with alternative calibration of     ////
%////                   the productivitiy of public capital, eta       ////
%//////////////////////////////////////////////////////////////////////////

set_dynare_seed(123); %Set seed for random number generator

%--------------------------------------------------------------------------
% EXERCISE 1.3
% 1.step: Declare what are the endogenous, exogenous and 
%         parameters in the model
%--------------------------------------------------------------------------
var y, dy, gb, dgb, ib, dib, tr, dtr, w, dw, n, dn, c, dc, i, di, r, dr, k, kb, tau, z; 
                        % DECLARATION OF THE ENDOGENOUS VARIABLES  
varexo ez egb eib etau; % DECLARATION OF SHOCKS 
parameters beta, delta, eta, theta, alpha, rhoz, rhogb, rhoib, rhotau, ybar, gbbar, ibbar, trbar, wbar, nbar, cbar, ibar, rbar, kbar, kbbar, zbar, taubar;
                        % DECLARATION OF THE PARAMETERS




%--------------------------------------------------------------------------
% 2. step: Calibrate the intial parameters values; 
%           with these values, the data is simulated later 
%--------------------------------------------------------------------------

beta    = 0.99;
delta   = 0.02;
eta     = 0.50;  % Alternative calibration of productivity of public capital
theta   = 1.7;
alpha   = 1/3;

rhoz    = 0.75;
rhogb   = 0.75;
rhoib   = 0.75;
rhotau  = 0.75;

ybar    = 1;
gbbar   = 0.2;
ibbar   = 0.02;
trbar   = 0;
wbar    = 2;
nbar    = 1/3; 
taubar  = 0.22;
zbar    = 1.03; 
kbbar   = 1;
rbar    = 0.04;
kbar    = 8.3; 
ibar    = 0.17;
cbar    = 0.61;






%--------------------------------------------------------------------------
% 3. step: Define the model equations
%          We have 13 equations that describe our model
%--------------------------------------------------------------------------


model;
(1-tau)*w = theta*(c/(1-n));                                             %eq1
1/c = beta*((1/c(+1))*((1-delta)+ (1-tau(+1))*r(+1)));                   %eq2
k = (1-delta)*k(-1) + i;                                                 %eq3
kb = (1-delta)*kb(-1)+ib;                                                %eq4
y = z*kb(-1)^(eta)*k(-1)^(alpha)*n^(1-alpha);                            %eq5
w*n = (1-alpha)*y;                                                       %eq6
r*k(-1) = alpha*y;                                                       %eq7
log(z/zbar) = rhoz*log(z(-1)/zbar)+ez ;                                  %eq8
gb + ib + tr = tau*(w*n + r*k(-1));                                      %eq9
gb - gbbar = rhogb*(gb(-1) - gbbar) + egb;                               %eq10
ib - ibbar = rhoib*(ib(-1) - ibbar) + eib;                               %eq11
log(tau/taubar) = rhotau*log(tau(-1)/taubar) + etau;                     %eq12
y = c+ i+ gb + ib;                                                       %eq13
dy = 100*(y-ybar)/ybar;                                                  %eq14
dc = 100*(c - cbar)/cbar;                                                %eq15
di = 100*(i - ibar)/ibar;                                                %eq16
dn = 100*(n - nbar)/nbar;                                                %eq17
dw = 100*(w - wbar)/wbar;                                                %eq18
dr = 100*(r - rbar);                                                     %eq19
dtr = 100*(tr - trbar);                                                  %eq20
dgb = 100*(gb - gbbar)/gbbar;                                            %eq21
dib = 100*(ib - ibbar)/ibbar;                                            %eq22
end;



%--------------------------------------------------------------------------
% 4.step: To solve the model, determine the steady-state values of all 
%           endogenous variables
%           This can be done with the analytical solution of the model, 
%           or by setting initial values for the variables       
%--------------------------------------------------------------------------

%Option chosen: Set as initial values the steady states

initval;
y      = 1;
gb     = 0.2;
ib     = 0.02;
tr     = 0;
w      = 2;
n      = 1/3; 
tau    = 0.22;
z      = 1.03; 
kb     = 1;
r      = 0.04;
k      = 8.3; 
i      = 0.17;
c      = 0.61;
end;
steady;
check;
resid;


%----------------------------------------------------------------
% EXERCISE 1.5
% Computations with higher eta
%----------------------------------------------------------------

%SCENARIOS
% Scenario 1: A temporary shock to public consumption in the stochastic model with eta = 0.5
% Scenario 2: A temporary shock to public investment in the stochastic model with eta = 0.5

% Set macro directive for which scenario (this is just for convenience), no semicolon
@#define scenario = 2


%--------------------------------------------------------------------------
% SCENARIO 1: Stochastic model: (unexpected) temporary shock in 
%               public consumption (gb) with higher eta (=0.5)
% 
% Note: From ex. 1.3, we assume small shock std. errors of 1%
%--------------------------------------------------------------------------
@#if scenario == 1
    shocks;
        var egb = 0.0001;   
    end;
    stoch_simul(order=1,nocorr,nomoments,irf=10); %stochastic simulation
@#endif


%% ------------------------------------------------------------------------
% SCENARIO 2: Stochastic model: (unexpected) temporary shock in 
%               public investment (ib) with higher eta(=0.5)
%--------------------------------------------------------------------------
@#if scenario == 2
    shocks;
        var eib = 0.0001;     
    end;
    stoch_simul(order=1,nocorr,nomoments,irf=10); %stochastic simulation
 @#endif




