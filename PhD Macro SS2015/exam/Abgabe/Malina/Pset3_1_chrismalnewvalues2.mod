
%% ----------------------------------------------------------------
% Preamble: Declare variables and parameters.Taken from answer to question 2 in exercise 1
%----------------------------------------------------------------

% List of endogenous variables:
var y, c, k, kb, n, ib, i, gb, w, r, tr, z, tau, dy, dc, di, dn,dw, dr, dtr, dgb, dib;

% List of exogenous variables:
varexo epsilonz, epsilongb, epsilonib, epsilontau;

% List of parameters:
parameters beta, delta, eta, alpha, rho, theta;


beta  = 0.99 ;
delta = 0.02;
eta   = 0.05;
alpha = 1/3;
theta = 1.56/1.08;
rho   = 0.75;

%% ----------------------------------------------------------------
% Declaration of the model
%----------------------------------------------------------------

model;
//consumption-leisure equation
(1-tau)*w = theta*c/(1-n);
//savings decision
1/c = beta*(1/c(+1)*((1-delta)+(1-tau(+1))*r(+1)));
//market clearing equation
y=c+i+gb+ib;
//evolvement in private and public capital stocks
k=(1-delta)*k(-1)+i;
kb=(1-delta)*kb(-1)+ib;
//factor demand equations
w*n=(1-alpha)*y;
r*k(-1)=alpha*y;
//production equation
y=(z*kb(-1)^eta) * (k(-1)^alpha)*n^(1-alpha);
//budget constraint of fiscal authority
gb+ib+tr=tau*(w*n+r*k(-1));
//AR 1 processes - I am trying to get dynare take the steady state value it has calculated, for the time being I am using the initially picked values
gb-steady_state(gb) = rho*(gb(-1)-steady_state(gb))+epsilongb;
ib-steady_state(ib) = rho*(ib(-1)-steady_state(ib))+epsilonib;
log(tau/(steady_state(tau))) = rho*log((tau(-1)/(steady_state(tau))))+epsilontau;
log(z/steady_state(z))=rho*log((z(-1)/(steady_state(z))))+epsilonz;
dy=100*(y-steady_state(y))/steady_state(y);
dc=100*(c-steady_state(c))/steady_state(c);
di=100*(i-steady_state(i))/steady_state(i);
dn=100*(n-steady_state(n));
dw=100*(w-steady_state(w))/steady_state(w);
dr=100*(r-steady_state(r));
dtr=100*(tr-steady_state(tr));
dgb=100*((gb/y)-steady_state(gb)/steady_state(y));
dib=100*((ib/y)-steady_state(ib)/steady_state(y));
end;

%% ----------------------------------------------------------------
% Solving the model
%----------------------------------------------------------------

% Providing the intitial ("steady-state") conditions - taken from question 2 of exercise 1

initval;
y = 1;
c = 0.72;
tr = 0;
gb = 0.2*y;
ib = 0.02*y;
k = 3;
kb =1;
i = 0.06;
w = 2;
n = 1/3;
r = 1/9;
z = 1.44224957031;
tau = 0.22;
epsilonz = 0; 
epsilongb = 0; 
epsilonib = 0; 
epsilontau = 0;

end;

% Instruct dynare to take above values as approximations of steady state and calculate exact steady state

steady;

% ----------------------------------------------------------------
% Shocking the steady-state with unexpected temporary public consumption or unexpected temporary public investment
% Note that I removed one of the two shocks below to only run the consumption or investment shock
%----------------------------------------------------------------


shocks;
var epsilongb; stderr 0.01;
var epsilonib; stderr 0.01;

end;



stoch_simul (periods=1000);
