%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'law';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('law.log');
M_.exo_names = 'eps_e';
M_.exo_names_tex = 'eps\_e';
M_.exo_names_long = 'eps_e';
M_.endo_names = 'Inflation';
M_.endo_names_tex = 'Inflation';
M_.endo_names_long = 'Inflation';
M_.endo_names = char(M_.endo_names, 'OutputGap');
M_.endo_names_tex = char(M_.endo_names_tex, 'OutputGap');
M_.endo_names_long = char(M_.endo_names_long, 'OutputGap');
M_.endo_names = char(M_.endo_names, 'Zins');
M_.endo_names_tex = char(M_.endo_names_tex, 'Zins');
M_.endo_names_long = char(M_.endo_names_long, 'Zins');
M_.endo_names = char(M_.endo_names, 'Natuerlicher_Zins');
M_.endo_names_tex = char(M_.endo_names_tex, 'Natuerlicher\_Zins');
M_.endo_names_long = char(M_.endo_names_long, 'Natuerlicher_Zins');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.param_names = 'sig_e';
M_.param_names_tex = 'sig\_e';
M_.param_names_long = 'sig_e';
M_.param_names = char(M_.param_names, 'xi_p');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_p');
M_.param_names_long = char(M_.param_names_long, 'xi_p');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'kappa_p');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_p');
M_.param_names_long = char(M_.param_names_long, 'kappa_p');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'alpha_psi');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_psi');
M_.param_names_long = char(M_.param_names_long, 'alpha_psi');
M_.param_names = char(M_.param_names, 'r_Inflation');
M_.param_names_tex = char(M_.param_names_tex, 'r\_Inflation');
M_.param_names_long = char(M_.param_names_long, 'r_Inflation');
M_.param_names = char(M_.param_names, 'r_OutputGap');
M_.param_names_tex = char(M_.param_names_tex, 'r\_OutputGap');
M_.param_names_long = char(M_.param_names_long, 'r_OutputGap');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 5;
M_.param_nbr = 11;
M_.orig_endo_nbr = 5;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('law_static');
erase_compiled_function('law_dynamic');
M_.lead_lag_incidence = [
 0 2 7;
 0 3 8;
 0 4 0;
 0 5 0;
 1 6 0;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 1;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(5, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(11, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 17;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
close all;
M_.params( 4 ) = 0.5;
gamma = M_.params( 4 );
M_.params( 7 ) = 0.1;
phi = M_.params( 7 );
M_.params( 6 ) = 0.99;
beta = M_.params( 6 );
M_.params( 3 ) = 0.9;
rho_z = M_.params( 3 );
M_.params( 2 ) = 0.75;
xi_p = M_.params( 2 );
M_.params( 1 ) = 0.02;
sig_e = M_.params( 1 );
M_.params( 11 ) = 0.5;
psi = M_.params( 11 );
M_.params( 9 ) = 1.5;
r_Inflation = M_.params( 9 );
M_.params( 10 ) = 0.1;
r_OutputGap = M_.params( 10 );
M_.params( 8 ) = M_.params(11)/(M_.params(11)+(1-M_.params(11))*M_.params(6));
alpha_psi = M_.params( 8 );
M_.params( 5 ) = (1-M_.params(6)*M_.params(2))*(1-M_.params(2))/M_.params(2);
kappa_p = M_.params( 5 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1000)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.order = 1;
var_list_=[];
info = stoch_simul(var_list_);
save('law_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('law_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('law_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('law_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('law_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
