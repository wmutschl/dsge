%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'AnScho';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('AnScho.log');
M_.exo_names = 'eps_R';
M_.exo_names_tex = 'eps\_R';
M_.exo_names_long = 'eps_R';
M_.exo_names = char(M_.exo_names, 'eps_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_g');
M_.exo_names_long = char(M_.exo_names_long, 'eps_g');
M_.exo_names = char(M_.exo_names, 'eps_z');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_z');
M_.exo_names_long = char(M_.exo_names_long, 'eps_z');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'pie');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie');
M_.endo_names_long = char(M_.endo_names_long, 'pie');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'YGR');
M_.endo_names_tex = char(M_.endo_names_tex, 'YGR');
M_.endo_names_long = char(M_.endo_names_long, 'YGR');
M_.endo_names = char(M_.endo_names, 'INFL');
M_.endo_names_tex = char(M_.endo_names_tex, 'INFL');
M_.endo_names_long = char(M_.endo_names_long, 'INFL');
M_.endo_names = char(M_.endo_names, 'INT');
M_.endo_names_tex = char(M_.endo_names_tex, 'INT');
M_.endo_names_long = char(M_.endo_names_long, 'INT');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'v');
M_.param_names_tex = char(M_.param_names_tex, 'v');
M_.param_names_long = char(M_.param_names_long, 'v');
M_.param_names = char(M_.param_names, 'kap');
M_.param_names_tex = char(M_.param_names_tex, 'kap');
M_.param_names_long = char(M_.param_names_long, 'kap');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'pi2');
M_.param_names_tex = char(M_.param_names_tex, 'pi2');
M_.param_names_long = char(M_.param_names_long, 'pi2');
M_.param_names = char(M_.param_names, 'gst');
M_.param_names_tex = char(M_.param_names_tex, 'gst');
M_.param_names_long = char(M_.param_names_long, 'gst');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_R');
M_.param_names_long = char(M_.param_names_long, 'rho_R');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'psi1');
M_.param_names_tex = char(M_.param_names_tex, 'psi1');
M_.param_names_long = char(M_.param_names_long, 'psi1');
M_.param_names = char(M_.param_names, 'psi2');
M_.param_names_tex = char(M_.param_names_tex, 'psi2');
M_.param_names_long = char(M_.param_names_long, 'psi2');
M_.param_names = char(M_.param_names, 'gamQ');
M_.param_names_tex = char(M_.param_names_tex, 'gamQ');
M_.param_names_long = char(M_.param_names_long, 'gamQ');
M_.param_names = char(M_.param_names, 'piA');
M_.param_names_tex = char(M_.param_names_tex, 'piA');
M_.param_names_long = char(M_.param_names_long, 'piA');
M_.param_names = char(M_.param_names, 'rA');
M_.param_names_tex = char(M_.param_names_tex, 'rA');
M_.param_names_long = char(M_.param_names_long, 'rA');
M_.param_names = char(M_.param_names, 'sigR');
M_.param_names_tex = char(M_.param_names_tex, 'sigR');
M_.param_names_long = char(M_.param_names_long, 'sigR');
M_.param_names = char(M_.param_names, 'sigg');
M_.param_names_tex = char(M_.param_names_tex, 'sigg');
M_.param_names_long = char(M_.param_names_long, 'sigg');
M_.param_names = char(M_.param_names, 'sigz');
M_.param_names_tex = char(M_.param_names_tex, 'sigz');
M_.param_names_long = char(M_.param_names_long, 'sigz');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 9;
M_.param_nbr = 18;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'YGR';
options_.varobs = char(options_.varobs, 'INFL');
options_.varobs = char(options_.varobs, 'INT');
options_.varobs_id = [ 7 8 9  ];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('AnScho_static');
erase_compiled_function('AnScho_dynamic');
M_.lead_lag_incidence = [
 0 5 14;
 1 6 0;
 0 7 15;
 2 8 16;
 3 9 0;
 4 10 17;
 0 11 0;
 0 12 0;
 0 13 0;]';
M_.nstatic = 3;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(18, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 35;
M_.NNZDerivatives(2) = 57;
M_.NNZDerivatives(3) = -1;
M_.params( 2 ) = 2;
tau = M_.params( 2 );
M_.params( 3 ) = 0.1;
v = M_.params( 3 );
M_.params( 7 ) = 0.85;
gst = M_.params( 7 );
M_.params( 8 ) = 0.75;
rho_R = M_.params( 8 );
M_.params( 9 ) = 0.95;
rho_g = M_.params( 9 );
M_.params( 10 ) = 0.9;
rho_z = M_.params( 10 );
M_.params( 11 ) = 1.5;
psi1 = M_.params( 11 );
M_.params( 12 ) = 0.125;
psi2 = M_.params( 12 );
M_.params( 13 ) = 0.55;
gamQ = M_.params( 13 );
M_.params( 14 ) = 3.2;
piA = M_.params( 14 );
M_.params( 15 ) = 1;
rA = M_.params( 15 );
M_.params( 16 ) = 0.2;
sigR = M_.params( 16 );
M_.params( 17 ) = 0.6;
sigg = M_.params( 17 );
M_.params( 18 ) = 0.3;
sigz = M_.params( 18 );
M_.params( 4 ) = 0.33;
kap = M_.params( 4 );
M_.params( 1 ) = 1/(1+M_.params(15)/400);
beta = M_.params( 1 );
M_.params( 6 ) = (1+M_.params(14)/400)^2;
pi2 = M_.params( 6 );
M_.params( 5 ) = M_.params(2)*(1-M_.params(3))/M_.params(3)/M_.params(4)/M_.params(6);
phi = M_.params( 5 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(16))^2;
M_.Sigma_e(2, 2) = (M_.params(17))^2;
M_.Sigma_e(3, 3) = (M_.params(18))^2;
M_.sigma_e_is_diagonal = 1;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_ident = struct();
dynare_identification(options_ident);
save('AnScho_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('AnScho_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('AnScho_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('AnScho_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('AnScho_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
