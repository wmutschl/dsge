%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
clear global
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Exercise_3c';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'Exercise_3c.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.endo_names = 'C';
M_.endo_names_tex = 'C';
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names = char(M_.endo_names, 'L');
M_.endo_names_tex = char(M_.endo_names_tex, 'L');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.param_names = 'rho';
M_.param_names_tex = 'rho';
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names = char(M_.param_names, 'g');
M_.param_names_tex = char(M_.param_names_tex, 'g');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 6;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Exercise_3c_static');
erase_compiled_function('Exercise_3c_dynamic');
M_.lead_lag_incidence = [
 0 3 9;
 1 4 0;
 0 5 0;
 0 6 0;
 0 7 10;
 2 8 0;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.equations_tags = {
};
M_.state_var = [2 6 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 22;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 4 ) = 0.33;
alpha = M_.params( 4 );
M_.params( 2 ) = 0.1;
delta = M_.params( 2 );
M_.params( 1 ) = 0.03;
rho = M_.params( 1 );
M_.params( 5 ) = 0.97;
lambda = M_.params( 5 );
M_.params( 3 ) = 0;
gamma = M_.params( 3 );
M_.params( 6 ) = 0.015;
g = M_.params( 6 );
steady;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
M_.sigma_e_is_diagonal = 1;
check(M_,options_,oo_);
options_.irf = 60;
options_.order = 1;
var_list_=[];
info = stoch_simul(var_list_);
save('Exercise_3c_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
