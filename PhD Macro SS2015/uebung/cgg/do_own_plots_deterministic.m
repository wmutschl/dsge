%% Plots for deterministic model
t = 2:8; %note that dynare stores the initial value in the first entry
% additional variables
a = cumsum(da);
y = cumsum(dy);
rr = r(1:end-1)-pie(2:end);
ystar = y-x;

%variables to plot
infl          = pie(t);
output_gap    = x(t);
nat_nom_rate  = rstar(t);
act_nom_rate  = r(t);
nat_real_rate = rstar(t);
act_real_rate = rr(t);
technol       = a(t);
nat_y         = ystar(t);
act_y         = y(t);


% Dynamic response to shock
figure('Name','DETERMINISTIC MODEL')
subplot(321),plot(t,infl),title('Inflation'),axis tight
subplot(322),plot(t,output_gap),title('Ouput Gap'),axis tight
subplot(323),plot(t,nat_nom_rate,t,act_nom_rate),legend('Natural Nominal Rate','Actual Nominal Rate','Location','SouthEast'),title('Nominal Rate'),axis tight
subplot(324),plot(t,nat_real_rate,t,act_real_rate),legend('Natural','Actual','Location','SouthEast'),title('Real Rate'),axis tight
subplot(325),plot(t,technol),title('log Technology'),axis tight
subplot(326),plot(t,nat_y,t,act_y),legend('Natural Output','Actual Output','Location','SouthEast'),title('Output'),axis tight