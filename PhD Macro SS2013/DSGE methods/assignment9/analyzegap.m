
%Dynare placed the estimated ('smoothed') output gap in oo_.SmoothedVariables.x
tt=1:length(oo_.SmoothedVariables.Median.x); %

%load up the data, including the actual output gap, which is in x
datapullcgg

%get the level of actual output
y=cumsum(dy);
y=y([first_:first_+num_-1]);

%HP filter actual output (ytrend - the HP trend, ycycle - the HP cycle)
[ycycle,ytrend]=HPFAST(y,1600);

subplot(211)
plot(tt,y,tt,ytrend,'x-')
legend('actual output','HP trend output')
axis tight

subplot(212)
plot(tt,ycycle,tt,x([first_:first_+num_-1]),'-o',tt,oo_.SmoothedVariables.Median.x,'*-') %
legend('HP filtered estimate of gap','Actual gap','DSGE-based (smoothed) Estimate of Gap')
axis tight

figure('name','Actual and Smoothed Output Gap')

plot(tt,oo_.SmoothedVariables.Median.x,'x-','LineWidth',2,'Color',[.6 0 0]) %
hold on
plot(tt,oo_.SmoothedVariables.HPDinf.x,tt,oo_.SmoothedVariables.HPDsup.x) %
hold on
plot(tt,x([first_:first_+num_-1]),'*-','Color','b','LineWidth',2)
legend('Median estimate of output gap','upper 95% probability interval','lower 95% probability interval','actual data')
axis tight
title('Comparison of Actual and DSGE-Based Estimated (smoothed) Output Gap','FontSize',18)

%a 'filtered variable' is E_t-1 y_t, for t=1,...,T, where t=1 corresponds to
%the first observation and t=T corresponds to the last. Since the t=1
%forecast is based on no data, it is simply the unconditional mean of the
%series. There is a non-zero entry in period t=T+1...that appears to be a
%one-period-ahead out of sample forecast.
figure('name','Actual and Filtered Output Gap')
subplot(211)
plot(tt,oo_.FilteredVariables.Median.x(1:num_),'x-','LineWidth',2,'Color',[.6 0 0]) %
hold on
plot(tt,x([first_:first_+num_-1]),'*-','Color','b','LineWidth',3)
legend('Median estimate of output gap','Actual output gap')
axis tight
title('Comparison of Actual and ''Real-time'' DSGE-Based (filtered) Estimated Output Gap','FontSize',18)


subplot(212)
plot(tt,x([first_:first_+num_-1])-oo_.FilteredVariables.Median.x(1:num_))
title('Actual output gap minus ''real-time'' estimate','FontSize',18)
axis tight

figure('name','Real-time estimates of Output Gap and Actual') 

yyc=zeros(num_,1);
yy=y([1:2]);
[yycycle,yytrend]=HPFAST(yy,1600);
yyc=yycycle;
for ii = 3:num_
    yy=y([1:ii]);
    [yycycle,yytrend]=HPFAST(yy,1600);
    yyc(ii)=yycycle(ii);
end


plot(tt,yyc,tt,x([first_:first_+num_-1]),'-o',tt,oo_.FilteredVariables.Median.x(1:num_),'*-')
legend('''Real time'' HP filtered estimate of gap','Actual gap','''Real-time DSGE-based (filtered) estimate of output gap')
axis tight

%this code assumes that the first forecast is the last observation in the
%data. This assumption is checked:
if abs(oo_.PointForecast.Median.dy(1)-dy(first_+num_-1)) > .1e-10 | abs(oo_.PointForecast.HPDinf.dy(1)-dy(first_+num_-1)) > .1e-10
    error('fatal (analyzegap) assumption about forecasts not satisfied')
end

figure('name','forecasts and actual ')
tf=[tt(end)+1:tt(end)+12];
subplot(211)
plot(tt,dy([first_:first_+num_-1]),tf,oo_.PointForecast.Median.dy(end-11:end),'x-',tf,oo_.PointForecast.HPDinf.dy(end-11:end),'*-',tf,oo_.PointForecast.HPDsup.dy(end-11:end),'*-')
legend('Actual data','median forecast','95% confidence interval')
title('output growth')
subplot(212)
plot(tt,pie([first_:first_+num_-1]),tf,oo_.PointForecast.Median.pie(end-11:end),'x-',tf,oo_.PointForecast.HPDinf.pie(end-11:end),'*-',tf,oo_.PointForecast.HPDsup.pie(end-11:end),'*-')
title('inflation')  
str='Forecasts of inflation and output growth';
hout=suptitle(str);
