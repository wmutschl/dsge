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
M_.fname = 'Exercise_5h';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'Exercise_5h.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_det_nbr = 0;
M_.exo_nbr = 0;
M_.endo_nbr = 0;
M_.param_nbr = 0;
M_.orig_endo_nbr = 0;
M_.aux_vars = [];
M_.Sigma_e = zeros(0, 0);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Exercise_5h_static');
erase_compiled_function('Exercise_5h_dynamic');
ModelNames_ = {};
ModelPriors_ = [];
ModelNames_ = { ModelNames_{:} 'Exercise_5bcdef'};
ModelPriors_ = [ ModelPriors_ ; 0.5];
ModelNames_ = { ModelNames_{:} 'Exercise_5g'};
ModelPriors_ = [ ModelPriors_ ; 0.5];
model_comparison(ModelNames_,ModelPriors_,oo_,options_,M_.fname);
disp('');
disp('Posterior-Odds are the ratio of the Posterior Model Probabilities');
save('Exercise_5h_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
