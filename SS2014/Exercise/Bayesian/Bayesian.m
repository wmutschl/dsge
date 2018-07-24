%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Bayesian';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Bayesian.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'l';
M_.endo_names_tex = 'l';
M_.endo_names_long = 'l';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.param_names = 'theta';
M_.param_names_tex = 'theta';
M_.param_names_long = 'theta';
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'A_ss');
M_.param_names_tex = char(M_.param_names_tex, 'A\_ss');
M_.param_names_long = char(M_.param_names_long, 'A_ss');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 7;
M_.param_nbr = 9;
M_.orig_endo_nbr = 7;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'y';
options_.varobs_id = [ 4  ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Bayesian_static');
erase_compiled_function('Bayesian_dynamic');
M_.lead_lag_incidence = [
 0 3 10;
 0 4 11;
 1 5 0;
 0 6 0;
 0 7 12;
 2 8 0;
 0 9 0;]';
M_.nstatic = 2;
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
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 26;
M_.NNZDerivatives(2) = 39;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.3500;
theta = M_.params( 1 );
M_.params( 2 ) = 2.0000;
tau = M_.params( 2 );
M_.params( 3 ) = 0.4500;
alpha = M_.params( 3 );
M_.params( 4 ) = (-0.4000);
psi = M_.params( 4 );
M_.params( 5 ) = 0.9900;
beta = M_.params( 5 );
M_.params( 6 ) = 0.0200;
delta = M_.params( 6 );
M_.params( 7 ) = 0.8000;
rho = M_.params( 7 );
M_.params( 8 ) = 1.0000;
A_ss = M_.params( 8 );
M_.params( 9 ) = 1.0000;
sigma = M_.params( 9 );
share_of_capital = alpha^(1/(1-psi))*A_ss^psi/(1/beta-1+delta)^(psi/(1-psi));
disp(['The share of capital is: ' num2str(share_of_capital)]);
disp(' ');	
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(9))^2;
M_.sigma_e_is_diagonal = 1;
global estim_params_
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 1, 0.4, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 3, 0.5, 1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 2, 2, 2, NaN, NaN, NaN ];
options_.first_obs = 8000;
options_.load_mh_file = 1;
options_.mh_jscale = 1.5;
options_.mh_nblck = 3;
options_.mh_replic = 1000;
options_.mode_compute = 0;
options_.datafile = 'artificial_sample';
options_.mode_file = 'Bayesian_mode';
options_.nobs = 200;
options_.order = 1;
var_list_=[];
dynare_estimation(var_list_);
save('Bayesian_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Bayesian_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Bayesian_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Bayesian_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Bayesian_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
