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
M_.fname = 'Marie';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'Marie.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.endo_names = 'Y';
M_.endo_names_tex = 'Y';
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names = char(M_.endo_names, 'H');
M_.endo_names_tex = char(M_.endo_names_tex, 'H');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 6;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'Y';
options_.varobs_id = [ 1  ];
M_.Sigma_e = zeros(1, 1);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Marie_static');
erase_compiled_function('Marie_dynamic');
M_.lead_lag_incidence = [
 0 4 10;
 0 5 11;
 1 6 0;
 0 7 0;
 2 8 12;
 3 9 0;]';
M_.nstatic = 1;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 1;
M_.equations_tags = {
};
M_.state_var = [3 5 6 ];
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
M_.NNZDerivatives(1) = 20;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 2 ) = 0.2292;
theta = M_.params( 2 );
M_.params( 3 ) = 1.0051;
eta = M_.params( 3 );
M_.params( 4 ) = 0.025;
delta = M_.params( 4 );
M_.params( 5 ) = 0.9987;
rho = M_.params( 5 );
M_.params( 6 ) = 0.0056;
sigma = M_.params( 6 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.sigma_e_is_diagonal = 1;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 6 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
check(M_,options_,oo_);
options_.irf = 20;
options_.order = 1;
options_.periods = 10000;
var_list_=[];
info = stoch_simul(var_list_);
save('artificial_sample.mat','Y');
global estim_params_
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 1, 0.99, 0.01, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 1, 0.3, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 3, 1.1, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, 0.03, 0.01, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 1, 0.95, 0.05, NaN, NaN, NaN ];
options_.first_obs = 8001;
options_.mode_check = 1;
options_.mode_compute = 6;
options_.datafile = 'artificial_sample';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
save('Marie_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
