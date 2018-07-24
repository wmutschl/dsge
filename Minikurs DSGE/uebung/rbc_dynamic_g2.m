function g2 = rbc_dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = rbc_dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g2
%

if T_flag
    T = rbc_dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
v2 = zeros(36,3);
v2(1,1)=1;
v2(1,2)=1;
v2(1,3)=(-(T(9)*params(4)*getPowerDeriv(y(1),params(5),2)+T(8)*T(22)));
v2(2,1)=1;
v2(2,2)=73;
v2(2,3)=(-(T(11)*T(22)));
v2(3,1)=1;
v2(3,2)=5;
v2(3,3)=v2(2,3);
v2(4,1)=1;
v2(4,2)=77;
v2(4,3)=(-(T(11)*T(11)*T(21)+T(9)*(1-params(4))*getPowerDeriv(y(5),params(5),2)));
v2(5,1)=2;
v2(5,2)=1;
v2(5,3)=(-(params(4)*(T(10)*(-((-y(14))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))+(-y(14))/(y(1)*y(1))*T(24))));
v2(6,1)=2;
v2(6,2)=235;
v2(6,3)=(-(params(4)*(T(19)*T(24)+T(10)*(-1)/(y(1)*y(1)))));
v2(7,1)=2;
v2(7,2)=14;
v2(7,3)=v2(6,3);
v2(8,1)=2;
v2(8,2)=248;
v2(8,3)=(-(params(4)*T(19)*T(19)*T(23)));
v2(9,1)=3;
v2(9,2)=77;
v2(9,3)=(-((1-params(4))*(T(12)*(-((-y(14))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+(-y(14))/(y(5)*y(5))*T(26))));
v2(10,1)=3;
v2(10,2)=239;
v2(10,3)=(-((1-params(4))*(T(20)*T(26)+T(12)*(-1)/(y(5)*y(5)))));
v2(11,1)=3;
v2(11,2)=86;
v2(11,3)=v2(10,3);
v2(12,1)=3;
v2(12,2)=248;
v2(12,3)=(-((1-params(4))*T(20)*T(20)*T(25)));
v2(13,1)=4;
v2(13,2)=77;
v2(13,3)=(-(T(13)*T(5)*params(2)*T(2)*T(13)*T(14)+T(6)*T(27)+T(13)*T(5)*params(2)*T(2)*T(13)*T(14)+T(3)*T(5)*params(2)*(T(14)*T(2)*T(27)+T(2)*T(13)*T(29))));
v2(14,1)=4;
v2(14,2)=95;
v2(14,3)=(-(T(13)*T(18)+T(3)*(T(5)*params(2)*(T(3)*T(16)*T(29)+T(14)*T(13)*T(16))+params(2)*T(2)*T(13)*T(14)*T(17))));
v2(15,1)=4;
v2(15,2)=78;
v2(15,3)=v2(14,3);
v2(16,1)=4;
v2(16,2)=96;
v2(16,3)=(-(T(3)*(params(2)*T(14)*T(3)*T(16)*T(17)+T(5)*params(2)*(T(3)*T(16)*T(3)*T(16)*T(28)+T(14)*T(3)*T(30))+params(2)*T(14)*T(3)*T(16)*T(17)+params(2)*T(4)*getPowerDeriv(y(6),params(2)-1,2))));
v2(17,1)=5;
v2(17,2)=77;
v2(17,3)=T(2)*(1-params(2))*T(2)*T(13)*T(14)*T(15)+T(7)*T(2)*(1-params(2))*(T(14)*T(2)*T(27)+T(2)*T(13)*T(29))+T(2)*(1-params(2))*T(2)*T(13)*T(14)*T(15)+T(2)*(1-params(2))*T(4)*getPowerDeriv(1-y(5),(-params(2)),2);
v2(18,1)=5;
v2(18,2)=95;
v2(18,3)=T(15)*((1-params(2))*T(4)*T(16)+T(2)*(1-params(2))*T(14)*T(3)*T(16))+T(7)*((1-params(2))*T(2)*T(13)*T(14)*T(16)+T(2)*(1-params(2))*(T(3)*T(16)*T(29)+T(14)*T(13)*T(16)));
v2(19,1)=5;
v2(19,2)=78;
v2(19,3)=v2(18,3);
v2(20,1)=5;
v2(20,2)=96;
v2(20,3)=T(7)*(T(16)*(1-params(2))*T(14)*T(3)*T(16)+(1-params(2))*T(4)*T(30)+T(16)*(1-params(2))*T(14)*T(3)*T(16)+T(2)*(1-params(2))*(T(3)*T(16)*T(3)*T(16)*T(28)+T(14)*T(3)*T(30)));
v2(21,1)=6;
v2(21,2)=285;
v2(21,3)=(-(params(1)*y(17)));
v2(22,1)=6;
v2(22,2)=268;
v2(22,3)=v2(21,3);
v2(23,1)=6;
v2(23,2)=303;
v2(23,3)=(-(params(1)*y(16)));
v2(24,1)=6;
v2(24,2)=269;
v2(24,3)=v2(23,3);
v2(25,1)=6;
v2(25,2)=304;
v2(25,3)=(-(params(1)*y(15)));
v2(26,1)=6;
v2(26,2)=287;
v2(26,3)=v2(25,3);
v2(27,1)=7;
v2(27,2)=134;
v2(27,3)=(-(params(8)*exp(y(8))));
v2(28,1)=9;
v2(28,2)=241;
v2(28,3)=(-1);
v2(29,1)=9;
v2(29,2)=122;
v2(29,3)=v2(28,3);
v2(30,1)=11;
v2(30,2)=172;
v2(30,3)=(-((-y(11))*(y(10)+y(10))))/(y(10)*y(10)*y(10)*y(10));
v2(31,1)=11;
v2(31,2)=190;
v2(31,3)=(-1)/(y(10)*y(10));
v2(32,1)=11;
v2(32,2)=173;
v2(32,3)=v2(31,3);
v2(33,1)=11;
v2(33,2)=223;
v2(33,3)=1;
v2(34,1)=11;
v2(34,2)=121;
v2(34,3)=v2(33,3);
v2(35,1)=12;
v2(35,2)=241;
v2(35,3)=(-1);
v2(36,1)=12;
v2(36,2)=122;
v2(36,3)=v2(35,3);
g2 = sparse(v2(:,1),v2(:,2),v2(:,3),12,324);
end
