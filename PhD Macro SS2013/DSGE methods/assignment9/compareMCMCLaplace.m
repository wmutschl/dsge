%recover the posterior distribution of the shocks, as well as the
%standard deviation of all the parameters. According to DsgeLikelihood.m,
%the criterion is minus, log(the product of the likelihood and the priors).
%The lines right after if options_.mode_compute ~= 5 & options_.mode_compute ~= 6 
%in Dynare_estimation.m suggest that hh is second derivative of the criterion.
%The line, hh = generalized_cholesky(hh); in the same m file
%indicates that the hessian is 'processed' and changed in case it is 
%not positive definite. The next line shows hh being inverted and the 
%line after that computes standard errors as the square root of the 
%diagonal elements of the inverse.Later, we can see these standard errors
%being reported in the printout as the standard errors of the parameters.

figure('Name','compare Laplace and MCMC')
%these are the modes of the parameters
eps_amode=oo_.posterior_mode.shocks_std.eps_a;
eps_taumode=oo_.posterior_mode.shocks_std.eps_tau;
rhomode=oo_.posterior_mode.parameters.rho;
lambdamode=oo_.posterior_mode.parameters.lambda;

%these are the posterior distributions from MCMC
rhoMCMC=oo_.posterior_density.parameters.rho;
lambdaMCMC=oo_.posterior_density.parameters.lambda;
SE_eps_aMCMC=oo_.posterior_density.shocks_std.eps_a;
SE_eps_tauMCMC=oo_.posterior_density.shocks_std.eps_tau;

%standard deviations, obtained from inverse of log-hessian
rhostd=sqrt(oo_.posterior_variance.parameters.rho);
lambdastd=sqrt(oo_.posterior_variance.parameters.lambda);
eps_astd=sqrt(oo_.posterior_variance.shocks_std.eps_a);
eps_taustd=sqrt(oo_.posterior_variance.shocks_std.eps_tau);

subplot(221)
plot(SE_eps_aMCMC(:,1),SE_eps_aMCMC(:,2),SE_eps_aMCMC(:,1),normpdf(SE_eps_aMCMC(:,1),eps_amode,eps_astd),'*-')
legend('MCMC','Laplace')
title('Standard deviation of technology innovation')
axis tight
subplot(222)
plot(SE_eps_tauMCMC(:,1),SE_eps_tauMCMC(:,2),SE_eps_tauMCMC(:,1),normpdf(SE_eps_tauMCMC(:,1),eps_taumode,eps_taustd),'*-')
axis tight
title('Standard deviation of preference innovation')
subplot(223)
plot(rhoMCMC(:,1),rhoMCMC(:,2),rhoMCMC(:,1),normpdf(rhoMCMC(:,1),rhomode,rhostd),'*-')
axis tight
title('Rho')
subplot(224)
plot(lambdaMCMC(:,1),lambdaMCMC(:,2),lambdaMCMC(:,1),normpdf(lambdaMCMC(:,1),lambdamode,lambdastd),'*-')
axis tight
title('Lambda')