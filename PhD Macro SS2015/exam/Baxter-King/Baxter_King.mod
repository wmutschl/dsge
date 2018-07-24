@# define exercise = 0
//***********************************************************
// Define variables, exogenous variables and parameters
//**********************************************************
var    Y_t, C_t, I_t, GB_t, IB_t, lambda_t, K_t, KB_t, r_t, w_t, 
       tau_t, TR_t, z_t, N_t,
       dY_t, dC_t, dI_t, dw_t, dGB_t, dIB_t, dN_t, dr_t, dTR_t;
varexo  epsi_z, epsi_gb, epsi_ib, epsi_tau;
parameters  betta, eta, alphaa, theta_l, delta, rho_GB, rho_IB, rho_z, rho_tau,
            Y_ts, C_ts, I_ts, GB_ts, IB_ts, lambda_ts, K_ts, KB_ts, r_ts, 
            w_ts, tau_ts, TR_ts, z_ts, N_ts,
            sigma_z, sigma_gb, sigma_ib, sigma_tau;

//***********************************************************
// Parameter calibration and setting steady-state values
//**********************************************************

// First, set some calibration values:
betta   = 0.988;                        // Discount rate
eta     = 0.05;                          // Productivity effect of public capital
delta   = 0.05;                        // Capital depreciation rate

rho_GB  = 0.75;                         // Autocorrelation parameters
rho_IB  = 0.75;
rho_z   = 0.75;
rho_tau = 0.75;
 

sigma_z = 0.01; sigma_gb = 0.01; sigma_ib = 0.01; sigma_tau = 0.01; // Std. deviations of shocks

// Set some target values and, from there, derive steady state values

TR_ts  = 0;                             // Steady-state transfers=0

Y_ts    = 1;
GB_ts   = 0.2*Y_ts;
IB_ts   = 0.02*Y_ts;
KB_ts   = IB_ts/delta;                  // Implied by capital law of motion

N_ts    = 1/3;
w_ts    = 2;
alphaa = 1 - w_ts*N_ts/Y_ts;              // Implied by marginal product of labor
tau_ts  = (GB_ts+IB_ts)/Y_ts;      // Tax rate implying TR_ts=0

r_ts    = (1/betta - 1 + delta)/(1-tau_ts);                     // Implied interest rate (Euler-Equation)
K_ts    = alphaa*Y_ts/r_ts;         // Capital stock rate by marginal product of capital
I_ts    = delta*K_ts;                   // Private investment

C_ts    = Y_ts - (I_ts + GB_ts + IB_ts); // Resource constraint
z_ts    = Y_ts/(KB_ts^eta*K_ts^alphaa*N_ts^(1-alphaa));

theta_l = w_ts*(1-tau_ts)/(C_ts/(1-N_ts));

lambda_ts = 1/C_ts;



// ######################################################################  
// Include model equations
// ###################################################################### 

model;
// Households
(1-tau_t)*w_t = theta_l*C_t/(1-N_t);                                // Labor-leisure decision
lambda_t = betta*lambda_t(+1)*(1-delta + (1-tau_t(+1))*r_t(+1));    // Investment decision
lambda_t = 1/C_t;                                                   // Marginal utility of consumption

// Capital law of motions
K_t = (1-delta)*K_t(-1) + I_t;                      // Private capital law of motion
KB_t = (1-delta)*KB_t(-1) + IB_t;                   // Public capital law of motion

// Firms
Y_t = z_t*KB_t^eta*K_t(-1)^alphaa*N_t^(1-alphaa); // Production Function
w_t*N_t = (1-alphaa)*Y_t;                               // Marginal product of labor
r_t*K_t(-1) = alphaa*Y_t;                       // Marginal product of capital                
log(z_t/z_ts) = rho_z*log(z_t(-1)/z_ts) + epsi_z;           // AR(1) productivity shock process

