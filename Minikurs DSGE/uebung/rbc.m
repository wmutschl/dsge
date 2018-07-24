%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'rbc';
M_.dynare_version = '4.6-unstable';
oo_.dynare_version = '4.6-unstable';
options_.dynare_version = '4.6-unstable';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbc.log');
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
M_.endo_partitions = struct();
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
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 12;
M_.param_nbr = 8;
M_.orig_endo_nbr = 12;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'y'};
options_.varobs_id = [ 2  ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('rbc_static');
erase_compiled_function('rbc_dynamic');
M_.orig_eq_nbr = 12;
M_.eq_nbr = 12;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.max_endo_lag_orig = 1;
M_.max_endo_lead_orig = 1;
M_.max_exo_lag_orig = 0;
M_.max_exo_lead_orig = 0;
M_.max_exo_det_lag_orig = 0;
M_.max_exo_det_lead_orig = 0;
M_.max_lag_orig = 1;
M_.max_lead_orig = 1;
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
M_.state_var = [1 6 ];
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
M_.NNZDerivatives = [39; 36; -1];
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
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, .45, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 1, .35, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 2, mode_and_variance_to_mean(2.0,0.25,1,1), .5, 1, NaN, NaN ];
options_.mh_replic = 0;
options_.mode_check.status = 1;
options_.mode_compute = 7;
options_.datafile = 'simdat';
options_.first_obs = 401;
options_.nobs = 200;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
options_.mh_jscale = 1.7;
options_.mh_nblck = 3;
options_.mh_replic = 5000;
options_.mode_compute = 0;
options_.datafile = 'simdat';
options_.mode_file = 'rbc_mode';
options_.first_obs = 401;
options_.nobs = 200;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
options_.load_mh_file = 1;
options_.mh_jscale = 1.7;
options_.mh_nblck = 3;
options_.mh_replic = 1000;
options_.mode_compute = 0;
options_.datafile = 'simdat';
options_.mode_file = 'rbc_mode';
options_.first_obs = 401;
options_.nobs = 200;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
save('rbc_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbc_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbc_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbc_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbc_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbc_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbc_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
