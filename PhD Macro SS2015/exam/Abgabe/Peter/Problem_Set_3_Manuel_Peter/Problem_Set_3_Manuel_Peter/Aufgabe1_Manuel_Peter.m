%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Aufgabe1_Manuel_Peter';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Aufgabe1_Manuel_Peter.log');
M_.exo_names = 'eps_z';
M_.exo_names_tex = 'eps\_z';
M_.exo_names_long = 'eps_z';
M_.exo_names = char(M_.exo_names, 'eps_tau');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_tau');
M_.exo_names_long = char(M_.exo_names_long, 'eps_tau');
M_.exo_names = char(M_.exo_names, 'eps_G');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_G');
M_.exo_names_long = char(M_.exo_names_long, 'eps_G');
M_.exo_names = char(M_.exo_names, 'eps_I_gov');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_I\_gov');
M_.exo_names_long = char(M_.exo_names_long, 'eps_I_gov');
M_.endo_names = 'tau_t';
M_.endo_names_tex = 'tau\_t';
M_.endo_names_long = 'tau_t';
M_.endo_names = char(M_.endo_names, 'C_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'C\_t');
M_.endo_names_long = char(M_.endo_names_long, 'C_t');
M_.endo_names = char(M_.endo_names, 'N_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'N\_t');
M_.endo_names_long = char(M_.endo_names_long, 'N_t');
M_.endo_names = char(M_.endo_names, 'r_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_t');
M_.endo_names_long = char(M_.endo_names_long, 'r_t');
M_.endo_names = char(M_.endo_names, 'K_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_t');
M_.endo_names_long = char(M_.endo_names_long, 'K_t');
M_.endo_names = char(M_.endo_names, 'K_gov_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_gov\_t');
M_.endo_names_long = char(M_.endo_names_long, 'K_gov_t');
M_.endo_names = char(M_.endo_names, 'I_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'I\_t');
M_.endo_names_long = char(M_.endo_names_long, 'I_t');
M_.endo_names = char(M_.endo_names, 'I_gov_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'I\_gov\_t');
M_.endo_names_long = char(M_.endo_names_long, 'I_gov_t');
M_.endo_names = char(M_.endo_names, 'Y_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y\_t');
M_.endo_names_long = char(M_.endo_names_long, 'Y_t');
M_.endo_names = char(M_.endo_names, 'z_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'z\_t');
M_.endo_names_long = char(M_.endo_names_long, 'z_t');
M_.endo_names = char(M_.endo_names, 'G_gov_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'G\_gov\_t');
M_.endo_names_long = char(M_.endo_names_long, 'G_gov_t');
M_.endo_names = char(M_.endo_names, 'TR_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'TR\_t');
M_.endo_names_long = char(M_.endo_names_long, 'TR_t');
M_.endo_names = char(M_.endo_names, 'omega_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'omega\_t');
M_.endo_names_long = char(M_.endo_names_long, 'omega_t');
M_.endo_names = char(M_.endo_names, 'lamda_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'lamda\_t');
M_.endo_names_long = char(M_.endo_names_long, 'lamda_t');
M_.endo_names = char(M_.endo_names, 'dC_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dC\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dC_t');
M_.endo_names = char(M_.endo_names, 'dY_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dY\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dY_t');
M_.endo_names = char(M_.endo_names, 'dI_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dI\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dI_t');
M_.endo_names = char(M_.endo_names, 'dN_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dN\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dN_t');
M_.endo_names = char(M_.endo_names, 'domega_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'domega\_t');
M_.endo_names_long = char(M_.endo_names_long, 'domega_t');
M_.endo_names = char(M_.endo_names, 'dr_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dr\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dr_t');
M_.endo_names = char(M_.endo_names, 'dTR_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dTR\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dTR_t');
M_.endo_names = char(M_.endo_names, 'dG_gov_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dG\_gov\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dG_gov_t');
M_.endo_names = char(M_.endo_names, 'dI_gov_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dI\_gov\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dI_gov_t');
M_.param_names = 'theta';
M_.param_names_tex = 'theta';
M_.param_names_long = 'theta';
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'phi_z');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_z');
M_.param_names_long = char(M_.param_names_long, 'phi_z');
M_.param_names = char(M_.param_names, 'phi_tau');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_tau');
M_.param_names_long = char(M_.param_names_long, 'phi_tau');
M_.param_names = char(M_.param_names, 'phi_G');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_G');
M_.param_names_long = char(M_.param_names_long, 'phi_G');
M_.param_names = char(M_.param_names, 'phi_I_gov');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_I\_gov');
M_.param_names_long = char(M_.param_names_long, 'phi_I_gov');
M_.param_names = char(M_.param_names, 'z');
M_.param_names_tex = char(M_.param_names_tex, 'z');
M_.param_names_long = char(M_.param_names_long, 'z');
M_.param_names = char(M_.param_names, 'G_gov');
M_.param_names_tex = char(M_.param_names_tex, 'G\_gov');
M_.param_names_long = char(M_.param_names_long, 'G_gov');
M_.param_names = char(M_.param_names, 'I_gov');
M_.param_names_tex = char(M_.param_names_tex, 'I\_gov');
M_.param_names_long = char(M_.param_names_long, 'I_gov');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'C');
M_.param_names_tex = char(M_.param_names_tex, 'C');
M_.param_names_long = char(M_.param_names_long, 'C');
M_.param_names = char(M_.param_names, 'N');
M_.param_names_tex = char(M_.param_names_tex, 'N');
M_.param_names_long = char(M_.param_names_long, 'N');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, 'omega');
M_.param_names_long = char(M_.param_names_long, 'omega');
M_.param_names = char(M_.param_names, 'Y');
M_.param_names_tex = char(M_.param_names_tex, 'Y');
M_.param_names_long = char(M_.param_names_long, 'Y');
M_.param_names = char(M_.param_names, 'TR');
M_.param_names_tex = char(M_.param_names_tex, 'TR');
M_.param_names_long = char(M_.param_names_long, 'TR');
M_.param_names = char(M_.param_names, 'r');
M_.param_names_tex = char(M_.param_names_tex, 'r');
M_.param_names_long = char(M_.param_names_long, 'r');
M_.param_names = char(M_.param_names, 'I');
M_.param_names_tex = char(M_.param_names_tex, 'I');
M_.param_names_long = char(M_.param_names_long, 'I');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 23;
M_.param_nbr = 20;
M_.orig_endo_nbr = 23;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'Y_t';
options_.varobs = char(options_.varobs, 'C_t');
options_.varobs = char(options_.varobs, 'N_t');
options_.varobs = char(options_.varobs, 'I_t');
options_.varobs = char(options_.varobs, 'I_gov_t');
options_.varobs = char(options_.varobs, 'G_gov_t');
options_.varobs_id = [ 9 2 3 7 8 11  ];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Aufgabe1_Manuel_Peter_static');
erase_compiled_function('Aufgabe1_Manuel_Peter_dynamic');
M_.lead_lag_incidence = [
 1 6 0;
 0 7 0;
 0 8 0;
 0 9 29;
 2 10 0;
 3 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 4 15 0;
 5 16 0;
 0 17 0;
 0 18 0;
 0 19 30;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;]';
M_.nstatic = 16;
M_.nfwrd   = 2;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 5;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(23, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(20, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 71;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 1.53416149068323;
theta = M_.params( 1 );
M_.params( 2 ) = 0.02;
delta = M_.params( 2 );
M_.params( 3 ) = 0.25;
eta = M_.params( 3 );
M_.params( 4 ) = 0.3333333333333333;
alpha = M_.params( 4 );
M_.params( 5 ) = 0.97;
beta = M_.params( 5 );
M_.params( 6 ) = 0.75;
phi_z = M_.params( 6 );
M_.params( 7 ) = 0.75;
phi_tau = M_.params( 7 );
M_.params( 8 ) = 0.75;
phi_G = M_.params( 8 );
M_.params( 9 ) = 0.75;
phi_I_gov = M_.params( 9 );
M_.params( 10 ) = 1.208021856727522;
z = M_.params( 10 );
M_.params( 11 ) = 0.2;
G_gov = M_.params( 11 );
M_.params( 12 ) = 0.02;
I_gov = M_.params( 12 );
M_.params( 13 ) = 0.22;
tau = M_.params( 13 );
M_.params( 14 ) = 0.6778947368421052;
C = M_.params( 14 );
M_.params( 15 ) = 0.3333333333333333;
N = M_.params( 15 );
M_.params( 16 ) = 2;
omega = M_.params( 16 );
M_.params( 17 ) = 1;
Y = M_.params( 17 );
M_.params( 18 ) = 0;
TR = M_.params( 18 );
M_.params( 19 ) = 0.06529209621993128;
r = M_.params( 19 );
M_.params( 20 ) = 0.1021052631578947;
I = M_.params( 20 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 9 ) = 1;
oo_.steady_state( 3 ) = 0.3333333333333333;
oo_.steady_state( 13 ) = 2;
oo_.steady_state( 11 ) = 0.2;
oo_.steady_state( 8 ) = 0.02;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 1 ) = 0.22;
oo_.steady_state( 6 ) = 1;
oo_.steady_state( 14 ) = 1.475155279503106;
oo_.steady_state( 4 ) = 0.06529209621993128;
oo_.steady_state( 5 ) = 5.105263157894737;
oo_.steady_state( 10 ) = 1.208021856727522;
oo_.steady_state( 7 ) = 0.1021052631578947;
oo_.steady_state( 2 ) = 0.6778947368421052;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 17 ) = 0;
oo_.steady_state( 18 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 23 ) = 0;
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
oo_.exo_steady_state( 2 ) = 0;
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
oo_.exo_steady_state( 2 ) = 0.0111;
steady;
%
% SHOCKS instructions
%
make_ex_;
set_shocks(0,1:5, 2, 0);
M_.exo_det_length = 0;
options_.periods = 300;
simul();
var_list_=[];
var_list_ = 'C_t';
rplot(var_list_);
var_list_=[];
var_list_ = 'Y_t';
rplot(var_list_);
var_list_=[];
var_list_ = 'K_t';
rplot(var_list_);
save('Aufgabe1_Manuel_Peter_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Aufgabe1_Manuel_Peter_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Aufgabe1_Manuel_Peter_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Aufgabe1_Manuel_Peter_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Aufgabe1_Manuel_Peter_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
