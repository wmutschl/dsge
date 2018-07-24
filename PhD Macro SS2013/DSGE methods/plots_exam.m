close all;
% Dynamic response to a technology shock
a             = a_eps_a;
nat_y         = a;
act_y         = a + x_eps_a;
nat_nom_rate  = rstar_eps_a;
act_nom_rate  = r_eps_a;
nat_real_rate = rstar_eps_a;
act_real_rate = r_eps_a([1:end-1])-pie_eps_a([2:end]);
infl          = pie_eps_a;
output_gap    = x_eps_a;
act_emp       = act_y-a;
nat_emp       = 0*act_emp;
t = 1:length(a);
figure(1)
subplot(331),plot(t,infl,'k'),title('Inflation'),axis tight
subplot(332),plot(t,output_gap,'k'),title('Ouput Gap'),axis tight
subplot(333),plot(t,nat_nom_rate,'k',t,act_nom_rate,'k*',t,act_nom_rate,'k'),legend('Natural Nominal Rate','Actual Nominal Rate'),title('Nominal Rate'),axis tight
subplot(334),plot(t,nat_real_rate,'k',t([1:end-1]),act_real_rate,'k*-'),legend('Natural','Actual'),title('Real Rate'),axis tight
subplot(335),plot(t,a,'k'),title('log Technology'),axis tight
subplot(336),plot(t,nat_y,'k',t,act_y,'k*',t,act_y,'k'),legend('Natural Output','Actual Output'),title('Output'),axis tight
subplot(337),plot(t,nat_emp,'k',t,act_emp,'k*',t,act_emp,'k'),legend('Natural Employment','Actual Employment'),title('Employment'),axis tight