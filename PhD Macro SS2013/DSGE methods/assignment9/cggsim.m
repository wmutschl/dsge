%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
clear global
tic;
global M_ oo_ options_ ys0_ ex0_
options_ = [];
M_.fname = 'cggsim';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'cggsim.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'eps_u';
M_.exo_names_tex = 'eps\_u';
M_.exo_names = char(M_.exo_names, 'eps_a');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_a');
M_.exo_names = char(M_.exo_names, 'eps_tau');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_tau');
M_.endo_names = 'da';
M_.endo_names_tex = 'da';
M_.endo_names = char(M_.endo_names, 'pie');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names = char(M_.endo_names, 'rstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'rstar');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.param_names = 'phi';
M_.param_names_tex = 'phi';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names = char(M_.param_names, 'phi_x');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_x');
M_.param_names = char(M_.param_names, 'phi_pie');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pie');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 7;
M_.param_nbr = 9;
M_.orig_endo_nbr = 7;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.H = 0;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('cggsim_dynamic');
M_.lead_lag_incidence = [
 1 5 12;
 0 6 13;
 2 7 0;
 0 8 0;
 3 9 0;
 4 10 0;
 0 11 14;]';
M_.equations_tags = {
};
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 25;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 2 ) = 0.97;
beta = M_.params( 2 );
M_.params( 4 ) = .0;
phi_x = M_.params( 4 );
M_.params( 5 ) = 1.5;
phi_pie = M_.params( 5 );
M_.params( 6 ) = 0.0;
alpha = M_.params( 6 );
M_.params( 7 ) = 0.2;
rho = M_.params( 7 );
M_.params( 8 ) = 0.5;
lambda = M_.params( 8 );
M_.params( 9 ) = 0.2;
delta = M_.params( 9 );
M_.params( 1 ) = 1;
phi = M_.params( 1 );
theta   = 0.75;
M_.params( 3 ) = (1-theta)*(1-theta*M_.params(2))*(1+M_.params(1))/theta;
kappa = M_.params( 3 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.0)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.sigma_e_is_diagonal = 1;
options_.irf = 7;
options_.nograph = 1;
var_list_=[];
info = stoch_simul(var_list_);
save('cggsim_results.mat', 'oo_', 'M_', 'options_');
diary off

disp(['Total computing time : ' dynsec2hms(toc) ]);
