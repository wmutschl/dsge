t = 1:20;

%% Plots for stochastic model
% additional variables for government consumption shock
dY_t_epsi_gb = 100*(Y_t_epsi_gb(t)-Y_ts)/Y_ts;
dC_t_epsi_gb = 100*(C_t_epsi_gb(t)-C_ts)/C_ts;
dI_t_epsi_gb = 100*(I_t_epsi_gb(t)-I_ts)/I_ts;
dw_t_epsi_gb = 100*(w_t_epsi_gb(t)-w_ts)/w_ts;
dGB_t_epsi_gb = 100*(GB_t_epsi_gb(t)-GB_ts)/GB_ts;
dIB_t_epsi_gb = 100*(IB_t_epsi_gb(t)-IB_ts)/IB_ts;

dN_t_epsi_gb = 100*(N_t_epsi_gb(t)-N_ts);
dr_t_epsi_gb = 100*(r_t_epsi_gb(t)-r_ts);
dTR_t_epsi_gb = 100*(TR_t_epsi_gb(t)-TR_ts);

% additional variables for government investment shock
dY_t_epsi_ib = 100*(Y_t_epsi_ib(t)-Y_ts)/Y_ts;
dC_t_epsi_ib = 100*(C_t_epsi_ib(t)-C_ts)/C_ts;
dI_t_epsi_ib = 100*(I_t_epsi_ib(t)-I_ts)/I_ts;
dw_t_epsi_ib = 100*(w_t_epsi_ib(t)-w_ts)/w_ts;
dGB_t_epsi_ib = 100*(GB_t_epsi_ib(t)-GB_ts)/GB_ts;
dIB_t_epsi_ib = 100*(IB_t_epsi_ib(t)-IB_ts)/IB_ts;

dN_t_epsi_ib = 100*(N_t_epsi_ib(t)-N_ts);
dr_t_epsi_ib = 100*(r_t_epsi_ib(t)-r_ts);
dTR_t_epsi_ib = 100*(TR_t_epsi_ib(t)-TR_ts);


% Dynamic response to shock
figure('Name','STOCHASTIC MODEL')
subplot(331); plot([dY_t_epsi_gb dY_t_epsi_ib]) ;title('Inflation');
subplot(332),plot(t,output_gap),title('Ouput Gap'),axis tight
subplot(333),plot(t,nat_nom_rate,t,act_nom_rate),legend('Natural Nominal Rate','Actual Nominal Rate','Location','SouthEast'),title('Nominal Rate'),axis tight
subplot(334),plot(t,nat_real_rate,t,act_real_rate),legend('Natural','Actual','Location','SouthEast'),title('Real Rate'),axis tight
subplot(335),plot(t,technol),title('log Technology'),axis tight
subplot(336),plot(t,nat_y,t,act_y),legend('Natural Output','Actual Output','Location','SouthEast'),title('Output'),axis tight