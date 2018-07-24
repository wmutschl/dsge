close all;

%% ----------------------------------------------------------------
% 1. Declare variables and parameters. Dont'forget semicolon!
%----------------------------------------------------------------
    var Inflation OutputGap Zins Natuerlicher_Zins z; % DECLARATION OF THE ENDOGENOUS VARIABLES    
    varexo eps_e;                % DECLARATION OF THE STRUCTURAL INNOVATIONS
    %%varobs Inflation;                       % DECLARATION OF THE OBSERVABLE VARIABLES
    parameters sig_e xi_p rho_z gamma kappa_p beta phi alpha_psi r_Inflation r_OutputGap psi; %%mi_z% DECLARATION OF THE PARAMETERS AND CALIBRATION

%% ----------------------------------------------------------------
% 2. Set values for parameters
%----------------------------------------------------------------
    %gamma = 0; %% Produktionstechnologie. Gamma=1 heißt keine zwischengüter
    gamma=0.5;
    %gamma=0;
    phi = 0.1; %%Arbeitselastizität. Falls klein sind viele Indifferent zwischen Arbeit und nicht-Arbeit, Änderung in W/P hat großen Einfluss auf Arbeitsangebot
    beta = 0.99;
    rho_z=0.9;
    xi_p = 0.75;
    sig_e=0.02;
    psi = 0.5; %%psi=0 kein zusätzliches Kapital benötigt
    r_Inflation = 1.5;
    r_OutputGap = 0.1; %%S. 304: It is convenient to suppose that monetary policy is characterized by r_OutputGap=0
    alpha_psi = psi/((1-psi)*beta+psi);
    kappa_p = (1-beta*xi_p)*(1-xi_p)/(xi_p);
    %%mi_z = z(+1)/z;

   %% ----------------------------------------------------------------
% 3. Model equations. Don't forget:  model; ...  end;
%----------------------------------------------------------------
% just use model; or model(block,bytecode) which is a little bit faster, works however only with order=1;
model;
    % Calvo Pricing Equation
    Inflation = beta*Inflation(+1) + kappa_p*(gamma*(1+phi)*OutputGap+alpha_psi*Zins);
    % Intertemporal Equation
    OutputGap = -(Zins - Inflation(+1) - Natuerlicher_Zins) + OutputGap(+1);
    % Monetary Policy Rule
    Zins = r_Inflation*Inflation(+1)+r_OutputGap*OutputGap; % Baseline Taylor rule
    % Natural Rate
    Natuerlicher_Zins = (1/gamma)*(rho_z-1)*log(z);
    %Technologie
    log(z)=rho_z*log(z(-1))+sig_e*eps_e;    
end;

%% ----------------------------------------------------------------
% 4. Specify shocks. Don't forget: shocks; ... end;
%----------------------------------------------------------------
 shocks;
     var eps_e; stderr 1000;  
 end;
% 
%% ----------------------------------------------------------------
% 5. Specify steady_state_model or initval. Don't forget ... end;
%----------------------------------------------------------------
% If you have analytical solution for the steady state use
% steady_state_model, else if you want to numerically find the SS, use
% initval and set initial values
%initval;
%OutputGap=0;
%Zins=0;
%Inflation=0; 
%z=1;
%end;
 steady_state_model;
 Inflation=0; OutputGap=0; r=0; z=1; 
 end;
%% ----------------------------------------------------------------
% 6. Computations, simulation and/or estimation
%----------------------------------------------------------------
    % Calculate steady-state, check Blanchard-Khan-conditions
	steady; check;
	stoch_simul(order=1);  %taylor ordnung 2 /3 ord
%stoch_simul(order=1);

  

