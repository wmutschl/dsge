 var C K L w r A;
 varexo e;

 parameters rho delta gamma alpha lambda g;

 alpha = 0.33;
 delta = 0.1;
 rho = 0.03;
 lambda = 0.97;
 gamma = 0;
 g = 0.015;
 
 model;
 1/C = 1/(1+rho)*(1/(C(+1)*(1+g)))*(r(+1)+1-delta);
 L^gamma = w/C;
 r = alpha*A*(K(-1)/(1+g))^(alpha-1)*L^(1-alpha);
 w = (1-alpha)*A*(K(-1)/(1+g))^alpha*L^(-alpha);
 K+C = (K(-1)/(1+g))*(1-delta)+A*(K(-1)/(1+g))^alpha*L^(1-alpha);
 log(A) = lambda*log(A(-1))+e;
 end;

 steady_state_model;
 A = 1;
 r = (1+g)*(1+rho)+delta-1;
 L = ((1-alpha)/(r/alpha-delta-g))*r/alpha;
 K = (1+g)*(r/alpha)^(1/(alpha-1))*L;
 C = (1-delta)*K/(1+g)+(K/(1+g))^alpha*L^(1-alpha)-K;
 w = C;
 end;

 steady;

 shocks;
 var e; stderr 0.01;
 end;

 check;

 stoch_simul(order=1,irf=60);
