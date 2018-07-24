%
%///////////////////////////////////////////////////////////
%///////   Model:  Baxter & King  (1993)          //////////
%///////   Author: Ferdinand Kuhn                 //////////
%///////   Matrikelnr: 425785 (Masters student)   //////////
%///////////////////////////////////////////////////////////


set_dynare_seed(123); 

%-----------------------------------------------------------------
% Preamble
% ========
%-----------------------------------------------------------------

var c dc di di_b dg_b dn dw dr dtr dy g_b i i_b k k_b lambda n r tau tr w y z;
    %declares the endogenous variables

varexo epsilon_z epsilon_g_b epsilon_i_b epsilon_tau;
    %declare the exogenous variables

parameters alpha beta delta eta rho_g_b rho_i_b rho_z rho_tau sigma theta_l c_bar g_bar 
g_b_bar i_bar i_b_bar k_bar k_b_bar n_bar r_bar tau_bar tr_bar w_bar y_bar z_bar;     



%----------------------------------------------------------------
% Calibration
% ===========
%----------------------------------------------------------------

    alpha       = 1/3;      % calculated

    beta        = 0.988;    % King, Plosser, Rebelo (1988, p.208)

    delta       = 0.025;    % King, Plosser, Rebelo (1988, p.218)

    eta         = 0.05;     % public-capital productivity < capital share 
                            % in production Baxter King p.330;
                            % Assume eta=0.2 for task 1.5.

    sigma       = 0.01;     % std. dev. for shocks, taken from assignment paper

    theta_l     = 1.9123;   % Gali Gertler Lopez assume 0.2, but calculation
                            % with formulas results in 1.9123

    rho_g_b     = 0.75;     % all rho values taken from assignment paper 
    rho_i_b     = 0.75;     % -"- 
    rho_tau     = 0.75;     % -"- 
    rho_z       = 0.75;     % -"-  
   
 
    c_bar       = 0.6050135;% calculated   
    g_b_bar     = 0.2;      % taken from assignment paper               
    i_bar       = 0.1749865;% calculated                    
    i_b_bar     = 0.02;     % taken from assignment paper                         
    k_b_bar     = 0.8;      % calculated             
    n_bar       = (1/3);    % taken from assignment paper           
    r_bar       = 0.0476227;% calculated
    tau_bar     = 0.22;     % calculated    
    tr_bar      = 0;        % taken from assignment paper
    w_bar       = 2;        % taken from assignment paper 
    y_bar       = 1;        % taken from assignment paper 
    z_bar       = 1.099609; % calculated    

%----------------------------------------------------------------
% Model specifics
% ===============
%----------------------------------------------------------------

model;

    (1-tau)*w = theta_l*(c/(1-n)); 
   
    lambda = beta*(lambda(+1)*((1-delta)+(1-tau(+1))*r(+1))); 

    lambda = 1/c;

    k = (1-delta)*k(-1)+i; %law of motion for the capital stock   % (4)
  
    k_b = (1-delta)*k_b(-1)+i_b;                                  % (5)

    y = z*k_b(-1)^(eta)*k(-1)^(alpha)*n^(1-alpha);                % (6)

    w*n = (1-alpha)*y;     % (7)                         

    r*k(-1) = alpha*y;     % (8)

    log(z/z_bar) = rho_z*log(z(-1)/z_bar)+epsilon_z;    %(9)

    g_b+i_b+tr = tau*(w*n+r*k(-1));                %(10)

    g_b-g_b_bar = (rho_g_b*(g_b(-1)-g_b_bar))+epsilon_g_b;    %(11)

    i_b-i_b_bar = rho_i_b*(i_b(-1)-i_b_bar)+epsilon_i_b;      %(12)

    log(tau/tau_bar)=rho_tau*log(tau(-1)/tau_bar)+epsilon_tau;  %(13)

    y=c+i+g_b+i_b;

    dy=100*((y-y_bar)/y_bar);

    dc=100*(c-c_bar)/c_bar;

    di=100*(i-i_bar)/i_bar;

    dn=100*(n-n_bar);

    dw=100*(w-w_bar)/w_bar;

    dr=100*(r-r_bar);

    dtr=100*(tr-tr_bar);

    dg_b=100*((g_b/y)-(g_b_bar/y_bar));

    di_b=100*((i_b/y)-(i_b_bar/y_bar));

end;

%----------------------------------------------------------------
% Steady State values
% ===================
%----------------------------------------------------------------
initval;
   c     = 0.6050135;   % calculated  
   g_b   = 0.2;         % taken from assignment paper
   i     = 0.1749865;    % calculated
   i_b   = 0.02;        % taken from assignment paper
   k     = 6.99946;     % calculated
   k_b   = 0.8;         % calculated        
   lambda= 1.652856;    % calculated
   n     = (1/3);       % taken from assignment paper
   r     = 0.0476227;   % calculated
   tau   = 0.22;        % calculated
   tr    = 0;           % taken from assignment paper
   w     = 2;           % taken from assignment paper
   y     = 1;           % taken from assignment paper
   z     = 1.099609;    % calculated
end;

%----------------------------------------------------------------
% Scenario computations
% =====================
%
% Scenario 1: Temporary stochastic shock to government consumption
% Scenario 2: Temporary stochastic shock to public investment
% Scenario 3: Permanent increase in the tax rate by 1 percentage point
%
%----------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% PLEASE CHOOSE SCENARIO %%%%%%

@# define scenario = 3     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%===========
%Scenario 1: Temporary stochastic shock to government consumption
%===========
@#if scenario == 1
    steady; 
    check;
    resid;
    shocks;
        var epsilon_g_b = sigma^2;
    end;
    stoch_simul(order=1,irf=100, periods=200);
@#endif

%===========
%Scenario 2: Temporary stochastic shock to public investment
%===========
@#if scenario == 2
    steady; 
    check;
    resid;
    shocks;
        var epsilon_i_b = sigma^2;
    end;
    stoch_simul(order=1,irf=200, periods=200);
@#endif

%===========
%Scenario 3: Permanent increase in the tax rate by 1 percentage point
%===========
@# if scenario == 3
    steady;
    check;
    resid;
    
    initval; %deterministic model !
    epsilon_tau = 0;
    end;
    steady(solve_algo=1);

    endval;
    epsilon_tau = log(0.23/0.22)-0.75*log(0.23/0.22);
    end;
    steady(solve_algo=1);

    simul(periods=100);

    subplot(331),plot(y),title('Y'), axis tight
    subplot(332),plot(dy),title('dY'), axis tight

    subplot(333),plot(c),title('C'), axis tight
    subplot(334),plot(dc),title('dC'), axis tight

    subplot(335),plot(i),title('I'), axis tight
    subplot(336),plot(di),title('dI'), axis tight

    subplot(337),plot(tau),title('Tau'), axis tight
    subplot(338),plot(w),title('Wage'), axis tight
    subplot(339),plot(n),title('Labor supply'), axis tight

    subplot(331),plot(dg_b),title('dG_b'), axis tight
    subplot(332),plot(di_b),title('dI_b'), axis tight
   
@#endif

