%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'bk';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('bk.log');
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
M_.endo_names = 'C';
M_.endo_names_tex = 'C';
M_.endo_names_long = 'C';
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'G_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'G\_B');
M_.endo_names_long = char(M_.endo_names_long, 'G_B');
M_.endo_names = char(M_.endo_names, 'I_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'I\_B');
M_.endo_names_long = char(M_.endo_names_long, 'I_B');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'TR');
M_.endo_names_tex = char(M_.endo_names_tex, 'TR');
M_.endo_names_long = char(M_.endo_names_long, 'TR');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'K_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_B');
M_.endo_names_long = char(M_.endo_names_long, 'K_B');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
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
M_.endo_names = char(M_.endo_names, 'dG_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'dG\_B');
M_.endo_names_long = char(M_.endo_names_long, 'dG_B');
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
M_.param_names = char(M_.param_names, 'Ybar');
M_.param_names_tex = char(M_.param_names_tex, 'Ybar');
M_.param_names_long = char(M_.param_names_long, 'Ybar');
M_.param_names = char(M_.param_names, 'Gbar_B');
M_.param_names_tex = char(M_.param_names_tex, 'Gbar\_B');
M_.param_names_long = char(M_.param_names_long, 'Gbar_B');
M_.param_names = char(M_.param_names, 'Ibar_B');
M_.param_names_tex = char(M_.param_names_tex, 'Ibar\_B');
M_.param_names_long = char(M_.param_names_long, 'Ibar_B');
M_.param_names = char(M_.param_names, 'Kbar');
M_.param_names_tex = char(M_.param_names_tex, 'Kbar');
M_.param_names_long = char(M_.param_names_long, 'Kbar');
M_.param_names = char(M_.param_names, 'Kbar_B');
M_.param_names_tex = char(M_.param_names_tex, 'Kbar\_B');
M_.param_names_long = char(M_.param_names_long, 'Kbar_B');
M_.param_names = char(M_.param_names, 'Nbar');
M_.param_names_tex = char(M_.param_names_tex, 'Nbar');
M_.param_names_long = char(M_.param_names_long, 'Nbar');
M_.param_names = char(M_.param_names, 'wbar');
M_.param_names_tex = char(M_.param_names_tex, 'wbar');
M_.param_names_long = char(M_.param_names_long, 'wbar');
M_.param_names = char(M_.param_names, 'rbar');
M_.param_names_tex = char(M_.param_names_tex, 'rbar');
M_.param_names_long = char(M_.param_names_long, 'rbar');
M_.param_names = char(M_.param_names, 'TRbar');
M_.param_names_tex = char(M_.param_names_tex, 'TRbar');
M_.param_names_long = char(M_.param_names_long, 'TRbar');
M_.param_names = char(M_.param_names, 'Ibar');
M_.param_names_tex = char(M_.param_names_tex, 'Ibar');
M_.param_names_long = char(M_.param_names_long, 'Ibar');
M_.param_names = char(M_.param_names, 'Cbar');
M_.param_names_tex = char(M_.param_names_tex, 'Cbar');
M_.param_names_long = char(M_.param_names_long, 'Cbar');
M_.param_names = char(M_.param_names, 'taubar');
M_.param_names_tex = char(M_.param_names_tex, 'taubar');
M_.param_names_long = char(M_.param_names_long, 'taubar');
M_.param_names = char(M_.param_names, 'zbar');
M_.param_names_tex = char(M_.param_names_tex, 'zbar');
M_.param_names_long = char(M_.param_names_long, 'zbar');
M_.param_names = char(M_.param_names, 'lambdabar');
M_.param_names_tex = char(M_.param_names_tex, 'lambdabar');
M_.param_names_long = char(M_.param_names_long, 'lambdabar');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 23;
M_.param_nbr = 27;
M_.orig_endo_nbr = 23;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'dY';
options_.varobs = char(options_.varobs, 'dC');
options_.varobs = char(options_.varobs, 'dI');
options_.varobs = char(options_.varobs, 'dN');
options_.varobs = char(options_.varobs, 'dw');
options_.varobs = char(options_.varobs, 'dr');
options_.varobs = char(options_.varobs, 'dTR');
options_.varobs = char(options_.varobs, 'dG_B');
options_.varobs = char(options_.varobs, 'dI_B');
options_.varobs_id = [ 15 16 17 18 19 20 21 22 23  ];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('bk_static');
erase_compiled_function('bk_dynamic');
M_.lead_lag_incidence = [
 0 7 0;
 0 8 0;
 1 9 0;
 2 10 0;
 0 11 0;
 0 12 30;
 3 13 0;
 0 14 0;
 4 15 31;
 0 16 32;
 5 17 0;
 0 18 0;
 0 19 0;
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
M_.params = NaN(27, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 72;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
set_dynare_seed(123); 
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 2 ) = 1.9123;
theta_l = M_.params( 2 );
M_.params( 3 ) = 0.1;
delta = M_.params( 3 );
M_.params( 4 ) = 0.05;
eta = M_.params( 4 );
M_.params( 5 ) = 0.3333333333333333;
alpha = M_.params( 5 );
M_.params( 6 ) = 0.75;
rho_z = M_.params( 6 );
M_.params( 7 ) = 0.75;
rho_GB = M_.params( 7 );
M_.params( 8 ) = 0.75;
rho_IB = M_.params( 8 );
M_.params( 9 ) = 0.75;
rho_tau = M_.params( 9 );
M_.params( 10 ) = 0.01;
sig_z = M_.params( 10 );
M_.params( 11 ) = 0.01;
sig_GB = M_.params( 11 );
M_.params( 12 ) = 0.01;
sig_IB = M_.params( 12 );
M_.params( 13 ) = 0.01;
sig_tau = M_.params( 13 );
M_.params( 14 ) = 1;
Ybar = M_.params( 14 );
M_.params( 15 ) = 0.2*M_.params(14);
Gbar_B = M_.params( 15 );
M_.params( 16 ) = M_.params(14)*0.02;
Ibar_B = M_.params( 16 );
M_.params( 22 ) = 0;
TRbar = M_.params( 22 );
M_.params( 20 ) = 2;
wbar = M_.params( 20 );
M_.params( 19 ) = 0.3333333333333333;
Nbar = M_.params( 19 );
M_.params( 18 ) = 0.2;
Kbar_B = M_.params( 18 );
M_.params( 25 ) = 0.22;
taubar = M_.params( 25 );
M_.params( 21 ) = 0.1412;
rbar = M_.params( 21 );
M_.params( 17 ) = 2.3615;
Kbar = M_.params( 17 );
M_.params( 26 ) = 1.6929;
zbar = M_.params( 26 );
M_.params( 23 ) = 0.2361;
Ibar = M_.params( 23 );
M_.params( 24 ) = 0.5439;
Cbar = M_.params( 24 );
M_.params( 27 ) = 1.8387;
lambdabar = M_.params( 27 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 17 ) = 0;
oo_.steady_state( 18 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 23 ) = 0;
oo_.steady_state( 13 ) = 1;
oo_.steady_state( 3 ) = 0.2*oo_.steady_state(13);
oo_.steady_state( 4 ) = 0.02*oo_.steady_state(13);
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 5 ) = 2;
oo_.steady_state( 2 ) = 0.3333333333333333;
oo_.steady_state( 11 ) = 0.2;
oo_.steady_state( 9 ) = 0.22;
oo_.steady_state( 6 ) = 0.1412;
oo_.steady_state( 7 ) = 2.3615;
oo_.steady_state( 14 ) = 1.6929;
oo_.steady_state( 12 ) = 0.2361;
oo_.steady_state( 1 ) = 0.5439;
oo_.steady_state( 10 ) = 1.8387;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
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
oo_.exo_steady_state( 4 ) = 0.01;
options_.solve_algo = 3;
steady;
options_.periods = 100;
simul();
figure(5)
subplot(3,3,1), plot(Y), title('Y'), axis tight
subplot(3,3,2), plot(C), title('C'), axis tight
subplot(3,3,3), plot(I), title('I'), axis tight
subplot(3,3,4), plot(N), title('N'), axis tight
subplot(3,3,5), plot(w), title('w'), axis tight
subplot(3,3,6), plot(r), title('r'), axis tight
subplot(3,3,7), plot(TR), title('TR'), axis tight
subplot(3,3,8), plot(I_B), title('I^B'), axis tight
subplot(3,3,9), plot(G_B), title('G^B'), axis tight;
save('bk_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('bk_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('bk_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('bk_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('bk_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
