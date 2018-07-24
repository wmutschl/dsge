%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Baxter_King';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Baxter_King.log');
M_.exo_names = 'eps_z';
M_.exo_names_tex = 'eps\_z';
M_.exo_names_long = 'eps_z';
M_.exo_names = char(M_.exo_names, 'eps_GB');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_GB');
M_.exo_names_long = char(M_.exo_names_long, 'eps_GB');
M_.exo_names = char(M_.exo_names, 'eps_IB');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_IB');
M_.exo_names_long = char(M_.exo_names_long, 'eps_IB');
M_.exo_names = char(M_.exo_names, 'eps_tau');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_tau');
M_.exo_names_long = char(M_.exo_names_long, 'eps_tau');
M_.endo_names = 'tau';
M_.endo_names_tex = 'tau';
M_.endo_names_long = 'tau';
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'omega');
M_.endo_names_tex = char(M_.endo_names_tex, 'omega');
M_.endo_names_long = char(M_.endo_names_long, 'omega');
M_.endo_names = char(M_.endo_names, 'KB');
M_.endo_names_tex = char(M_.endo_names_tex, 'KB');
M_.endo_names_long = char(M_.endo_names_long, 'KB');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'C');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'TR');
M_.endo_names_tex = char(M_.endo_names_tex, 'TR');
M_.endo_names_long = char(M_.endo_names_long, 'TR');
M_.endo_names = char(M_.endo_names, 'GB');
M_.endo_names_tex = char(M_.endo_names_tex, 'GB');
M_.endo_names_long = char(M_.endo_names_long, 'GB');
M_.endo_names = char(M_.endo_names, 'IB');
M_.endo_names_tex = char(M_.endo_names_tex, 'IB');
M_.endo_names_long = char(M_.endo_names_long, 'IB');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'lambda_bar');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_bar');
M_.param_names_long = char(M_.param_names_long, 'lambda_bar');
M_.param_names = char(M_.param_names, 'K_bar');
M_.param_names_tex = char(M_.param_names_tex, 'K\_bar');
M_.param_names_long = char(M_.param_names_long, 'K_bar');
M_.param_names = char(M_.param_names, 'KB_bar');
M_.param_names_tex = char(M_.param_names_tex, 'KB\_bar');
M_.param_names_long = char(M_.param_names_long, 'KB_bar');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rho_GB');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_GB');
M_.param_names_long = char(M_.param_names_long, 'rho_GB');
M_.param_names = char(M_.param_names, 'rho_IB');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_IB');
M_.param_names_long = char(M_.param_names_long, 'rho_IB');
M_.param_names = char(M_.param_names, 'rho_tau');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau');
M_.param_names_long = char(M_.param_names_long, 'rho_tau');
M_.param_names = char(M_.param_names, 'sig_z');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_z');
M_.param_names_long = char(M_.param_names_long, 'sig_z');
M_.param_names = char(M_.param_names, 'sig_GB');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_GB');
M_.param_names_long = char(M_.param_names_long, 'sig_GB');
M_.param_names = char(M_.param_names, 'sig_IB');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_IB');
M_.param_names_long = char(M_.param_names_long, 'sig_IB');
M_.param_names = char(M_.param_names, 'sig_tau');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_tau');
M_.param_names_long = char(M_.param_names_long, 'sig_tau');
M_.param_names = char(M_.param_names, 'z_bar');
M_.param_names_tex = char(M_.param_names_tex, 'z\_bar');
M_.param_names_long = char(M_.param_names_long, 'z_bar');
M_.param_names = char(M_.param_names, 'GB_bar');
M_.param_names_tex = char(M_.param_names_tex, 'GB\_bar');
M_.param_names_long = char(M_.param_names_long, 'GB_bar');
M_.param_names = char(M_.param_names, 'IB_bar');
M_.param_names_tex = char(M_.param_names_tex, 'IB\_bar');
M_.param_names_long = char(M_.param_names_long, 'IB_bar');
M_.param_names = char(M_.param_names, 'tau_bar');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_bar');
M_.param_names_long = char(M_.param_names_long, 'tau_bar');
M_.param_names = char(M_.param_names, 'Y_bar');
M_.param_names_tex = char(M_.param_names_tex, 'Y\_bar');
M_.param_names_long = char(M_.param_names_long, 'Y_bar');
M_.param_names = char(M_.param_names, 'N_bar');
M_.param_names_tex = char(M_.param_names_tex, 'N\_bar');
M_.param_names_long = char(M_.param_names_long, 'N_bar');
M_.param_names = char(M_.param_names, 'omega_bar');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_bar');
M_.param_names_long = char(M_.param_names_long, 'omega_bar');
M_.param_names = char(M_.param_names, 'C_bar');
M_.param_names_tex = char(M_.param_names_tex, 'C\_bar');
M_.param_names_long = char(M_.param_names_long, 'C_bar');
M_.param_names = char(M_.param_names, 'I_bar');
M_.param_names_tex = char(M_.param_names_tex, 'I\_bar');
M_.param_names_long = char(M_.param_names_long, 'I_bar');
M_.param_names = char(M_.param_names, 'r_bar');
M_.param_names_tex = char(M_.param_names_tex, 'r\_bar');
M_.param_names_long = char(M_.param_names_long, 'r_bar');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 14;
M_.param_nbr = 26;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'Y';
options_.varobs = char(options_.varobs, 'C');
options_.varobs = char(options_.varobs, 'I');
options_.varobs = char(options_.varobs, 'N');
options_.varobs = char(options_.varobs, 'omega');
options_.varobs = char(options_.varobs, 'r');
options_.varobs = char(options_.varobs, 'TR');
options_.varobs = char(options_.varobs, 'GB');
options_.varobs = char(options_.varobs, 'IB');
options_.varobs_id = [ 5 6 7 8 3 9 10 11 12  ];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Baxter_King_static');
erase_compiled_function('Baxter_King_dynamic');
M_.lead_lag_incidence = [
 1 7 21;
 2 8 0;
 0 9 0;
 3 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 22;
 0 16 0;
 4 17 0;
 5 18 0;
 6 19 0;
 0 20 23;]';
