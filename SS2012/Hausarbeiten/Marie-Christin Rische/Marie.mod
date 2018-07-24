%1. Parameter Deklaration:

var Y C I H K A;
varexo e;
parameters beta theta eta delta rho sigma;


%Parameter Werte:

beta=0.99;
theta=0.2292;
eta=1.0051;
delta=0.025;
rho=0.9987;
sigma=0.0056;

%3. Linearisiertes Modell:

model;
Y=A+theta*K+(1-theta)*H;
A=rho*A(-1)+e;
(eta/beta-1+delta)*Y=((eta/beta-1+delta)-theta*(eta-1+delta))*C+theta*(eta-1+delta)*I;
eta*K=(1-delta)*K(-1)+(eta-1+delta)*I(-1);
C+H=Y;
0=(eta/beta)*C-(eta/beta)*C(+1)+(eta/beta+1-delta)*Y(+1)-(eta/beta+1-delta)*K(+1);
end;

%4. Schocks:

shocks;
var e; stderr 1;
end;

%5. Ursprüngliche Werte:

initval;
C=0; Y=0; K=0; I=0; H=0; A=0; end;

% 6. Schätzung:
steady; check;
%stoch_simul(periods=10000, order=1, irf=500);
stoch_simul(periods=10000, order=1, irf=20);
save('artificial_sample.mat','Y');

estimated_params;
beta,beta_pdf, 0.99, 0.01;
theta, beta_pdf, 0.3, 0.05;
eta, normal_pdf, 1.1, 0.1;
delta, beta_pdf, 0.03, 0.01;
rho, beta_pdf, 0.95, 0.05;
end;
varobs Y;

%estimation(datafile=artificial_sample,first_obs=8001,nobs=300,mh_replic=0,mode_check);
estimation(datafile=artificial_sample,first_obs=8001,nobs=200,mode_compute=6,mode_check);
%steady; check;