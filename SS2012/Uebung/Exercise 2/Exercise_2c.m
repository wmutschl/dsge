%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
clear global
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Exercise_2c';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'Exercise_2c.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names = char(M_.param_names, 'epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 8;
M_.param_nbr = 7;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'c';
options_.varobs = char(options_.varobs, 'y');
options_.varobs = char(options_.varobs, 'i');
options_.varobs = char(options_.varobs, 'w');
options_.varobs = char(options_.varobs, 'r');
options_.varobs_id = [ 2 1 4 6 7  ];
M_.Sigma_e = zeros(1, 1);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Exercise_2c_static');
erase_compiled_function('Exercise_2c_dynamic');
M_.lead_lag_incidence = [
 0 3 0;
 0 4 11;
 1 5 0;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 12;
 2 10 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.equations_tags = {
};
M_.state_var = [3 8 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 25;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 4 ) = 0.33;
alpha = M_.params( 4 );
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 3 ) = 0.023;
delta = M_.params( 3 );
M_.params( 2 ) = 1.75;
psi = M_.params( 2 );
M_.params( 5 ) = 0.95;
rho = M_.params( 5 );
M_.params( 6 ) = 0.01;
sigma = M_.params( 6 );
M_.params( 7 ) = 10;
epsilon = M_.params( 7 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(6))^2;
M_.sigma_e_is_diagonal = 1;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 1;
oo_.steady_state( 2 ) = 0.7;
oo_.steady_state( 3 ) = 9;
oo_.steady_state( 4 ) = 0.2;
oo_.steady_state( 5 ) = 0.3;
oo_.steady_state( 6 ) = 2.0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 1;
oo_.exo_steady_state( 1 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
check(M_,options_,oo_);
options_.irf = 0;
options_.nocorr = 1;
options_.nomoments = 1;
options_.order = 1;
options_.periods = 1000;
options_.solve_algo = 3;
var_list_=[];
info = stoch_simul(var_list_);
plot(c(401:500));
xlswrite('simdat.xls', c(401:500),'Simulierte Daten', 'B4:B103');
xlswrite('simdat.xls', y(401:500),'Simulierte Daten', 'C4:C103');
xlswrite('simdat.xls', i(401:500),'Simulierte Daten', 'D4:D103');
xlswrite('simdat.xls', w(401:500),'Simulierte Daten', 'E4:E103');
xlswrite('simdat.xls', r(401:500),'Simulierte Daten', 'E4:E103');
save('simdat','c', 'y','i','w','r');	
save('Exercise_2c_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
