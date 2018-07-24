

%% ----------------------------------------------------------------
% Preamble: Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
    var tau z omega KB Y C I N r TR GB IB K lambda; 
    varexo eps_z eps_GB eps_IB eps_tau;
    varobs Y C I N omega r TR GB IB;
    parameters beta theta delta eta alpha lambda_bar K_bar KB_bar rho_z rho_GB rho_IB rho_tau sig_z sig_GB sig_IB sig_tau z_bar GB_bar IB_bar tau_bar Y_bar N_bar omega_bar C_bar I_bar r_bar;

@#define shock_I = 4
%% ----------------------------------------------------------------
% Calibration: Set inital values for parameters
%----------------------------------------------------------------
    beta    = 0.99;
    theta   = 1.3619; % from calibration to steady state
    delta   = 0.02;
    eta     = 0.80;
    alpha   = 0.3333; % from calibration to steady state

    rho_z   = 0.75;
    rho_GB  = 0.75;
    rho_IB  = 0.75;
    rho_tau = 0.75;

    sig_z   = 0.01;
    sig_GB  = 0.01;
    sig_IB  = 0.01;
    sig_tau = 0.01;

    z_bar   = 2.2238; % from calibration to steady state
    GB_bar  = 0.2000; % from calibration to steady state
    IB_bar  = 0.0200; % from calibration to steady state 
    tau_bar = 0.2200; % from calibration to steady state
    Y_bar = 1;      % from calibration to steady state
    N_bar = 1/3;    % from calibration to steady state 
    omega_bar = 2;  % from calibration to steady state
    C_bar = 0.7636; % from calibration to steady state
    I_bar = 0.0164; % from calibration to steady state
    r_bar = 0.4073; % from calibration to steady state
    lambda_bar = 1.3095; % from calibration to steady state
    K_bar = 0.8184; % from calibration to steady state
    KB_bar = 1;     % from calibration to steady state

%% ----------------------------------------------------------------
% Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
model;
   
    tau = -(theta*C/(1-N)/omega-1); % EQ: (1)
    lambda = beta*lambda(+1)*((1-delta)+(1-tau(+1))*r(+1)); % EQ: (2)
    lambda = 1/C;                   % EQ: (3)
    K = (1-delta)*K(-1) + I;        % EQ: (4)
    KB = (1-delta)*KB(-1) + IB;     % EQ: (5)
    Y = z*(KB(-1))^eta*(K(-1))^alpha*(N)^(1-alpha); % EQ: (6)
    omega = (1-alpha)*Y/N;          % EQ: (7)
    r = alpha*Y/K(-1);              % EQ: (8)
    log(z/z_bar) = rho_z*log(z(-1)/z_bar) + sig_z*eps_z; % EQ: (9)
    N = (TR/tau+(GB + IB)-r*K(-1))/omega; % EQ: (10)
    GB  = rho_GB*(GB(-1) - GB_bar) + sig_GB*eps_GB + GB_bar; % EQ: (11)
    IB  = rho_IB*(IB(-1) - IB_bar) + sig_IB*eps_IB + IB_bar; % EQ: (12)
    log(tau/tau_bar) = rho_tau*log(tau(-1)/tau_bar) + sig_tau*eps_tau; % EQ: (13)   
    Y = C + I + GB + IB;           % EQ: (14)
   
end;

% Inital Values = steady state
initval;
    tau = tau_bar;
    lambda = lambda_bar;
    K = K_bar;
    KB = KB_bar;
    GB = GB_bar;
    Y = Y_bar;
    omega = omega_bar;
    r = r_bar;
    z = z_bar;
    N = N_bar;
    IB = IB_bar;
    C = C_bar;
    
end;
check; steady;


%% ----------------------------------------------------------------
% Stochastic model - temporary shock
%----------------------------------------------------------------
 
@#if shock_I == 1
   shocks;
        
        var eps_GB; periods 1; values 1;
        
        
    end;

    simul(periods=200); %deterministic simulation
@#endif


@#if shock_I == 2
   shocks;       
        
        var eps_IB; periods 1; values 1;
        
    end;

    simul(periods=200); %deterministic simulation
@#endif


@#if shock_I == 3
   shocks;       
        
        var eps_z; periods 1; values 1;
        
    end;

    simul(periods=200); %deterministic simulation
@#endif

%% ----------------------------------------------------------------
% SCENARIO 2: Stochastic model - temporary shock
%----------------------------------------------------------------
@#if shock_I == 4
    shocks;
        var eps_z; stderr 1;
        var eps_GB; stderr 1;
        var eps_IB; stderr 1;
        var eps_tau; stderr 1;
    end;
    stoch_simul(order=1,nocorr,nomoments,irf=10); %stochastic simulation
   
@#endif

    


















