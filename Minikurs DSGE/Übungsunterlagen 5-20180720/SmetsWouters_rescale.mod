% Smets and Wouters (2003)
%
% An estimated dynamic stochastic general
% equilibrium model of the euro area
%
% Journal of the European Economic Association
% September 2003, 1(5), 1123-1175
% 
% Author:       Fabian Gößling
% This version: 05.02.2016
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% 1. Declare variables and parameters
%--------------------------------------------------------------------------
	var  e_a e_I e_b e_L e_G e_pi  one pi w K Q I C R r L Y pi_f w_f K_f Q_f I_f C_f R_f r_f L_f Y_f;
	varexo ee_a ee_I ee_b ee_L ee_G ee_pi n_p n_Q n_R n_w; 
	parameters h sigma_c beta adj tau gamma_p xi_p alpha gamma_w xi_w sigma_L lambda_w psi phi k g rho r_pi r_Y r_dpi r_dY r_k rho_a rho_I rho_b rho_L rho_G rho_pi sd_Q sd_p sd_w sd_R;
	%varobs Y C I pi w L R; 
	
%--------------------------------------------------------------------------
% 2. Set parameters
%--------------------------------------------------------------------------

    beta        = 0.99;
    tau         = 0.025;
    alpha       = 0.3;
    psi         = 1/0.169;
    gamma_p     = 0.469;
    gamma_w     = 0.763;
    lambda_w    = 0.5;
    xi_p        = 0.908;
    xi_w        = 0.737; 
    sigma_L     = 2.4;
    sigma_c     = 1.353;
    h           = 0.573;
    phi         = 1.408;
    adj         = 1/6.771;
    r_k         = (1/beta)-1+tau;
    k           = 8.8;
    g           = 0.18;
    r_dpi       = 0.14;
    r_Y         = 0.099;
    r_dY        = 0.159;
    rho         = 0.961; 
    r_pi        = 1.684; 
       
    
    rho_L       = 0.889;
    rho_a       = 0.823;
    rho_b       = 0.855;
    rho_G       = 0.949;
    rho_pi      = 0.924;
    rho_I       = 0.927;
  
    sd_R        = 0.081;
    
    sd_p        = 0.16;
    sd_w        = 0.289;
    sd_Q        = 0.604; 
    

