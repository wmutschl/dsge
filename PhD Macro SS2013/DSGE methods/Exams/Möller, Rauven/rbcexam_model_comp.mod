%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Author:   Willi Mutschler (willi@mutschler.eu)  %%%%
%%%%    Version: July 10, 2012					   		%%%%
%%%%	Bayesian Estimation								%%%%
%%%%    Exercise 5: Model Comparision                  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prior weights are set to 0.5 for each model, you can try different values

model_comparison rbcestim(0.5) rbcexam1(0.5);
disp('');
disp('Posterior-Odds are the ratio of the Posterior Model Probabilities');