M_.nstatic = 6;
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
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(26, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 52;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 2 ) = 1.3619;
theta = M_.params( 2 );
M_.params( 3 ) = 0.02;
delta = M_.params( 3 );
M_.params( 4 ) = 0.80;
eta = M_.params( 4 );
M_.params( 5 ) = 0.3333;
alpha = M_.params( 5 );
M_.params( 9 ) = 0.75;
rho_z = M_.params( 9 );
M_.params( 10 ) = 0.75;
rho_GB = M_.params( 10 );
M_.params( 11 ) = 0.75;
rho_IB = M_.params( 11 );
M_.params( 12 ) = 0.75;
rho_tau = M_.params( 12 );
M_.params( 13 ) = 0.01;
sig_z = M_.params( 13 );
M_.params( 14 ) = 0.01;
sig_GB = M_.params( 14 );
M_.params( 15 ) = 0.01;
sig_IB = M_.params( 15 );
M_.params( 16 ) = 0.01;
sig_tau = M_.params( 16 );
M_.params( 17 ) = 2.2238;
z_bar = M_.params( 17 );
M_.params( 18 ) = 0.2000;
GB_bar = M_.params( 18 );
M_.params( 19 ) = 0.0200;
IB_bar = M_.params( 19 );
M_.params( 20 ) = 0.2200;
tau_bar = M_.params( 20 );
M_.params( 21 ) = 1;
Y_bar = M_.params( 21 );
M_.params( 22 ) = 0.3333333333333333;
N_bar = M_.params( 22 );
M_.params( 23 ) = 2;
omega_bar = M_.params( 23 );
M_.params( 24 ) = 0.7636;
C_bar = M_.params( 24 );
M_.params( 25 ) = 0.0164;
I_bar = M_.params( 25 );
M_.params( 26 ) = 0.4073;
r_bar = M_.params( 26 );
M_.params( 6 ) = 1.3095;
lambda_bar = M_.params( 6 );
M_.params( 7 ) = 0.8184;
K_bar = M_.params( 7 );
M_.params( 8 ) = 1;
KB_bar = M_.params( 8 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = M_.params(20);
oo_.steady_state( 14 ) = M_.params(6);
oo_.steady_state( 13 ) = M_.params(7);
oo_.steady_state( 4 ) = M_.params(8);
oo_.steady_state( 11 ) = M_.params(18);
oo_.steady_state( 5 ) = M_.params(21);
oo_.steady_state( 3 ) = M_.params(23);
oo_.steady_state( 9 ) = M_.params(26);
oo_.steady_state( 2 ) = M_.params(17);
oo_.steady_state( 8 ) = M_.params(22);
oo_.steady_state( 12 ) = M_.params(19);
oo_.steady_state( 6 ) = M_.params(24);
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
options_.irf = 10;
options_.nocorr = 1;
options_.nomoments = 1;
options_.order = 1;
var_list_=[];
info = stoch_simul(var_list_);
save('Baxter_King_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Baxter_King_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Baxter_King_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Baxter_King_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Baxter_King_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
