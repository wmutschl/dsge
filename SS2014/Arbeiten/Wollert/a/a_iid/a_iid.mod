    var pie x r rstar a tau dy da;   
    varexo eps_a;                   
    parameters phi beta kappa phi_x phi_pie alpha rho lambda sig_a; 

    beta    = 0.97;
    phi_x   = 0;
    phi_pie = 1.5;
    alpha   = 0;
    rho     = 0;
    lambda  = 0.5;
    phi     = 1;
    theta   = 0.75;
    sig_a   = 0.02;  
    kappa   = ((1-theta)*(1-beta*theta)*(1+phi))/(theta);
    
 model;
    % Calvo Pricing Equation
    pie = beta*pie(+1) + kappa*x;
    % Intertemporal Equation
    x = -(r - pie(+1) - rstar) + x(+1);
    % Monetary Policy Rule
    r = alpha*r(-1) + (1-alpha)*(phi_pie*pie + phi_x*x); 
    % Technology shock
    da = rho*da(-1) + sig_a*eps_a;
    da= a-a(-1);
    % Preferences
    tau = tau(-1);       
    % Natural Rate
    rstar = rho*(a - a(-1)) + (1-lambda)/(1+phi)*tau;
    % Output growth
    dy  = x - x(-1) + (a - a(-1)) - (tau - tau(-1))/(1+phi);    
end;

    
 shocks;
     var eps_a; stderr 1;
 end;

 
 steady; check;
 
 stoch_simul(order=1,nocorr,nomoments,irf=8);
    
    