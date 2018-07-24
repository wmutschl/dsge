% Dynare Script
clear all
clc
steps = 10;

alp_vec = linspace(0.35,0.45,steps);
del_vec   = linspace(0.004,0.05,steps);

mean_simuls = zeros(length(alp_vec),length(del_vec),4);
dynare Neoclassical noclearall;

for i = 1:length(alp_vec)
    for j = 1:length(del_vec)

    alp = alp_vec(i);
    del = del_vec(j);

    set_param_value('alp',alp);
    set_param_value('del',del);

    % Execute the .mod file without preprocessing each time:
    info = stoch_simul(var_list_);
    if info;
     disp(['Computation fails for alph = ' num2str(alp_vec(i)) ' and delta ' num2str(del_vec(j)) ]);
    end;

    % Extract the simulations
    simuls  = get_simul_replications(M_,options_);

    mean_periods = mean(simuls,2);
    mean_simuls(i,j,:)  = mean(mean_periods,3);
 end
end

mesh(del_vec,alp_vec,mean_simuls(:,:,2))

%c k lab z

% Fit
k_mat = ones(size(mean_simuls(:,:,2)))*29.1;
c_mat = ones(size(mean_simuls(:,:,1)))*1.5;

Error = (k_mat - mean_simuls(:,:,2)).^2 + (c_mat - mean_simuls(:,:,1)).^2;

[ii,jj] = find(Error == min(Error(:)));

disp(['Best Fit ('  num2str(min(Error(:)))  ') for delta =' num2str(del_vec(jj)) ' and alpha =' num2str(alp_vec(ii))]);
