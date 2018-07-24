%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'rbcown';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbcown.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'k';
M_.endo_names_tex = 'k';
M_.endo_names_long = 'k';
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'uc');
M_.endo_names_tex = char(M_.endo_names_tex, 'uc');
M_.endo_names_long = char(M_.endo_names_long, 'uc');
M_.endo_names = char(M_.endo_names, 'ul');
M_.endo_names_tex = char(M_.endo_names_tex, 'ul');
M_.endo_names_long = char(M_.endo_names_long, 'ul');
M_.endo_names = char(M_.endo_names, 'fk');
M_.endo_names_tex = char(M_.endo_names_tex, 'fk');
M_.endo_names_long = char(M_.endo_names_long, 'fk');
M_.endo_names = char(M_.endo_names, 'fl');
M_.endo_names_tex = char(M_.endo_names_tex, 'fl');
M_.endo_names_long = char(M_.endo_names_long, 'fl');
M_.endo_names = char(M_.endo_names, 'f');
M_.endo_names_tex = char(M_.endo_names_tex, 'f');
M_.endo_names_long = char(M_.endo_names_long, 'f');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'Abar');
M_.param_names_tex = char(M_.param_names_tex, 'Abar');
M_.param_names_long = char(M_.param_names_long, 'Abar');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 12;
M_.param_nbr = 8;
M_.orig_endo_nbr = 12;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'y';
options_.varobs_id = [ 2  ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('rbcown_static');
erase_compiled_function('rbcown_dynamic');
M_.lead_lag_incidence = [
 1 3 0;
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 15;
 2 8 0;
 0 9 0;
 0 10 16;
 0 11 0;
 0 12 17;
 0 13 0;
 0 14 0;]';
M_.nstatic = 7;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 2;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 39;
M_.NNZDerivatives(2) = 36;
M_.NNZDerivatives(3) = -1;
set_dynare_seed(123); 
M_.params( 2 ) = 0.3570;
theta = M_.params( 2 );
M_.params( 3 ) = 2.0000;
tau = M_.params( 3 );
M_.params( 4 ) = 0.4500;
alpha = M_.params( 4 );
M_.params( 5 ) = (-0.1000);
psi = M_.params( 5 );
M_.params( 1 ) = 0.9900;
beta = M_.params( 1 );
M_.params( 6 ) = 0.0200;
delta = M_.params( 6 );
M_.params( 7 ) = 0.8000;
rho = M_.params( 7 );
M_.params( 8 ) = 1.0000;
Abar = M_.params( 8 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 20;
oo_.steady_state( 2 ) = 1;
oo_.steady_state( 3 ) = 0.5;
oo_.steady_state( 4 ) = 1.5;
oo_.steady_state( 5 ) = 1;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0.5;
oo_.steady_state( 8 ) = 0.5;
oo_.steady_state( 9 ) = (-1);
oo_.steady_state( 10 ) = 0.1;
oo_.steady_state( 11 ) = 3;
oo_.steady_state( 12 ) = 2;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
global estim_params_
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, .45, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 1, .35, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 2, mode_and_variance_to_mean(2.0,0.25,1,1), .5, 1, NaN, NaN ];
options_.first_obs = 401;
options_.mh_replic = 0;
options_.mode_check.status = 1;
options_.mode_compute = 7;
options_.datafile = 'simdat';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
options_.solve_algo = 3;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.first_obs = 401;
options_.mh_jscale = 1.7;
options_.mh_nblck = 3;
options_.mh_replic = 5000;
options_.mode_compute = 0;
options_.datafile = 'simdat';
options_.mode_file = 'rbcown_mode';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
options_.first_obs = 401;
options_.load_mh_file = 1;
options_.mh_jscale = 1.7;
options_.mh_nblck = 3;
options_.mh_replic = 1000;
options_.mode_compute = 0;
options_.datafile = 'simdat';
options_.mode_file = 'rbcown_mode';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
options_.solve_algo = 3;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
save('rbcown_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbcown_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbcown_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbcown_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbcown_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
