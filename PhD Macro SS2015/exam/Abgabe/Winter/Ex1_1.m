%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Ex1_1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Ex1_1.log');
M_.exo_names = 'epsilon_GB';
M_.exo_names_tex = 'epsilon\_GB';
M_.exo_names_long = 'epsilon_GB';
M_.exo_names = char(M_.exo_names, 'epsilon_IB');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_IB');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_IB');
M_.exo_names = char(M_.exo_names, 'epsilon_tau');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_tau');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_tau');
M_.exo_names = char(M_.exo_names, 'epsilon_z');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_z');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_z');
M_.endo_names = 'C';
M_.endo_names_tex = 'C';
M_.endo_names_long = 'C';
M_.endo_names = char(M_.endo_names, 'dC');
M_.endo_names_tex = char(M_.endo_names_tex, 'dC');
M_.endo_names_long = char(M_.endo_names_long, 'dC');
M_.endo_names = char(M_.endo_names, 'dGB');
M_.endo_names_tex = char(M_.endo_names_tex, 'dGB');
M_.endo_names_long = char(M_.endo_names_long, 'dGB');
M_.endo_names = char(M_.endo_names, 'dI');
M_.endo_names_tex = char(M_.endo_names_tex, 'dI');
M_.endo_names_long = char(M_.endo_names_long, 'dI');
M_.endo_names = char(M_.endo_names, 'dIB');
M_.endo_names_tex = char(M_.endo_names_tex, 'dIB');
M_.endo_names_long = char(M_.endo_names_long, 'dIB');
M_.endo_names = char(M_.endo_names, 'dN');
M_.endo_names_tex = char(M_.endo_names_tex, 'dN');
M_.endo_names_long = char(M_.endo_names_long, 'dN');
M_.endo_names = char(M_.endo_names, 'domega');
M_.endo_names_tex = char(M_.endo_names_tex, 'domega');
M_.endo_names_long = char(M_.endo_names_long, 'domega');
M_.endo_names = char(M_.endo_names, 'dr');
M_.endo_names_tex = char(M_.endo_names_tex, 'dr');
M_.endo_names_long = char(M_.endo_names_long, 'dr');
M_.endo_names = char(M_.endo_names, 'dTR');
M_.endo_names_tex = char(M_.endo_names_tex, 'dTR');
M_.endo_names_long = char(M_.endo_names_long, 'dTR');
M_.endo_names = char(M_.endo_names, 'dY');
M_.endo_names_tex = char(M_.endo_names_tex, 'dY');
M_.endo_names_long = char(M_.endo_names_long, 'dY');
M_.endo_names = char(M_.endo_names, 'GB');
M_.endo_names_tex = char(M_.endo_names_tex, 'GB');
M_.endo_names_long = char(M_.endo_names_long, 'GB');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'IB');
M_.endo_names_tex = char(M_.endo_names_tex, 'IB');
M_.endo_names_long = char(M_.endo_names_long, 'IB');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'KB');
M_.endo_names_tex = char(M_.endo_names_tex, 'KB');
M_.endo_names_long = char(M_.endo_names_long, 'KB');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'omega');
M_.endo_names_tex = char(M_.endo_names_tex, 'omega');
M_.endo_names_long = char(M_.endo_names_long, 'omega');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'TR');
M_.endo_names_tex = char(M_.endo_names_tex, 'TR');
M_.endo_names_long = char(M_.endo_names_long, 'TR');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'C_ss');
M_.param_names_tex = char(M_.param_names_tex, 'C\_ss');
M_.param_names_long = char(M_.param_names_long, 'C_ss');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'GB_ss');
M_.param_names_tex = char(M_.param_names_tex, 'GB\_ss');
M_.param_names_long = char(M_.param_names_long, 'GB_ss');
M_.param_names = char(M_.param_names, 'IB_ss');
M_.param_names_tex = char(M_.param_names_tex, 'IB\_ss');
M_.param_names_long = char(M_.param_names_long, 'IB_ss');
M_.param_names = char(M_.param_names, 'I_ss');
M_.param_names_tex = char(M_.param_names_tex, 'I\_ss');
M_.param_names_long = char(M_.param_names_long, 'I_ss');
M_.param_names = char(M_.param_names, 'KB_ss');
M_.param_names_tex = char(M_.param_names_tex, 'KB\_ss');
M_.param_names_long = char(M_.param_names_long, 'KB_ss');
M_.param_names = char(M_.param_names, 'K_ss');
M_.param_names_tex = char(M_.param_names_tex, 'K\_ss');
M_.param_names_long = char(M_.param_names_long, 'K_ss');
M_.param_names = char(M_.param_names, 'lambda_ss');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_ss');
M_.param_names_long = char(M_.param_names_long, 'lambda_ss');
M_.param_names = char(M_.param_names, 'N_ss');
M_.param_names_tex = char(M_.param_names_tex, 'N\_ss');
M_.param_names_long = char(M_.param_names_long, 'N_ss');
M_.param_names = char(M_.param_names, 'omega_ss');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_ss');
M_.param_names_long = char(M_.param_names_long, 'omega_ss');
M_.param_names = char(M_.param_names, 'rho_GB');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_GB');
M_.param_names_long = char(M_.param_names_long, 'rho_GB');
M_.param_names = char(M_.param_names, 'rho_IB');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_IB');
M_.param_names_long = char(M_.param_names_long, 'rho_IB');
M_.param_names = char(M_.param_names, 'rho_tau');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau');
M_.param_names_long = char(M_.param_names_long, 'rho_tau');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rK');
M_.param_names_tex = char(M_.param_names_tex, 'rK');
M_.param_names_long = char(M_.param_names_long, 'rK');
M_.param_names = char(M_.param_names, 'r_ss');
M_.param_names_tex = char(M_.param_names_tex, 'r\_ss');
M_.param_names_long = char(M_.param_names_long, 'r_ss');
M_.param_names = char(M_.param_names, 'tau_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_ss');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'TR_ss');
M_.param_names_tex = char(M_.param_names_tex, 'TR\_ss');
M_.param_names_long = char(M_.param_names_long, 'TR_ss');
M_.param_names = char(M_.param_names, 'Y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Y\_ss');
M_.param_names_long = char(M_.param_names_long, 'Y_ss');
M_.param_names = char(M_.param_names, 'z_ss');
M_.param_names_tex = char(M_.param_names_tex, 'z\_ss');
M_.param_names_long = char(M_.param_names_long, 'z_ss');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 23;
M_.param_nbr = 24;
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
erase_compiled_function('Ex1_1_static');
erase_compiled_function('Ex1_1_dynamic');
M_.lead_lag_incidence = [
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 1 17 0;
 0 18 0;
 2 19 0;
 3 20 0;
 4 21 0;
 0 22 30;
 0 23 0;
 0 24 0;
 0 25 31;
 5 26 32;
 0 27 0;
 0 28 0;
 6 29 0;]';
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
M_.params = NaN(24, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 72;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
set_dynare_seed(123); 
M_.params( 2 ) = 0.988;
beta = M_.params( 2 );
M_.params( 4 ) = 0.05;
delta = M_.params( 4 );
M_.params( 5 ) = 0.05;
eta = M_.params( 5 );
M_.params( 23 ) = 1;
Y_ss = M_.params( 23 );
M_.params( 6 ) = 0.2*M_.params(23);
GB_ss = M_.params( 6 );
M_.params( 7 ) = M_.params(23)*0.02;
IB_ss = M_.params( 7 );
M_.params( 22 ) = 0;
TR_ss = M_.params( 22 );
M_.params( 13 ) = 2;
omega_ss = M_.params( 13 );
M_.params( 12 ) = 0.3333333333333333;
N_ss = M_.params( 12 );
M_.params( 14 ) = 0.75;
rho_GB = M_.params( 14 );
M_.params( 15 ) = 0.75;
rho_IB = M_.params( 15 );
M_.params( 16 ) = 0.75;
rho_tau = M_.params( 16 );
M_.params( 17 ) = 0.75;
rho_z = M_.params( 17 );
M_.params( 1 ) = 1-M_.params(13)*M_.params(12)/M_.params(23);
alpha = M_.params( 1 );
M_.params( 18 ) = M_.params(23)*M_.params(1);
rK = M_.params( 18 );
M_.params( 20 ) = (M_.params(6)+M_.params(7)+M_.params(22))/(M_.params(13)*M_.params(12)+M_.params(18));
tau_ss = M_.params( 20 );
M_.params( 19 ) = (1-M_.params(2)*(1-M_.params(4)))/(M_.params(2)*(1-M_.params(20)));
r_ss = M_.params( 19 );
M_.params( 10 ) = M_.params(23)*M_.params(1)/M_.params(19);
K_ss = M_.params( 10 );
M_.params( 8 ) = M_.params(4)*M_.params(10);
I_ss = M_.params( 8 );
M_.params( 3 ) = M_.params(23)-M_.params(8)-M_.params(6)-M_.params(7);
C_ss = M_.params( 3 );
M_.params( 11 ) = 1/M_.params(3);
lambda_ss = M_.params( 11 );
M_.params( 21 ) = M_.params(13)*(1-M_.params(20))*(1-M_.params(12))/M_.params(3);
theta = M_.params( 21 );
M_.params( 9 ) = M_.params(7)/M_.params(4);
KB_ss = M_.params( 9 );
M_.params( 24 ) = M_.params(23)/(M_.params(9)^M_.params(5)*M_.params(10)^M_.params(1)*M_.params(12)^(1-M_.params(1)));
z_ss = M_.params( 24 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 17 ) = 0.3333333333333333;
oo_.steady_state( 18 ) = 2;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 22 ) = 1;
oo_.steady_state( 11 ) = 0.2*M_.params(23);
oo_.steady_state( 13 ) = M_.params(23)*0.02;
oo_.steady_state( 20 ) = M_.params(20);
oo_.steady_state( 19 ) = M_.params(19);
oo_.steady_state( 14 ) = M_.params(10);
oo_.steady_state( 12 ) = M_.params(8);
oo_.steady_state( 1 ) = M_.params(3);
oo_.steady_state( 16 ) = M_.params(11);
oo_.steady_state( 15 ) = M_.params(9);
oo_.steady_state( 23 ) = M_.params(24);
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
oo_.exo_steady_state( 3 ) = 0;
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
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.exo_steady_state( 3 ) = log((M_.params(20)+0.01)/M_.params(20))-log((M_.params(20)+0.01)/M_.params(20))*M_.params(16);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
options_.periods = 100;
simul();
subplot(331),plot(Y),title('dY'), axis tight
subplot(332),plot(C),title('dC'), axis tight
subplot(333),plot(I),title('dI'), axis tight
subplot(334),plot(tau),title('tau'), axis tight
subplot(335),plot(omega),title('domega'), axis tight
subplot(336),plot(N),title('dN'), axis tight
subplot(337),plot(r),title('dr'), axis tight
subplot(338),plot(K),title('K'), axis tight
subplot(339),plot(TR),title('dTR'), axis tight
save('Ex1_1_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Ex1_1_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Ex1_1_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Ex1_1_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Ex1_1_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
