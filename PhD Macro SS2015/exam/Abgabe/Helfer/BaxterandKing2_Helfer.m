%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'BaxterandKing2_Helfer';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('BaxterandKing2_Helfer.log');
M_.exo_names = 'ez';
M_.exo_names_tex = 'ez';
M_.exo_names_long = 'ez';
M_.exo_names = char(M_.exo_names, 'egb');
M_.exo_names_tex = char(M_.exo_names_tex, 'egb');
M_.exo_names_long = char(M_.exo_names_long, 'egb');
M_.exo_names = char(M_.exo_names, 'eib');
M_.exo_names_tex = char(M_.exo_names_tex, 'eib');
M_.exo_names_long = char(M_.exo_names_long, 'eib');
M_.exo_names = char(M_.exo_names, 'etau');
M_.exo_names_tex = char(M_.exo_names_tex, 'etau');
M_.exo_names_long = char(M_.exo_names_long, 'etau');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'dy');
M_.endo_names_tex = char(M_.endo_names_tex, 'dy');
M_.endo_names_long = char(M_.endo_names_long, 'dy');
M_.endo_names = char(M_.endo_names, 'gb');
M_.endo_names_tex = char(M_.endo_names_tex, 'gb');
M_.endo_names_long = char(M_.endo_names_long, 'gb');
M_.endo_names = char(M_.endo_names, 'dgb');
M_.endo_names_tex = char(M_.endo_names_tex, 'dgb');
M_.endo_names_long = char(M_.endo_names_long, 'dgb');
M_.endo_names = char(M_.endo_names, 'ib');
M_.endo_names_tex = char(M_.endo_names_tex, 'ib');
M_.endo_names_long = char(M_.endo_names_long, 'ib');
M_.endo_names = char(M_.endo_names, 'dib');
M_.endo_names_tex = char(M_.endo_names_tex, 'dib');
M_.endo_names_long = char(M_.endo_names_long, 'dib');
M_.endo_names = char(M_.endo_names, 'tr');
M_.endo_names_tex = char(M_.endo_names_tex, 'tr');
M_.endo_names_long = char(M_.endo_names_long, 'tr');
M_.endo_names = char(M_.endo_names, 'dtr');
M_.endo_names_tex = char(M_.endo_names_tex, 'dtr');
M_.endo_names_long = char(M_.endo_names_long, 'dtr');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'dw');
M_.endo_names_tex = char(M_.endo_names_tex, 'dw');
M_.endo_names_long = char(M_.endo_names_long, 'dw');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'dn');
M_.endo_names_tex = char(M_.endo_names_tex, 'dn');
M_.endo_names_long = char(M_.endo_names_long, 'dn');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'dc');
M_.endo_names_tex = char(M_.endo_names_tex, 'dc');
M_.endo_names_long = char(M_.endo_names_long, 'dc');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'di');
M_.endo_names_tex = char(M_.endo_names_tex, 'di');
M_.endo_names_long = char(M_.endo_names_long, 'di');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'dr');
M_.endo_names_tex = char(M_.endo_names_tex, 'dr');
M_.endo_names_long = char(M_.endo_names_long, 'dr');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'kb');
M_.endo_names_tex = char(M_.endo_names_tex, 'kb');
M_.endo_names_long = char(M_.endo_names_long, 'kb');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'rhoz');
M_.param_names_tex = char(M_.param_names_tex, 'rhoz');
M_.param_names_long = char(M_.param_names_long, 'rhoz');
M_.param_names = char(M_.param_names, 'rhogb');
M_.param_names_tex = char(M_.param_names_tex, 'rhogb');
M_.param_names_long = char(M_.param_names_long, 'rhogb');
M_.param_names = char(M_.param_names, 'rhoib');
M_.param_names_tex = char(M_.param_names_tex, 'rhoib');
M_.param_names_long = char(M_.param_names_long, 'rhoib');
M_.param_names = char(M_.param_names, 'rhotau');
M_.param_names_tex = char(M_.param_names_tex, 'rhotau');
M_.param_names_long = char(M_.param_names_long, 'rhotau');
M_.param_names = char(M_.param_names, 'ybar');
M_.param_names_tex = char(M_.param_names_tex, 'ybar');
M_.param_names_long = char(M_.param_names_long, 'ybar');
M_.param_names = char(M_.param_names, 'gbbar');
M_.param_names_tex = char(M_.param_names_tex, 'gbbar');
M_.param_names_long = char(M_.param_names_long, 'gbbar');
M_.param_names = char(M_.param_names, 'ibbar');
M_.param_names_tex = char(M_.param_names_tex, 'ibbar');
M_.param_names_long = char(M_.param_names_long, 'ibbar');
M_.param_names = char(M_.param_names, 'trbar');
M_.param_names_tex = char(M_.param_names_tex, 'trbar');
M_.param_names_long = char(M_.param_names_long, 'trbar');
M_.param_names = char(M_.param_names, 'wbar');
M_.param_names_tex = char(M_.param_names_tex, 'wbar');
M_.param_names_long = char(M_.param_names_long, 'wbar');
M_.param_names = char(M_.param_names, 'nbar');
M_.param_names_tex = char(M_.param_names_tex, 'nbar');
M_.param_names_long = char(M_.param_names_long, 'nbar');
M_.param_names = char(M_.param_names, 'cbar');
M_.param_names_tex = char(M_.param_names_tex, 'cbar');
M_.param_names_long = char(M_.param_names_long, 'cbar');
M_.param_names = char(M_.param_names, 'ibar');
M_.param_names_tex = char(M_.param_names_tex, 'ibar');
M_.param_names_long = char(M_.param_names_long, 'ibar');
M_.param_names = char(M_.param_names, 'rbar');
M_.param_names_tex = char(M_.param_names_tex, 'rbar');
M_.param_names_long = char(M_.param_names_long, 'rbar');
M_.param_names = char(M_.param_names, 'kbar');
M_.param_names_tex = char(M_.param_names_tex, 'kbar');
M_.param_names_long = char(M_.param_names_long, 'kbar');
M_.param_names = char(M_.param_names, 'kbbar');
M_.param_names_tex = char(M_.param_names_tex, 'kbbar');
M_.param_names_long = char(M_.param_names_long, 'kbbar');
M_.param_names = char(M_.param_names, 'zbar');
M_.param_names_tex = char(M_.param_names_tex, 'zbar');
M_.param_names_long = char(M_.param_names_long, 'zbar');
M_.param_names = char(M_.param_names, 'taubar');
M_.param_names_tex = char(M_.param_names_tex, 'taubar');
M_.param_names_long = char(M_.param_names_long, 'taubar');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 22;
M_.param_nbr = 22;
M_.orig_endo_nbr = 22;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('BaxterandKing2_Helfer_static');
erase_compiled_function('BaxterandKing2_Helfer_dynamic');
M_.lead_lag_incidence = [
 0 7 0;
 0 8 0;
 1 9 0;
 0 10 0;
 2 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 29;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 30;
 0 24 0;
 3 25 0;
 4 26 0;
 5 27 31;
 6 28 0;]';
