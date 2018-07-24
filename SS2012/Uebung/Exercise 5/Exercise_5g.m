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
M_.fname = 'Exercise_5g';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'Exercise_5g.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.endo_names = 'l';
M_.endo_names_tex = 'l';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.param_names = 'theta';
M_.param_names_tex = 'theta';
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names = char(M_.param_names, 'A_ss');
M_.param_names_tex = char(M_.param_names_tex, 'A\_ss');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 8;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'y';
options_.varobs_id = [ 4  ];
M_.Sigma_e = zeros(1, 1);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Exercise_5g_static');
erase_compiled_function('Exercise_5g_dynamic');
M_.lead_lag_incidence = [
 0 3 9;
 0 4 10;
 1 5 0;
 0 6 0;
 0 7 0;
 2 8 0;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.equations_tags = {
};
M_.state_var = [3 6 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 24;
M_.NNZDerivatives(2) = 45;
M_.NNZDerivatives(3) = -1;
M_.params( 4 ) = 0.9900;
beta = M_.params( 4 );
M_.params( 5 ) = 0.0200;
delta = M_.params( 5 );
M_.params( 6 ) = 0.8000;
rho = M_.params( 6 );
M_.params( 7 ) = 1.0000;
A_ss = M_.params( 7 );
M_.params( 8 ) = 1.0000;
sigma = M_.params( 8 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.sigma_e_is_diagonal = 1;
global estim_params_
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 1, .45, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 1, .35, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 2, mode_and_variance_to_mean(2.0,0.25,1,1), .5, 1, NaN, NaN ];
options_.first_obs = 8001;
options_.mh_replic = 0;
options_.mode_check = 1;
options_.datafile = 'artificial_sample';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
options_.first_obs = 8001;
options_.mh_jscale = 1.6;
options_.mh_nblck = 3;
options_.mh_replic = 5000;
options_.mode_compute = 0;
options_.datafile = 'artificial_sample';
options_.mode_file = 'Exercise_5g_mode';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
options_.first_obs = 8001;
options_.load_mh_file = 1;
options_.mh_jscale = 1.6;
options_.mh_nblck = 3;
options_.mh_replic = 1000;
options_.mode_compute = 0;
options_.datafile = 'artificial_sample';
options_.mode_file = 'Exercise_5g_mode';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
steady;
check(M_,options_,oo_);
save('Exercise_5g_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
