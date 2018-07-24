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
M_.fname = 'SimulateData';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'SimulateData.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e_z';
M_.exo_names_tex = 'e\_z';
M_.exo_names = char(M_.exo_names, 'e_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_g');
M_.exo_names = char(M_.exo_names, 'e_R');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_R');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names = char(M_.endo_names, 'YGR');
M_.endo_names_tex = char(M_.endo_names_tex, 'YGR');
M_.endo_names = char(M_.endo_names, 'INFL');
M_.endo_names_tex = char(M_.endo_names_tex, 'INFL');
M_.endo_names = char(M_.endo_names, 'INT');
M_.endo_names_tex = char(M_.endo_names_tex, 'INT');
M_.endo_names = char(M_.endo_names, 'AGR');
M_.endo_names_tex = char(M_.endo_names_tex, 'AGR');
M_.endo_names = char(M_.endo_names, 'CGR');
M_.endo_names_tex = char(M_.endo_names_tex, 'CGR');
M_.param_names = 'tau';
M_.param_names_tex = 'tau';
M_.param_names = char(M_.param_names, 'kap');
M_.param_names_tex = char(M_.param_names_tex, 'kap');
M_.param_names = char(M_.param_names, 'psi1');
M_.param_names_tex = char(M_.param_names_tex, 'psi1');
M_.param_names = char(M_.param_names, 'psi2');
M_.param_names_tex = char(M_.param_names_tex, 'psi2');
M_.param_names = char(M_.param_names, 'rhoR');
M_.param_names_tex = char(M_.param_names_tex, 'rhoR');
M_.param_names = char(M_.param_names, 'rhog');
M_.param_names_tex = char(M_.param_names_tex, 'rhog');
M_.param_names = char(M_.param_names, 'rhoz');
M_.param_names_tex = char(M_.param_names_tex, 'rhoz');
M_.param_names = char(M_.param_names, 'r_A');
M_.param_names_tex = char(M_.param_names_tex, 'r\_A');
M_.param_names = char(M_.param_names, 'p_A');
M_.param_names_tex = char(M_.param_names_tex, 'p\_A');
M_.param_names = char(M_.param_names, 'gam_Q');
M_.param_names_tex = char(M_.param_names_tex, 'gam\_Q');
M_.param_names = char(M_.param_names, 'stdR');
M_.param_names_tex = char(M_.param_names_tex, 'stdR');
M_.param_names = char(M_.param_names, 'stdg');
M_.param_names_tex = char(M_.param_names_tex, 'stdg');
M_.param_names = char(M_.param_names, 'stdz');
M_.param_names_tex = char(M_.param_names_tex, 'stdz');
M_.param_names = char(M_.param_names, 'bet');
M_.param_names_tex = char(M_.param_names_tex, 'bet');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 11;
M_.param_nbr = 14;
M_.orig_endo_nbr = 11;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'YGR';
options_.varobs = char(options_.varobs, 'INFL');
options_.varobs = char(options_.varobs, 'INT');
options_.varobs = char(options_.varobs, 'AGR');
options_.varobs = char(options_.varobs, 'CGR');
options_.varobs_id = [ 7 8 9 10 11  ];
M_.Sigma_e = zeros(3, 3);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('SimulateData_static');
erase_compiled_function('SimulateData_dynamic');
M_.lead_lag_incidence = [
 1 6 17;
 2 7 0;
 0 8 18;
 3 9 0;
 4 10 19;
 5 11 20;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;]';
M_.nstatic = 5;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 3;
M_.equations_tags = {
};
M_.state_var = [1 2 4 5 6 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(14, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 40;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
Einstellung = 1 ;
if Einstellung == 1;
M_.params( 1 ) = 2.000;
tau = M_.params( 1 );
M_.params( 2 ) = 0.150;
kap = M_.params( 2 );
M_.params( 3 ) = 1.500;
psi1 = M_.params( 3 );
M_.params( 4 ) = 1.000;
psi2 = M_.params( 4 );
M_.params( 5 ) = 0.600;
rhoR = M_.params( 5 );
M_.params( 6 ) = 0.950;
rhog = M_.params( 6 );
M_.params( 7 ) = 0.650;
rhoz = M_.params( 7 );
M_.params( 11 ) = 0.2;
stdR = M_.params( 11 );
M_.params( 12 ) = 0.8;
stdg = M_.params( 12 );
M_.params( 13 ) = 0.45;
stdz = M_.params( 13 );
M_.params( 8 ) = 4.00;
r_A = M_.params( 8 );
M_.params( 9 ) = 4.000;
p_A = M_.params( 9 );
M_.params( 10 ) = 0.500;
gam_Q = M_.params( 10 );
elseif Einstellung == 2;
M_.params( 1 ) = 2.000;
tau = M_.params( 1 );
M_.params( 2 ) = 0.1750;
kap = M_.params( 2 );
M_.params( 3 ) = 2.000;
psi1 = M_.params( 3 );
M_.params( 4 ) = 1.000;
psi2 = M_.params( 4 );
M_.params( 5 ) = 0.500;
rhoR = M_.params( 5 );
M_.params( 6 ) = 0.90;
rhog = M_.params( 6 );
M_.params( 7 ) = 0.70;
rhoz = M_.params( 7 );
M_.params( 11 ) = 0.3;
stdR = M_.params( 11 );
M_.params( 12 ) = 0.5;
stdg = M_.params( 12 );
M_.params( 13 ) = 0.4;
stdz = M_.params( 13 );
M_.params( 9 ) = 4.006491505;
p_A = M_.params( 9 );
M_.params( 10 ) = 0.470040407;
gam_Q = M_.params( 10 );
M_.params( 8 ) = 6.41918092-M_.params(9)-4*M_.params(10);
r_A = M_.params( 8 );
end;	
M_.params( 14 ) = 1/(1+M_.params(8)/400);
bet = M_.params( 14 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.sigma_e_is_diagonal = 1;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
check(M_,options_,oo_);
set_dynare_seed =123;
options_.irf = 0;
options_.order = 1;
options_.periods = 1000;
options_.solve_algo = 3;
var_list_=[];
info = stoch_simul(var_list_);
if Einstellung == 1; 
xlswrite('simdat.xls', YGR(401:500),'Simulierte Daten', 'B4:B103');
xlswrite('simdat.xls', INFL(401:500),'Simulierte Daten', 'C4:C103');
xlswrite('simdat.xls', INT(401:500),'Simulierte Daten', 'D4:D103');
xlswrite('simdat.xls', AGR(401:500),'Simulierte Daten', 'E4:E103');
xlswrite('simdat.xls', CGR(401:500),'Simulierte Daten', 'F4:F103');				
save('simdat','YGR', 'INFL','INT');
elseif Einstellung == 2; 
xlswrite('simdat.xls', YGR(401:500),'Daten im Vergleich', 'D3:D102');
xlswrite('simdat.xls', INFL(401:500),'Daten im Vergleich', 'E3:E102');
xlswrite('simdat.xls', INT(401:500),'Daten im Vergleich', 'F3:F102');
end;	
save('SimulateData_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
