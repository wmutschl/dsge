// Simulation of the Clarida, Gali, Gertler model

var da pie r rstar tau u x; 	   // DECLARATION OF THE ENDOGENOUS VARIABLES

varexo eps_u eps_a eps_tau;    // DECLARATION OF THE STRUCTURAL INNOVATIONS.

parameters phi beta kappa phi_x phi_pie alpha rho lambda delta; // DECLARATION OF THE PARAMETERS.

// Parameter Values  
beta    = 0.97;
phi_x   = .0;
phi_pie = 1.5;
alpha   = 0.0;
rho     = 0.2;
lambda  = 0.5;
delta   = 0.2;
phi     = 1;
theta   = 0.75;
kappa   = ((1-theta)*(1-beta*theta)*(1+phi))/(theta);

// DECLARATION OF THE (LINEAR) DSGE MODEL: 
model(linear);

    beta*pie(+1) + kappa*x = pie;                                      // Calvo Pricing Equation
    r - pie(+1)-rstar   = x(+1) - x;                                   // Intertemporal Equation
    alpha*r(-1)+u+(1-alpha)*phi_pie*pie + (1-alpha)*phi_x*x = r;       // Monetary Policy Rule
    rstar = da(+1) + (1-lambda)/(1+phi)*tau;                           // Definition of the Natural Rate
    da = rho*da(-1) + eps_a;
    tau       = lambda*tau(-1) + eps_tau;
    u         = delta*u(-1) + eps_u;
end;

shocks;
var eps_a;
stderr 1;
var eps_tau;
stderr 1;
var eps_u;
stderr 0.0;
end;

stoch_simul(irf=7,nograph) ;
