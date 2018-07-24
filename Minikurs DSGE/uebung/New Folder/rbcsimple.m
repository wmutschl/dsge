%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'rbcsimple';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbcsimple.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'a';
M_.endo_names_tex = 'a';
M_.endo_names_long = 'a';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.param_names = 'betta';
M_.param_names_tex = 'betta';
M_.param_names_long = 'betta';
M_.param_names = char(M_.param_names, 'alph');
M_.param_names_tex = char(M_.param_names_tex, 'alph');
M_.param_names_long = char(M_.param_names_long, 'alph');
M_.param_names = char(M_.param_names, 'delt');
M_.param_names_tex = char(M_.param_names_tex, 'delt');
M_.param_names_long = char(M_.param_names_long, 'delt');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 4;
M_.param_nbr = 4;
M_.orig_endo_nbr = 4;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'c';
options_.varobs_id = [ 3  ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('rbcsimple_static');
erase_compiled_function('rbcsimple_dynamic');
M_.lead_lag_incidence = [
 1 4 8;
 2 5 0;
 0 6 9;
 3 7 0;]';
M_.nstatic = 0;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(4, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(4, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 13;
M_.NNZDerivatives(2) = 14;
M_.NNZDerivatives(3) = -1;
M_.params( 2 ) = 0.4500;
alph = M_.params( 2 );
M_.params( 1 ) = 0.9900;
betta = M_.params( 1 );
M_.params( 3 ) = 0.0200;
delt = M_.params( 3 );
M_.params( 4 ) = 0.8000;
rho = M_.params( 4 );
save('rbcsimple_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbcsimple_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbcsimple_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbcsimple_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbcsimple_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