// Fiscal authority
GB_t + IB_t + TR_t = tau_t*(w_t*N_t + r_t*K_t(-1));  // Gov. budget constraint
GB_t - GB_ts = rho_GB*(GB_t(-1)-GB_ts) + epsi_gb;
IB_t-IB_ts = rho_IB*(IB_t(-1)-IB_ts) + epsi_ib;
log(tau_t/tau_ts) = rho_tau*log(tau_t(-1)/tau_ts) + epsi_tau;

// Market clearing
Y_t = C_t + I_t + GB_t + IB_t;                        // Market clearing

// Observables
dY_t = 100*(Y_t-Y_ts)/Y_ts;
dC_t = 100*(C_t-C_ts)/C_ts;
dI_t = 100*(I_t-I_ts)/I_ts;
dN_t = 100*(N_t-N_ts);
dw_t = 100*(w_t-w_ts)/w_ts;
dr_t = 100*(r_t-r_ts);
dTR_t = 100*(TR_t-TR_ts);
dGB_t = 100*(GB_t/Y_ts-GB_ts/Y_ts);
dIB_t = 100*(IB_t/Y_ts-IB_ts/Y_ts);





end;


// ######################################################################  
// Set initial values
// ######################################################################

initval;
Y_t     = Y_ts;
C_t     = C_ts;
I_t     = I_ts;
GB_t    = GB_ts;
IB_t    = IB_ts;
lambda_t= lambda_ts;
K_t     = K_ts;
KB_t    = KB_ts;
r_t     = r_ts;
w_t     = w_ts;
tau_t   = tau_ts;
TR_t    = TR_ts;
z_t     = z_ts;
N_t     = N_ts;
dY_t = 0; dC_t = 0; dI_t = 0; dw_t = 0; dGB_t = 0; dIB_t = 0; dN_t = 0; dr_t = 0; dTR_t = 0;
end;    

// ######################################################################  
// Calculate steady state
// ######################################################################

resid(1);
steady;
write_latex_dynamic_model;
@#if exercise == 5
// ######################################################################  
// Do a stochastic simulation
// ######################################################################


shocks;
var epsi_z; stderr sigma_z;
var epsi_gb; stderr sigma_gb;
var epsi_ib; stderr sigma_ib;
var epsi_tau; stderr sigma_tau;
end;

stoch_simul(order = 1, irf=200,nograph);
figure('Name','STOCHASTIC MODEL')
subplot(331); plot([dY_t_epsi_gb dY_t_epsi_ib]) ;title('Y_t');
subplot(332); plot([dC_t_epsi_gb dC_t_epsi_ib]) ;title('C_t');
subplot(333); plot([dI_t_epsi_gb dI_t_epsi_ib]) ;title('I_t');
subplot(334); plot([dw_t_epsi_gb dw_t_epsi_ib]) ;title('w_t');
subplot(335); plot([dGB_t_epsi_gb dGB_t_epsi_ib]) ;title('GB_t');
subplot(336); plot([dIB_t_epsi_gb dIB_t_epsi_ib]) ;title('IB_t');
subplot(337); plot([dN_t_epsi_gb dN_t_epsi_ib]) ;title('N_t');
subplot(338); plot([dr_t_epsi_gb dr_t_epsi_ib]) ;title('r_t');
subplot(339); plot([dTR_t_epsi_gb dTR_t_epsi_ib]) ;title('TR_t');
@#endif

@#if exercise == 6

endval;
epsi_ib = 0.01;
end;
steady;

simul(periods=300);
figure('Name','PERMANENT CHANGE TAX RATE')
subplot(331); plot([dY_t]) ;title('Y_t');
subplot(332); plot([dC_t]) ;title('C_t');
subplot(333); plot([dI_t]) ;title('I_t');
subplot(334); plot([dw_t]) ;title('w_t');
subplot(335); plot([dGB_t]) ;title('GB_t');
subplot(336); plot([dIB_t]) ;title('IB_t');
subplot(337); plot([dN_t]) ;title('N_t');
subplot(338); plot([dr_t]) ;title('r_t');
subplot(339); plot([dTR_t]) ;title('TR_t');

@#endif

