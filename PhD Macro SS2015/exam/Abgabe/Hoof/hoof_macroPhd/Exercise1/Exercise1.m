%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Exercise1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Exercise1.log');
M_.exo_names = 'e_t';
M_.exo_names_tex = 'e\_t';
M_.exo_names_long = 'e_t';
M_.exo_names = char(M_.exo_names, 'e_z');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_z');
M_.exo_names_long = char(M_.exo_names_long, 'e_z');
M_.exo_names = char(M_.exo_names, 'e_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_g');
M_.exo_names_long = char(M_.exo_names_long, 'e_g');
M_.exo_names = char(M_.exo_names, 'e_i');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_i');
M_.exo_names_long = char(M_.exo_names_long, 'e_i');
M_.endo_names = 'tau';
M_.endo_names_tex = 'tau';
M_.endo_names_long = 'tau';
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'C');
M_.endo_names = char(M_.endo_names, 'G_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'G\_b');
M_.endo_names_long = char(M_.endo_names_long, 'G_b');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'I_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'I\_b');
M_.endo_names_long = char(M_.endo_names_long, 'I_b');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'K_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_b');
M_.endo_names_long = char(M_.endo_names_long, 'K_b');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'TR');
M_.endo_names_tex = char(M_.endo_names_tex, 'TR');
M_.endo_names_long = char(M_.endo_names_long, 'TR');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'rho_t');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_t');
M_.param_names_long = char(M_.param_names_long, 'rho_t');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_i');
M_.param_names = char(M_.param_names, 'tau_bar');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_bar');
M_.param_names_long = char(M_.param_names_long, 'tau_bar');
M_.param_names = char(M_.param_names, 'z_bar');
M_.param_names_tex = char(M_.param_names_tex, 'z\_bar');
M_.param_names_long = char(M_.param_names_long, 'z_bar');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 13;
M_.param_nbr = 11;
M_.orig_endo_nbr = 13;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Exercise1_static');
erase_compiled_function('Exercise1_dynamic');
M_.lead_lag_incidence = [
 1 7 20;
 0 8 21;
 0 9 0;
 2 10 0;
 0 11 22;
 3 12 0;
 0 13 0;
 4 14 0;
 5 15 0;
 6 16 0;
 0 17 0;
 0 18 0;
 0 19 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 5;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 6;
M_.ndynamic   = 8;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(11, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 50;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.3333333333333333;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 3 ) = 0.02;
delta = M_.params( 3 );
M_.params( 4 ) = 0.05;
eta = M_.params( 4 );
M_.params( 5 ) = 1.712643678160922;
theta = M_.params( 5 );
M_.params( 7 ) = 0.75;
rho_z = M_.params( 7 );
M_.params( 6 ) = 0.75;
rho_t = M_.params( 6 );
M_.params( 8 ) = 0.75;
rho_g = M_.params( 8 );
M_.params( 9 ) = 0.75;
rho_i = M_.params( 9 );
M_.params( 11 ) = 1.013794841297641;
z_bar = M_.params( 11 );
M_.params( 10 ) = 0.22;
tau_bar = M_.params( 10 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = M_.params(10);
oo_.steady_state( 2 ) = 0.03859103859103841;
oo_.steady_state( 3 ) = 2;
oo_.steady_state( 4 ) = M_.params(11);
oo_.steady_state( 5 ) = 0.6072483221476501;
oo_.steady_state( 6 ) = 0.2;
oo_.steady_state( 7 ) = 0.1727516778523499;
oo_.steady_state( 8 ) = 0.02;
oo_.steady_state( 9 ) = 8.637583892617492;
oo_.steady_state( 10 ) = 1;
oo_.steady_state( 11 ) = 0.3333333333333333;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 13 ) = 1;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.exo_steady_state( 1 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.exo_steady_state( 1 ) = 0.04445176257083337-0.04445176257083337*M_.params(6);
steady;
options_.periods = 400;
simul();
do_own_plots_deterministic; 
save('Exercise1_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Exercise1_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Exercise1_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Exercise1_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Exercise1_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
