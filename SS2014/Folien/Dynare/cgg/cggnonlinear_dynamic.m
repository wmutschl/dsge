function [residual, g1, g2, g3] = cggnonlinear_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           columns: equations in order of declaration
%                                                           rows: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(13, 1);
T17 = (1-params(1))*params(2)/(params(2)-1)*exp(y(6));
T21 = T17*y(8)^params(3);
T23 = T21*y(9);
T26 = T23/exp(y(7));
T49 = (1-params(5)*y(10)^(params(2)-1))/(1-params(5));
T52 = T49^(1/(1-params(2)));
T63 = (1-params(5))*T49^(params(2)/(params(2)-1))+params(5)*y(10)^params(2)/y(2);
T91 = y(15)^(1-params(10));
T92 = y(4)^params(10)*T91;
T95 = y(10)^((1-params(10))*params(11));
T101 = exp(y(17))^((1-params(10))*params(12));
T131 = exp(y(6)/(1+params(3)))*1/(1+params(3));
T143 = y(9)*T17*getPowerDeriv(y(8),params(3),1);
T145 = (-(T143/exp(y(7))));
T165 = (-(params(5)*getPowerDeriv(y(10),params(2)-1,1)))/(1-params(5));
T166 = getPowerDeriv(T49,1/(1-params(2)),1);
T170 = getPowerDeriv(T49,params(2)/(params(2)-1),1);
T176 = (1-params(5))*T165*T170+params(5)*getPowerDeriv(y(10),params(2),1)/y(2);
T177 = getPowerDeriv(T63,(-1),1);
T180 = getPowerDeriv(y(10),(1-params(10))*params(11),1);
T200 = (-(params(5)*y(10)^params(2)))/(y(2)*y(2));
T209 = y(4)^params(10)*getPowerDeriv(y(15),1-params(10),1);
T214 = T91*getPowerDeriv(y(4),params(10),1);
T221 = exp(y(17))*getPowerDeriv(exp(y(17)),(1-params(10))*params(12),1);
T261 = (-(params(5)*getPowerDeriv(y(10),params(2)-1,2)))/(1-params(5));
lhs =y(5);
rhs =T26+params(4)*params(5)*y(20)^params(2)*y(18);
residual(1)= lhs-rhs;
lhs =y(11);
rhs =1+params(4)*params(5)*y(20)^(params(2)-1)*y(21);
residual(2)= lhs-rhs;
lhs =y(5);
rhs =y(11)*T52;
residual(3)= lhs-rhs;
lhs =y(12);
rhs =T63^(-1);
residual(4)= lhs-rhs;
lhs =1/y(9);
rhs =params(4)*y(16)/(y(20)*y(19));
residual(5)= lhs-rhs;
lhs =y(9);
rhs =y(8)*exp(y(7))*y(12);
residual(6)= lhs-rhs;
lhs =y(14);
rhs =exp(y(7))*exp(y(6)/(1+params(3)));
residual(7)= lhs-rhs;
lhs =y(15);
rhs =y(19)*1/params(4)/y(9);
residual(8)= lhs-rhs;
lhs =y(16);
rhs =T92*T95*T101;
residual(9)= lhs-rhs;
lhs =y(17);
rhs =log(y(9))-log(y(14));
residual(10)= lhs-rhs;
lhs =y(13);
rhs =params(7)*y(3)+params(8)*x(it_, 1);
residual(11)= lhs-rhs;
lhs =y(7);
rhs =y(13)+y(3);
residual(12)= lhs-rhs;
lhs =y(6);
rhs =params(6)*y(1)+params(9)*x(it_, 2);
residual(13)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(13, 23);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,18)=(-(params(4)*params(5)*y(20)^params(2)));
  g1(1,6)=(-T26);
  g1(1,7)=(-((-(T23*exp(y(7))))/(exp(y(7))*exp(y(7)))));
  g1(1,8)=T145;
  g1(1,9)=(-(T21/exp(y(7))));
  g1(1,20)=(-(y(18)*params(4)*params(5)*getPowerDeriv(y(20),params(2),1)));
  g1(2,20)=(-(y(21)*params(4)*params(5)*getPowerDeriv(y(20),params(2)-1,1)));
  g1(2,11)=1;
  g1(2,21)=(-(params(4)*params(5)*y(20)^(params(2)-1)));
  g1(3,5)=1;
  g1(3,10)=(-(y(11)*T165*T166));
  g1(3,11)=(-T52);
  g1(4,10)=(-(T176*T177));
  g1(4,2)=(-(T177*T200));
  g1(4,12)=1;
  g1(5,9)=(-1)/(y(9)*y(9));
  g1(5,19)=(-((-(y(20)*params(4)*y(16)))/(y(20)*y(19)*y(20)*y(19))));
  g1(5,20)=(-((-(params(4)*y(16)*y(19)))/(y(20)*y(19)*y(20)*y(19))));
  g1(5,16)=(-(params(4)/(y(20)*y(19))));
  g1(6,7)=(-(y(8)*exp(y(7))*y(12)));
  g1(6,8)=(-(exp(y(7))*y(12)));
  g1(6,9)=1;
  g1(6,12)=(-(y(8)*exp(y(7))));
  g1(7,6)=(-(exp(y(7))*T131));
  g1(7,7)=(-(exp(y(7))*exp(y(6)/(1+params(3)))));
  g1(7,14)=1;
  g1(8,9)=(-((-(y(19)*1/params(4)))/(y(9)*y(9))));
  g1(8,19)=(-(1/params(4)/y(9)));
  g1(8,15)=1;
  g1(9,10)=(-(T101*T92*T180));
  g1(9,15)=(-(T101*T95*T209));
  g1(9,4)=(-(T101*T95*T214));
  g1(9,16)=1;
  g1(9,17)=(-(T92*T95*T221));
  g1(10,9)=(-(1/y(9)));
  g1(10,14)=1/y(14);
  g1(10,17)=1;
  g1(11,3)=(-params(7));
  g1(11,13)=1;
  g1(11,22)=(-params(8));
  g1(12,7)=1;
  g1(12,3)=(-1);
  g1(12,13)=(-1);
  g1(13,1)=(-params(6));
  g1(13,6)=1;
  g1(13,23)=(-params(9));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(69,3);
  v2(1,1)=1;
  v2(1,2)=121;
  v2(1,3)=(-T26);
  v2(2,1)=1;
  v2(2,2)=144;
  v2(2,3)=(-((-(T23*exp(y(7))))/(exp(y(7))*exp(y(7)))));
  v2(3,1)=1;
  v2(3,2)=122;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=145;
  v2(4,3)=(-(((-(T23*exp(y(7))))*exp(y(7))*exp(y(7))-(-(T23*exp(y(7))))*(exp(y(7))*exp(y(7))+exp(y(7))*exp(y(7))))/(exp(y(7))*exp(y(7))*exp(y(7))*exp(y(7)))));
  v2(5,1)=1;
  v2(5,2)=167;
  v2(5,3)=T145;
  v2(6,1)=1;
  v2(6,2)=123;
  v2(6,3)=  v2(5,3);
  v2(7,1)=1;
  v2(7,2)=168;
  v2(7,3)=(-((-(exp(y(7))*T143))/(exp(y(7))*exp(y(7)))));
  v2(8,1)=1;
  v2(8,2)=146;
  v2(8,3)=  v2(7,3);
  v2(9,1)=1;
  v2(9,2)=169;
  v2(9,3)=(-(y(9)*T17*getPowerDeriv(y(8),params(3),2)/exp(y(7))));
  v2(10,1)=1;
  v2(10,2)=190;
  v2(10,3)=(-(T21/exp(y(7))));
  v2(11,1)=1;
  v2(11,2)=124;
  v2(11,3)=  v2(10,3);
  v2(12,1)=1;
  v2(12,2)=191;
  v2(12,3)=(-((-(T21*exp(y(7))))/(exp(y(7))*exp(y(7)))));
  v2(13,1)=1;
  v2(13,2)=147;
  v2(13,3)=  v2(12,3);
  v2(14,1)=1;
  v2(14,2)=192;
  v2(14,3)=(-(T17*getPowerDeriv(y(8),params(3),1)/exp(y(7))));
  v2(15,1)=1;
  v2(15,2)=170;
  v2(15,3)=  v2(14,3);
  v2(16,1)=1;
  v2(16,2)=455;
  v2(16,3)=(-(params(4)*params(5)*getPowerDeriv(y(20),params(2),1)));
  v2(17,1)=1;
  v2(17,2)=411;
  v2(17,3)=  v2(16,3);
  v2(18,1)=1;
  v2(18,2)=457;
  v2(18,3)=(-(y(18)*params(4)*params(5)*getPowerDeriv(y(20),params(2),2)));
  v2(19,1)=2;
  v2(19,2)=457;
  v2(19,3)=(-(y(21)*params(4)*params(5)*getPowerDeriv(y(20),params(2)-1,2)));
  v2(20,1)=2;
  v2(20,2)=480;
  v2(20,3)=(-(params(4)*params(5)*getPowerDeriv(y(20),params(2)-1,1)));
  v2(21,1)=2;
  v2(21,2)=458;
  v2(21,3)=  v2(20,3);
  v2(22,1)=3;
  v2(22,2)=217;
  v2(22,3)=(-(y(11)*(T166*T261+T165*T165*getPowerDeriv(T49,1/(1-params(2)),2))));
  v2(23,1)=3;
  v2(23,2)=240;
  v2(23,3)=(-(T165*T166));
  v2(24,1)=3;
  v2(24,2)=218;
  v2(24,3)=  v2(23,3);
  v2(25,1)=4;
  v2(25,2)=217;
  v2(25,3)=(-(T177*((1-params(5))*(T170*T261+T165*T165*getPowerDeriv(T49,params(2)/(params(2)-1),2))+params(5)*getPowerDeriv(y(10),params(2),2)/y(2))+T176*T176*getPowerDeriv(T63,(-1),2)));
  v2(26,1)=4;
  v2(26,2)=33;
  v2(26,3)=(-(T200*T176*getPowerDeriv(T63,(-1),2)+T177*(-(params(5)*getPowerDeriv(y(10),params(2),1)))/(y(2)*y(2))));
  v2(27,1)=4;
  v2(27,2)=209;
  v2(27,3)=  v2(26,3);
  v2(28,1)=4;
  v2(28,2)=25;
  v2(28,3)=(-(T200*T200*getPowerDeriv(T63,(-1),2)+T177*(-((-(params(5)*y(10)^params(2)))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2))));
  v2(29,1)=5;
  v2(29,2)=193;
  v2(29,3)=(y(9)+y(9))/(y(9)*y(9)*y(9)*y(9));
  v2(30,1)=5;
  v2(30,2)=433;
  v2(30,3)=(-((-((-(y(20)*params(4)*y(16)))*(y(20)*y(20)*y(19)+y(20)*y(20)*y(19))))/(y(20)*y(19)*y(20)*y(19)*y(20)*y(19)*y(20)*y(19))));
  v2(31,1)=5;
  v2(31,2)=456;
  v2(31,3)=(-((y(20)*y(19)*y(20)*y(19)*(-(params(4)*y(16)))-(-(params(4)*y(16)*y(19)))*(y(20)*y(20)*y(19)+y(20)*y(20)*y(19)))/(y(20)*y(19)*y(20)*y(19)*y(20)*y(19)*y(20)*y(19))));
  v2(32,1)=5;
  v2(32,2)=434;
  v2(32,3)=  v2(31,3);
  v2(33,1)=5;
  v2(33,2)=457;
  v2(33,3)=(-((-((-(params(4)*y(16)*y(19)))*(y(19)*y(20)*y(19)+y(19)*y(20)*y(19))))/(y(20)*y(19)*y(20)*y(19)*y(20)*y(19)*y(20)*y(19))));
  v2(34,1)=5;
  v2(34,2)=364;
  v2(34,3)=(-((-(params(4)*y(20)))/(y(20)*y(19)*y(20)*y(19))));
  v2(35,1)=5;
  v2(35,2)=430;
  v2(35,3)=  v2(34,3);
  v2(36,1)=5;
  v2(36,2)=365;
  v2(36,3)=(-((-(params(4)*y(19)))/(y(20)*y(19)*y(20)*y(19))));
  v2(37,1)=5;
  v2(37,2)=453;
  v2(37,3)=  v2(36,3);
  v2(38,1)=6;
  v2(38,2)=145;
  v2(38,3)=(-(y(8)*exp(y(7))*y(12)));
  v2(39,1)=6;
  v2(39,2)=168;
  v2(39,3)=(-(exp(y(7))*y(12)));
  v2(40,1)=6;
  v2(40,2)=146;
  v2(40,3)=  v2(39,3);
  v2(41,1)=6;
  v2(41,2)=260;
  v2(41,3)=(-(y(8)*exp(y(7))));
  v2(42,1)=6;
  v2(42,2)=150;
  v2(42,3)=  v2(41,3);
  v2(43,1)=6;
  v2(43,2)=261;
  v2(43,3)=(-exp(y(7)));
  v2(44,1)=6;
  v2(44,2)=173;
  v2(44,3)=  v2(43,3);
  v2(45,1)=7;
  v2(45,2)=121;
  v2(45,3)=(-(exp(y(7))*1/(1+params(3))*T131));
  v2(46,1)=7;
  v2(46,2)=144;
  v2(46,3)=(-(exp(y(7))*T131));
  v2(47,1)=7;
  v2(47,2)=122;
  v2(47,3)=  v2(46,3);
  v2(48,1)=7;
  v2(48,2)=145;
  v2(48,3)=(-(exp(y(7))*exp(y(6)/(1+params(3)))));
  v2(49,1)=8;
  v2(49,2)=193;
  v2(49,3)=(-((-((-(y(19)*1/params(4)))*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9))));
  v2(50,1)=8;
  v2(50,2)=423;
  v2(50,3)=(-((-(1/params(4)))/(y(9)*y(9))));
  v2(51,1)=8;
  v2(51,2)=203;
  v2(51,3)=  v2(50,3);
  v2(52,1)=9;
  v2(52,2)=217;
  v2(52,3)=(-(T101*T92*getPowerDeriv(y(10),(1-params(10))*params(11),2)));
  v2(53,1)=9;
  v2(53,2)=332;
  v2(53,3)=(-(T101*T180*T209));
  v2(54,1)=9;
  v2(54,2)=222;
  v2(54,3)=  v2(53,3);
  v2(55,1)=9;
  v2(55,2)=337;
  v2(55,3)=(-(T101*T95*y(4)^params(10)*getPowerDeriv(y(15),1-params(10),2)));
  v2(56,1)=9;
  v2(56,2)=79;
  v2(56,3)=(-(T101*T180*T214));
  v2(57,1)=9;
  v2(57,2)=211;
  v2(57,3)=  v2(56,3);
  v2(58,1)=9;
  v2(58,2)=84;
  v2(58,3)=(-(T101*T95*getPowerDeriv(y(15),1-params(10),1)*getPowerDeriv(y(4),params(10),1)));
  v2(59,1)=9;
  v2(59,2)=326;
  v2(59,3)=  v2(58,3);
  v2(60,1)=9;
  v2(60,2)=73;
  v2(60,3)=(-(T101*T95*T91*getPowerDeriv(y(4),params(10),2)));
  v2(61,1)=9;
  v2(61,2)=378;
  v2(61,3)=(-(T92*T180*T221));
  v2(62,1)=9;
  v2(62,2)=224;
  v2(62,3)=  v2(61,3);
  v2(63,1)=9;
  v2(63,2)=383;
  v2(63,3)=(-(T95*T209*T221));
  v2(64,1)=9;
  v2(64,2)=339;
  v2(64,3)=  v2(63,3);
  v2(65,1)=9;
  v2(65,2)=372;
  v2(65,3)=(-(T95*T214*T221));
  v2(66,1)=9;
  v2(66,2)=86;
  v2(66,3)=  v2(65,3);
  v2(67,1)=9;
  v2(67,2)=385;
  v2(67,3)=(-(T92*T95*(T221+exp(y(17))*exp(y(17))*getPowerDeriv(exp(y(17)),(1-params(10))*params(12),2))));
  v2(68,1)=10;
  v2(68,2)=193;
  v2(68,3)=(-((-1)/(y(9)*y(9))));
  v2(69,1)=10;
  v2(69,2)=313;
  v2(69,3)=(-1)/(y(14)*y(14));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),13,529);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,12167);
end
end
