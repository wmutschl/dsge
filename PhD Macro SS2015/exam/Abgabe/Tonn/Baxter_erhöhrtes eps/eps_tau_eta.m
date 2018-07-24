%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'eps_tau_eta';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('eps_tau_eta.log');
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
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'TR');
M_.endo_names_tex = char(M_.endo_names_tex, 'TR');
M_.endo_names_long = char(M_.endo_names_long, 'TR');
M_.endo_names = char(M_.endo_names, 'GB');
M_.endo_names_tex = char(M_.endo_names_tex, 'GB');
M_.endo_names_long = char(M_.endo_names_long, 'GB');
M_.endo_names = char(M_.endo_names, 'IB');
M_.endo_names_tex = char(M_.endo_names_tex, 'IB');
M_.endo_names_long = char(M_.endo_names_long, 'IB');
M_.endo_names = char(M_.endo_names, 'KB');
M_.endo_names_tex = char(M_.endo_names_tex, 'KB');
M_.endo_names_long = char(M_.endo_names_long, 'KB');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
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
M_.endo_names = char(M_.endo_names, 'dGB');
M_.endo_names_tex = char(M_.endo_names_tex, 'dGB');
M_.endo_names_long = char(M_.endo_names_long, 'dGB');
M_.endo_names = char(M_.endo_names, 'dIB');
M_.endo_names_tex = char(M_.endo_names_tex, 'dIB');
M_.endo_names_long = char(M_.endo_names_long, 'dIB');
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
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
M_.param_names = char(M_.param_names, 'sig_tau');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_tau');
M_.param_names_long = char(M_.param_names_long, 'sig_tau');
M_.param_names = char(M_.param_names, 'sig_IB');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_IB');
M_.param_names_long = char(M_.param_names_long, 'sig_IB');
M_.param_names = char(M_.param_names, 'sig_GB');
M_.param_names_tex = char(M_.param_names_tex, 'sig\_GB');
M_.param_names_long = char(M_.param_names_long, 'sig_GB');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 23;
M_.param_nbr = 13;
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
options_.varobs = char(options_.varobs, 'dGB');
options_.varobs = char(options_.varobs, 'dIB');
options_.varobs_id = [ 15 16 17 18 19 20 21 22 23  ];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('eps_tau_eta_static');
erase_compiled_function('eps_tau_eta_dynamic');
M_.lead_lag_incidence = [
 0 7 0;
 0 8 0;
 0 9 0;
 1 10 0;
 0 11 0;
 0 12 30;
 0 13 0;
 2 14 31;
 3 15 0;
 0 16 0;
 4 17 0;
 5 18 0;
 6 19 0;
 0 20 32;
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
M_.params = NaN(13, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 68;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.3333333333333333;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 5 ) = 1.776;
theta = M_.params( 5 );
M_.params( 4 ) = 0.03;
delta = M_.params( 4 );
M_.params( 3 ) = 0.07;
eta = M_.params( 3 );
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
M_.params( 12 ) = 0.01;
sig_IB = M_.params( 12 );
M_.params( 13 ) = 0.01;
sig_GB = M_.params( 13 );
M_.params( 11 ) = 0.01;
sig_tau = M_.params( 11 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 7 ) = 1;
oo_.steady_state( 11 ) = 0.2;
oo_.steady_state( 12 ) = 0.02;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 5 ) = 2;
oo_.steady_state( 2 ) = 0.3333333333333333;
oo_.steady_state( 6 ) = 0.0514;
oo_.steady_state( 4 ) = 6.485;
oo_.steady_state( 8 ) = 0.22;
oo_.steady_state( 1 ) = 0.5855;
oo_.steady_state( 14 ) = 1.708;
oo_.steady_state( 13 ) = 0.6666666666666666;
oo_.steady_state( 3 ) = 0.19455;
oo_.steady_state( 9 ) = 1.1475;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
options_.solve_algo = 3;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
%
% SHOCKS instructions
%
make_ex_;
set_shocks(0,1, 3, 1);
M_.exo_det_length = 0;
options_.periods = 100;
simul();
figure(5)
subplot(3,4,1), plot(Y), title('Output'), axis tight
subplot(3,4,2), plot(C), title('Consumption'), axis tight
subplot(3,4,3), plot(I), title('Investment'), axis tight
subplot(3,4,4), plot(N), title('Labor supply'), axis tight
subplot(3,4,5), plot(w), title('Real Wage'), axis tight
subplot(3,4,6), plot(r), title('Real Interest Rate'), axis tight
subplot(3,4,7), plot(TR), title('Lump-sum Transfers'), axis tight
subplot(3,4,8), plot(IB), title('Public Inverstment'), axis tight
subplot(3,4,9), plot(GB), title('Public Consumption'), axis tight
subplot(3,4,10), plot(KB), title('Public Capital'), axis tight
subplot(3,4,11), plot(K), title('Private Capital'), axis tight
subplot(3,4,12), plot(tau), title('Tax Rate'), axis tight
save('eps_tau_eta_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('eps_tau_eta_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('eps_tau_eta_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('eps_tau_eta_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('eps_tau_eta_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
