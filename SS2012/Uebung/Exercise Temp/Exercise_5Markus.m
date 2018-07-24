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
M_.fname = 'Exercise_5Markus';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'Exercise_5Markus.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e_t';
M_.exo_names_tex = 'e\_t';
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names = char(M_.endo_names, 'f');
M_.endo_names_tex = char(M_.endo_names_tex, 'f');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names = char(M_.endo_names, 'ul');
M_.endo_names_tex = char(M_.endo_names_tex, 'ul');
M_.endo_names = char(M_.endo_names, 'uc');
M_.endo_names_tex = char(M_.endo_names_tex, 'uc');
M_.endo_names = char(M_.endo_names, 'fk');
M_.endo_names_tex = char(M_.endo_names_tex, 'fk');
M_.endo_names = char(M_.endo_names, 'fl');
M_.endo_names_tex = char(M_.endo_names_tex, 'fl');
M_.param_names = 'delta';
M_.param_names_tex = 'delta';
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names = char(M_.param_names, 'A_ss');
M_.param_names_tex = char(M_.param_names_tex, 'A\_ss');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 13;
M_.param_nbr = 8;
M_.orig_endo_nbr = 13;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Exercise_5Markus_static');
erase_compiled_function('Exercise_5Markus_dynamic');
M_.lead_lag_incidence = [
 0 3 0;
 0 4 0;
 0 5 0;
 1 6 0;
 0 7 16;
 2 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 17;
 0 14 18;
 0 15 0;]';
M_.nstatic = 8;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 0;
M_.equations_tags = {
};
M_.state_var = [4 6 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 40;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.5;
delta = M_.params( 1 );
M_.params( 2 ) = 0.5;
alpha = M_.params( 2 );
M_.params( 3 ) = 0.5;
psi = M_.params( 3 );
M_.params( 4 ) = 0.5;
tau = M_.params( 4 );
M_.params( 5 ) = 0.5;
beta = M_.params( 5 );
M_.params( 6 ) = 0.5;
theta = M_.params( 6 );
M_.params( 7 ) = 0.5;
rho = M_.params( 7 );
M_.params( 8 ) = 1;
A_ss = M_.params( 8 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.sigma_e_is_diagonal = 1;
steady;
check(M_,options_,oo_);
options_.irf = 0;
options_.order = 1;
options_.periods = 10000;
var_list_=[];
info = stoch_simul(var_list_);
save('artificial_sample.mat','y','c','l');
save('Exercise_5Markus_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
