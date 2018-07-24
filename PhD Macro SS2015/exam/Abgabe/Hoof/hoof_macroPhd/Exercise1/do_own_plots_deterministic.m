%% Plots for deterministic model
t = 2:round(length(Y)/4); %note that dynare stores the initial value in the first entry

%variables to plot
output		= 100*(Y(t)-Y(1))/Y(1);
consumption    	= 100*(C(t)-C(1))/C(1);
investment  	= 100*(I(t)-I(1))/I(1);
labor  		= 100*(N(t)-N(1));
wage 		= 100*(w(t)-w(1))/w(1);
interest	= 100*(r(t)-r(1));
transfer	= 100*(TR(t)-TR(1));
consumption_g 	= 100*(G_b(t)./Y(t)-G_b(1)/Y(1));
investment_g 	= 100*(I_b(t)./Y(t)-I_b(1)/Y(1));


% Dynamic response to shock
figure('Name','Shock')
subplot(331),plot(t,output),		title('Output'),	axis tight, line(xlim,[0 0],'Color','r') 
subplot(332),plot(t,consumption),	title('Consumption'),	axis tight, line(xlim,[0 0],'Color','r') 
subplot(333),plot(t,investment),	title('Investment'),	axis tight, line(xlim,[0 0],'Color','r') 
subplot(334),plot(t,labor),		title('Labor'),		axis tight, line(xlim,[0 0],'Color','r') 
subplot(335),plot(t,wage),		title('Wage'),		axis tight, line(xlim,[0 0],'Color','r') 
subplot(336),plot(t,interest),		title('Interest'),	axis tight, line(xlim,[0 0],'Color','r') 
subplot(337),plot(t,transfer),		title('Transfers'),	axis tight, line(xlim,[0 0],'Color','r') 
subplot(338),plot(t,consumption_g),	title('Gov. Spending'),	axis tight, line(xlim,[0 0],'Color','r') 
subplot(339),plot(t,investment_g),	title('Gov. Investment'),axis tight,line(xlim,[0 0],'Color','r') 