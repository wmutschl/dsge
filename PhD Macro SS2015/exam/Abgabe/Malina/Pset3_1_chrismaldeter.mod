
%% ----------------------------------------------------------------
% Preamble: Declare variables and parameters.Taken from answer to question 2 in exercise 1
%----------------------------------------------------------------

% List of endogenous variables:
var y, c, k, kb, n, ib, i, gb, w, r, tr, z, dy, dc, di, dn,dw, dr, dtr, dgb, tau, dib;

% List of exogenous variables:


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
//AR 1 processes 
gb-steady_state(gb) = rho*(gb(-1)-steady_state(gb));
ib-steady_state(ib) = rho*(ib(-1)-steady_state(ib));
log(tau/(steady_state(tau))) = rho*log((tau(-1)/(steady_state(tau))));
log(z/steady_state(z))=rho*log((z(-1)/(steady_state(z))));
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

% Providing the intitial ("steady-state") conditions - taken from the steady-state found under 4

initval;
y=0.452577;
c=0.302495;
k=1.35773;
kb=0.558759;
n=0.15759;
ib=0.0111752;
i=0.0271547;
gb=0.111752;
w=1.91457;
r=0.111111;
tr=0.207043;
z=1.44225;
tau=0.729091;
dy=0;
dc=0;
di=0;
dn=0;
dw=0;
dr=0;
dtr=0;
dgb=0;
dib=0;
end;

steady;



% I tell dynare where it should search for stead-state it- same as before but tau=0.739098

endval;
y=0.452577;
c=0.302495;
k=1.35773;
kb=0.558759;
n=0.15759;
ib=0.0111752;
i=0.0271547;
gb=0.111752;
w=1.91457;
r=0.111111;
tr=0.207043;
z=1.44225;
tau=0.739091;
dy=0;
dc=0;
di=0;
dn=0;
dw=0;
dr=0;
dtr=0;
dgb=0;
dib=0;
end;

steady;



simul(periods=3000);