M_.nstatic = 14;
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
oo_.steady_state = zeros(22, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(22, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 68;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
set_dynare_seed(123);
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 2 ) = 0.02;
delta = M_.params( 2 );
M_.params( 3 ) = 0.50;
eta = M_.params( 3 );
M_.params( 4 ) = 1.7;
theta = M_.params( 4 );
M_.params( 5 ) = 0.3333333333333333;
alpha = M_.params( 5 );
M_.params( 6 ) = 0.75;
rhoz = M_.params( 6 );
M_.params( 7 ) = 0.75;
rhogb = M_.params( 7 );
M_.params( 8 ) = 0.75;
rhoib = M_.params( 8 );
M_.params( 9 ) = 0.75;
rhotau = M_.params( 9 );
M_.params( 10 ) = 1;
ybar = M_.params( 10 );
M_.params( 11 ) = 0.2;
gbbar = M_.params( 11 );
M_.params( 12 ) = 0.02;
ibbar = M_.params( 12 );
M_.params( 13 ) = 0;
trbar = M_.params( 13 );
M_.params( 14 ) = 2;
wbar = M_.params( 14 );
M_.params( 15 ) = 0.3333333333333333;
nbar = M_.params( 15 );
M_.params( 22 ) = 0.22;
taubar = M_.params( 22 );
M_.params( 21 ) = 1.03;
zbar = M_.params( 21 );
M_.params( 20 ) = 1;
kbbar = M_.params( 20 );
M_.params( 18 ) = 0.04;
rbar = M_.params( 18 );
M_.params( 19 ) = 8.3;
kbar = M_.params( 19 );
M_.params( 17 ) = 0.17;
ibar = M_.params( 17 );
M_.params( 16 ) = 0.61;
cbar = M_.params( 16 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 1;
oo_.steady_state( 3 ) = 0.2;
oo_.steady_state( 5 ) = 0.02;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 9 ) = 2;
oo_.steady_state( 11 ) = 0.3333333333333333;
oo_.steady_state( 21 ) = 0.22;
oo_.steady_state( 22 ) = 1.03;
oo_.steady_state( 20 ) = 1;
oo_.steady_state( 17 ) = 0.04;
oo_.steady_state( 19 ) = 8.3;
oo_.steady_state( 15 ) = 0.17;
oo_.steady_state( 13 ) = 0.61;
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
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(3, 3) = 0.0001;
options_.irf = 10;
options_.nocorr = 1;
options_.nomoments = 1;
options_.order = 1;
var_list_=[];
info = stoch_simul(var_list_);
save('BaxterandKing2_Helfer_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('BaxterandKing2_Helfer_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('BaxterandKing2_Helfer_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('BaxterandKing2_Helfer_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('BaxterandKing2_Helfer_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