%--------------------------------------------------------------------------
% 3. Model equations
%--------------------------------------------------------------------------
	model(linear);
    % System 1: Sticky prices & wages and cost-push shocks
    
    % Consumption, Eq. (28)
    % e_b(t+1) taken out
	C = (h/(1 + h))*C(-1) + (1/(1 + h))*C(+1) - ((1 - h)/((1 + h)*sigma_c))*(R - pi(+1)) + ((1 - h)/((1 + h)*sigma_c))*e_b;
    
    % Investment, Eq. (29)
    % e_I(t+1) taken out
    % e_I(t) rescaled
    I = (1/(1 + beta))*I(-1) + (beta/(1 + beta))*I(+1) + (adj/(1 + beta))*Q + e_I;
    
    % Q-equation, Eq. (30)
    Q = -(R - pi(+1)) + ((1 - tau)/(1 - tau + r_k))*Q(+1) + (r_k/(1 - tau + r_k))*r(+1) + n_Q;
    
    % Capital, Eq. (31)
    K = (1 - tau)*K(-1) + tau*I(-1);
    
    % Phillips Curve, Eq. (32)
    % Rescaled n_p
    pi = (beta/(1 + beta*gamma_p))*pi(+1) + (gamma_p/(1 + beta*gamma_p))*pi(-1) + (((1 - beta*xi_p)*(1 - xi_p))/((1 + beta*gamma_p)*xi_p))*(alpha*r + (1 - alpha)*w - e_a) + n_p;
    
    % Wages, Eq. (33) 
    % + e_L instead of - e_L
    % Rescaled n_w
    w = (beta/(1 + beta))*w(+1) + (1/(1 + beta))*w(-1)
        + (beta/(1 + beta))*pi(+1) - ((1 + beta*gamma_w)/(1 + beta))*pi + (gamma_w/( 1 + beta))*pi(-1) - ((1/1 + beta)*((1 - beta*xi_w)*(1 - xi_w))/((1 + (1/lambda_w)*((1 + lambda_w)*sigma_L))*xi_w))*(w - sigma_L*L - (sigma_c/(1 - h))*(C - h*C(-1)) + e_L) - n_w;
    
    % Labor demand, Eq. (34)
    L = -w + (1 + psi)*r + K(-1);
    
    % Production,   Eq. (35) I
    Y = phi*e_a + phi*alpha*K(-1) + phi*alpha*psi*r + phi*(1 - alpha)*L;
    
    % Goods market, Eq. (35) II
    % Rescaled e_G
    Y = (1 - tau*k - g)*C + tau*k*I + e_G;
    
    % Monetary policy, Eq. (36)
    R = rho*R(-1) + (1 - rho)*(e_pi + r_pi*(pi(-1) - e_pi) + r_Y*(Y - Y_f)) + r_dpi*(pi - pi(-1)) + r_dY*((Y - Y_f) - (Y(-1) - Y_f(-1))) + n_R;
       
    
    
    % System 2: Flexible System
    
    % Price Stickyness: xi_p = 0 
    % Wage Stickyness: xi_w = 0;
    % Cost shocks: n_p = 0, n_Q = 0, n_w = 0
    
   	C_f     = (h/(1 + h))*C_f(-1) + (1/(1 + h))*C_f(+1) - ((1 - h)/((1 + h)*sigma_c))*(R_f - pi_f(+1)) + ((1 - h)/((1 + h)*sigma_c))*e_b;
    I_f     = (1/(1 + beta))*I_f(-1) + (beta/(1 + beta))*I_f(+1) + (adj/(1 + beta))*Q_f + e_I;
    Q_f     = -(R_f - pi_f(+1)) + ((1 - tau)/(1 - tau + r_k))*Q_f(+1) + (r_k/(1 - tau + r_k))*r_f(+1);
    K_f     = (1 - tau)*K_f(-1) + tau*I_f(-1);
    pi_f	= 0*one;
    0       = alpha*r_f+(1-alpha)*w_f - e_a;
    w_f     = sigma_L*L_f + (sigma_c/(1 - h))*(C_f - h*C_f(-1)) + e_L;
    L_f     = -w_f + (1 + psi)*r_f + K_f(-1);
    Y_f     = phi*e_a + phi*alpha*K_f(-1) + phi*alpha*psi*r_f + phi*(1 - alpha)*L_f;
    Y_f     = (1 - tau*k - g)*C_f + tau*k*I_f + e_G;

    % Shocks
    e_I     = rho_I*e_I(-1) + ee_I;
    e_b     = rho_b*e_b(-1) + ee_b;
    e_L     = rho_L*e_L(-1) + ee_L;
    e_G     = rho_G*e_G(-1) + ee_G;
    e_a     = rho_a*e_a(-1) + ee_a;
    e_pi    = rho_pi*e_pi(-1)+ ee_pi;
    one     = 0*one(-1);
    end;
%--------------------------------------------------------------------------
% 4. Specify shocks 
%--------------------------------------------------------------------------

    shocks;
	var ee_b; stderr 1;
    var ee_I; stderr 1;
    var ee_a; stderr 1;
    var ee_L; stderr 1;
    var ee_G; stderr 1;
    var ee_pi; stderr 1;
    var n_Q; stderr sd_Q; 
    var n_p; stderr sd_p;
    var n_w; stderr sd_w;
    var n_R; stderr sd_R;
    
	end;
	
%--------------------------------------------------------------------------
% 5. Initial values 
%--------------------------------------------------------------------------
    initval; 
% 	C       = 0;
%     I       = 0;
%     Q       = 0;
%     K       = 0;
%     pi      = 0;
%     w       = 0;
%     L       = 0;
%     Y       = 0;
%     R       = 0;
%     r       = 0;
    e_a     = 0;
    e_I     = 0;
    e_b     = 0;
    e_L     = 0;
    e_G     = 0;
    e_pi    = 0;
	end;

%--------------------------------------------------------------------------
% 6. Solution & Simulation
%--------------------------------------------------------------------------
steady; check;
stoch_simul(periods=10000,irf=0,order=1,simul_replic=1000,noprint); 
		
%--------------------------------------------------------------------------
% 7. Estimation
%--------------------------------------------------------------------------
