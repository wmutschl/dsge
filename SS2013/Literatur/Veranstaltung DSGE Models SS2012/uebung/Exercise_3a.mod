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

 initval;
 C=1; K=3;L=0.9;w=1;r=0.15;A=1;
 end;
 

 steady;

 shocks;
 var e; stderr 0.01;
 end;

 check;

 stoch_simul(order=1,irf=60);
