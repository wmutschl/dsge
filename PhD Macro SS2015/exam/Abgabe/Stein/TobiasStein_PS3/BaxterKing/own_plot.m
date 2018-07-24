%Own Plots
t=2:100;

Output          = dY(t);
Consumption     = dC(t);
Investment      = dI(t);
Real_Labor      = dN(t);
real_wage       = dw(t);
real_int_rate   = dr(t);
Transfers       = dTR(t);
Gov_Spending    = dGB(t);
Gov_Investment  = dIB(t);



figure('Name','Percent Deviations from Steady State')
subplot(331),plot(t,Output),title('Output'),axis tight
subplot(332),plot(t,Consumption),title('Consumption'),axis tight
subplot(333),plot(t,Investment),title('Investment'),axis tight
subplot(334),plot(t,Real_Labor),title('Real Labor Supply'),axis tight
subplot(335),plot(t,real_wage),title('Real Wage'),axis tight
subplot(336),plot(t,real_int_rate),title('Real Interest Rate'),axis tight
subplot(337),plot(t,Transfers),title('Lump-Sum Transfers'),axis tight
subplot(338),plot(t,Gov_Spending),title('Gov. Spending'),axis tight
subplot(339),plot(t,Gov_Investment),title('Gov. Investment'),axis tight



figure('Name','Development of Endogenous Variables')
subplot(341),plot(t,Y(t)),title('Output'),axis tight
subplot(342),plot(t,C(t)),title('Consumption'),axis tight
subplot(343),plot(t,I(t)),title('Investment'),axis tight
subplot(344),plot(t,N(t)),title('Real Labor Supply'),axis tight
subplot(345),plot(t,w(t)),title('Real Wage'),axis tight
subplot(346),plot(t,r(t)),title('Real Interest Rate'),axis tight
subplot(347),plot(t,TR(t)),title('Lump-Sum Transfers'),axis tight
subplot(348),plot(t,GB(t)),title('Gov. Spending'),axis tight
subplot(349),plot(t,IB(t)),title('Gov. Investment'),axis tight
subplot(3,4,10),plot(t,tau(t)),title('Tax Rate'),axis tight
subplot(3,4,11),plot(t,KB(t)),title('Public Capital'),axis tight
subplot(3,4,12),plot(t,K(t)),title('Private Capital'),axis tight
