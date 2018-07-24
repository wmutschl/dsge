%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'baxter_king';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('baxter_king.log');
M_.exo_names = 'epsilon_z';
M_.exo_names_tex = 'epsilon\_z';
M_.exo_names_long = 'epsilon_z';
M_.exo_names = char(M_.exo_names, 'epsilon_G_B');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_G\_B');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_G_B');
M_.exo_names = char(M_.exo_names, 'epsilon_I_B');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_I\_B');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_I_B');
M_.exo_names = char(M_.exo_names, 'epsilon_tau');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_tau');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_tau');
M_.endo_names = 'C';
M_.endo_names_tex = 'C';
M_.endo_names_long = 'C';
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'TR');
M_.endo_names_tex = char(M_.endo_names_tex, 'TR');
M_.endo_names_long = char(M_.endo_names_long, 'TR');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'K_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_B');
M_.endo_names_long = char(M_.endo_names_long, 'K_B');
M_.endo_names = char(M_.endo_names, 'I_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'I\_B');
M_.endo_names_long = char(M_.endo_names_long, 'I_B');
M_.endo_names = char(M_.endo_names, 'G_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'G\_B');
M_.endo_names_long = char(M_.endo_names_long, 'G_B');
M_.endo_names = char(M_.endo_names, 'dY');
M_.endo_names_tex = char(M_.endo_names_tex, 'dY');
M_.endo_names_long = char(M_.endo_names_long, 'dY');
M_.endo_names = char(M_.endo_names, 'dC');
M_.endo_names_tex = char(M_.endo_names_tex, 'dC');
M_.endo_names_long = char(M_.endo_names_long, 'dC');
M_.endo_names = char(M_.endo_names, 'dI');
M_.endo_names_tex = char(M_.endo_names_tex, 'dI');
M_.endo_names_long = char(M_.endo_names_long, 'dI');
M_.endo_names = char(M_.endo_names, 'dN');
M_.endo_names_tex = char(M_.endo_names_tex, 'dN');
M_.endo_names_long = char(M_.endo_names_long, 'dN');
M_.endo_names = char(M_.endo_names, 'dw');
M_.endo_names_tex = char(M_.endo_names_tex, 'dw');
M_.endo_names_long = char(M_.endo_names_long, 'dw');
M_.endo_names = char(M_.endo_names, 'dr');
M_.endo_names_tex = char(M_.endo_names_tex, 'dr');
M_.endo_names_long = char(M_.endo_names_long, 'dr');
M_.endo_names = char(M_.endo_names, 'dTR');
M_.endo_names_tex = char(M_.endo_names_tex, 'dTR');
M_.endo_names_long = char(M_.endo_names_long, 'dTR');
M_.endo_names = char(M_.endo_names, 'dG');
M_.endo_names_tex = char(M_.endo_names_tex, 'dG');
M_.endo_names_long = char(M_.endo_names_long, 'dG');
M_.endo_names = char(M_.endo_names, 'dI_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'dI\_B');
M_.endo_names_long = char(M_.endo_names_long, 'dI_B');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'theta_l');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_l');
M_.param_names_long = char(M_.param_names_long, 'theta_l');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rho_G_B');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_G\_B');
M_.param_names_long = char(M_.param_names_long, 'rho_G_B');
M_.param_names = char(M_.param_names, 'rho_I_B');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_I\_B');
M_.param_names_long = char(M_.param_names_long, 'rho_I_B');
M_.param_names = char(M_.param_names, 'rho_tau');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau');
M_.param_names_long = char(M_.param_names_long, 'rho_tau');
M_.param_names = char(M_.param_names, 'z_q');
M_.param_names_tex = char(M_.param_names_tex, 'z\_q');
M_.param_names_long = char(M_.param_names_long, 'z_q');
M_.param_names = char(M_.param_names, 'G_B_q');
M_.param_names_tex = char(M_.param_names_tex, 'G\_B\_q');
M_.param_names_long = char(M_.param_names_long, 'G_B_q');
M_.param_names = char(M_.param_names, 'I_B_q');
M_.param_names_tex = char(M_.param_names_tex, 'I\_B\_q');
M_.param_names_long = char(M_.param_names_long, 'I_B_q');
M_.param_names = char(M_.param_names, 'tau_q');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_q');
M_.param_names_long = char(M_.param_names_long, 'tau_q');
M_.param_names = char(M_.param_names, 'Y_q');
M_.param_names_tex = char(M_.param_names_tex, 'Y\_q');
M_.param_names_long = char(M_.param_names_long, 'Y_q');
M_.param_names = char(M_.param_names, 'I_q');
M_.param_names_tex = char(M_.param_names_tex, 'I\_q');
M_.param_names_long = char(M_.param_names_long, 'I_q');
M_.param_names = char(M_.param_names, 'N_q');
M_.param_names_tex = char(M_.param_names_tex, 'N\_q');
M_.param_names_long = char(M_.param_names_long, 'N_q');
M_.param_names = char(M_.param_names, 'w_q');
M_.param_names_tex = char(M_.param_names_tex, 'w\_q');
M_.param_names_long = char(M_.param_names_long, 'w_q');
M_.param_names = char(M_.param_names, 'C_q');
M_.param_names_tex = char(M_.param_names_tex, 'C\_q');
M_.param_names_long = char(M_.param_names_long, 'C_q');
M_.param_names = char(M_.param_names, 'TR_q');
M_.param_names_tex = char(M_.param_names_tex, 'TR\_q');
M_.param_names_long = char(M_.param_names_long, 'TR_q');
M_.param_names = char(M_.param_names, 'r_q');
M_.param_names_tex = char(M_.param_names_tex, 'r\_q');
M_.param_names_long = char(M_.param_names_long, 'r_q');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 23;
M_.param_nbr = 20;
M_.orig_endo_nbr = 23;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('baxter_king_static');
erase_compiled_function('baxter_king_dynamic');
M_.lead_lag_incidence = [
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 30;
 1 11 31;
 0 12 32;
 0 13 0;
 2 14 0;
 0 15 0;
 3 16 0;
 0 17 0;
 4 18 0;
 5 19 0;
 6 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 0;]';
M_.nstatic = 15;
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
oo_.steady_state = zeros(23, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(20, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 72;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 2 ) = 1.9123;
theta_l = M_.params( 2 );
M_.params( 3 ) = 0.10;
delta = M_.params( 3 );
M_.params( 4 ) = 0.05;
eta = M_.params( 4 );
M_.params( 5 ) = 0.3333333333333333;
alpha = M_.params( 5 );
M_.params( 6 ) = 0.75;
rho_z = M_.params( 6 );
M_.params( 7 ) = 0.75;
rho_G_B = M_.params( 7 );
M_.params( 8 ) = 0.75;
rho_I_B = M_.params( 8 );
M_.params( 9 ) = 0.75;
rho_tau = M_.params( 9 );
M_.params( 11 ) = 0.2;
G_B_q = M_.params( 11 );
M_.params( 12 ) = 0.02;
I_B_q = M_.params( 12 );
M_.params( 13 ) = 0.22;
tau_q = M_.params( 13 );
M_.params( 10 ) = 1.69291;
z_q = M_.params( 10 );
M_.params( 14 ) = 1;
Y_q = M_.params( 14 );
M_.params( 15 ) = 0.23615;
I_q = M_.params( 15 );
M_.params( 16 ) = 0.3333333333333333;
N_q = M_.params( 16 );
M_.params( 17 ) = 2;
w_q = M_.params( 17 );
M_.params( 18 ) = 0.54385;
C_q = M_.params( 18 );
M_.params( 19 ) = 0;
TR_q = M_.params( 19 );
M_.params( 20 ) = 0.141155;
r_q = M_.params( 20 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = M_.params(18);
oo_.steady_state( 2 ) = M_.params(16);
oo_.steady_state( 3 ) = M_.params(17);
oo_.steady_state( 4 ) = M_.params(20);
oo_.steady_state( 5 ) = M_.params(13);
oo_.steady_state( 7 ) = M_.params(19);
oo_.steady_state( 6 ) = 1/oo_.steady_state(1);
oo_.steady_state( 9 ) = M_.params(14);
oo_.steady_state( 10 ) = 2.3615;
oo_.steady_state( 11 ) = M_.params(15);
oo_.steady_state( 12 ) = 0.20;
oo_.steady_state( 13 ) = M_.params(12);
oo_.steady_state( 14 ) = M_.params(11);
oo_.steady_state( 8 ) = M_.params(10);
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.exo_steady_state( 4 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
options_.solve_algo = 3;
steady;
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.exo_steady_state( 4 ) = 0.01111111111111111;
options_.solve_algo = 3;
steady;
options_.periods = 100;
simul();
subplot(331),plot(tau),title('Tax rate')
subplot(332),plot(dY),title('GDP')
subplot(333),plot(dC),title('Consmption')
subplot(334),plot(dI),title('Investment')
subplot(335),plot(dN),title('Employment')
subplot(336),plot(dw),title('Real wage')
subplot(337),plot(dr),title('Real interest rate')
subplot(338),plot(dTR),title('Transfers')
subplot(339),plot(dG),title('Government spending')
save('baxter_king_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('baxter_king_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('baxter_king_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('baxter_king_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('baxter_king_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
