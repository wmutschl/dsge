function [residual, g1, g2, g3] = Baxter_King_dynamic(y, x, params, steady_state, it_)
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
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(23, 1);
T50 = y(19)*y(14)^params(2);
T52 = y(3)^params(3);
T53 = T50*T52;
T55 = y(20)^(1-params(3));
T66 = y(19)/params(22);
T70 = y(6)/params(22);
T102 = y(17)/params(20);
T106 = y(5)/params(20);
T209 = 1/params(20);
T219 = 1/params(22);
T231 = getPowerDeriv(y(20),1-params(3),1);
lhs =(1-y(17))*y(16);
rhs =params(4)*y(8)/(1-y(20));
residual(1)= lhs-rhs;
lhs =y(12);
rhs =params(1)*y(30)*(1-params(5)+(1-y(32))*y(31));
residual(2)= lhs-rhs;
lhs =y(12);
rhs =1/y(8);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =(1-params(5))*y(3)+y(9);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =(1-params(5))*y(4)+y(11);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =T53*T55;
residual(6)= lhs-rhs;
lhs =y(16)*y(20);
rhs =y(7)*(1-params(3));
residual(7)= lhs-rhs;
lhs =y(3)*y(15);
rhs =y(7)*params(3);
residual(8)= lhs-rhs;
lhs =log(T66);
rhs =params(8)*log(T70)+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(11)+y(10)+y(18);
rhs =y(17)*(y(16)*y(20)+y(3)*y(15));
residual(10)= lhs-rhs;
lhs =y(10)-params(13);
rhs =params(6)*(y(1)-params(13))+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(11)-params(14);
rhs =params(7)*(y(2)-params(14))+x(it_, 3);
residual(12)= lhs-rhs;
lhs =log(T102);
rhs =params(9)*log(T106)+x(it_, 4);
residual(13)= lhs-rhs;
lhs =y(7);
rhs =y(11)+y(10)+y(8)+y(9);
residual(14)= lhs-rhs;
lhs =y(21);
rhs =100*(y(7)-params(10))/params(10);
residual(15)= lhs-rhs;
lhs =y(22);
rhs =100*(y(8)-params(11))/params(11);
residual(16)= lhs-rhs;
lhs =y(23);
rhs =100*(y(9)-params(12))/params(12);
residual(17)= lhs-rhs;
lhs =y(27);
rhs =100*(y(20)-params(23));
residual(18)= lhs-rhs;
lhs =y(24);
rhs =100*(y(16)-params(19))/params(19);
residual(19)= lhs-rhs;
lhs =y(28);
rhs =100*(y(15)-params(18));
residual(20)= lhs-rhs;
lhs =y(29);
rhs =100*(y(18)-params(21));
residual(21)= lhs-rhs;
lhs =y(25);
rhs =100*(y(10)/params(10)-params(13)/params(10));
residual(22)= lhs-rhs;
lhs =y(26);
rhs =100*(y(11)/params(10)-params(14)/params(10));
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 36);

  %
  % Jacobian matrix
  %

  g1(1,8)=(-(params(4)/(1-y(20))));
  g1(1,16)=1-y(17);
  g1(1,17)=(-y(16));
  g1(1,20)=(-(params(4)*y(8)/((1-y(20))*(1-y(20)))));
  g1(2,12)=1;
  g1(2,30)=(-(params(1)*(1-params(5)+(1-y(32))*y(31))));
  g1(2,31)=(-(params(1)*y(30)*(1-y(32))));
  g1(2,32)=(-(params(1)*y(30)*(-y(31))));
  g1(3,8)=(-((-1)/(y(8)*y(8))));
  g1(3,12)=1;
  g1(4,9)=(-1);
  g1(4,3)=(-(1-params(5)));
  g1(4,13)=1;
  g1(5,11)=(-1);
  g1(5,4)=(-(1-params(5)));
  g1(5,14)=1;
  g1(6,7)=1;
  g1(6,3)=(-(T55*T50*getPowerDeriv(y(3),params(3),1)));
  g1(6,14)=(-(T55*T52*y(19)*getPowerDeriv(y(14),params(2),1)));
  g1(6,19)=(-(T55*y(14)^params(2)*T52));
  g1(6,20)=(-(T53*T231));
  g1(7,7)=(-(1-params(3)));
  g1(7,16)=y(20);
  g1(7,20)=y(16);
  g1(8,7)=(-params(3));
  g1(8,3)=y(15);
  g1(8,15)=y(3);
  g1(9,6)=(-(params(8)*T219/T70));
  g1(9,19)=T219/T66;
  g1(9,33)=(-1);
  g1(10,10)=1;
  g1(10,11)=1;
  g1(10,3)=(-(y(17)*y(15)));
  g1(10,15)=(-(y(17)*y(3)));
  g1(10,16)=(-(y(17)*y(20)));
  g1(10,17)=(-(y(16)*y(20)+y(3)*y(15)));
  g1(10,18)=1;
  g1(10,20)=(-(y(17)*y(16)));
  g1(11,1)=(-params(6));
  g1(11,10)=1;
  g1(11,34)=(-1);
  g1(12,2)=(-params(7));
  g1(12,11)=1;
  g1(12,35)=(-1);
  g1(13,5)=(-(params(9)*T209/T106));
  g1(13,17)=T209/T102;
  g1(13,36)=(-1);
  g1(14,7)=1;
  g1(14,8)=(-1);
  g1(14,9)=(-1);
  g1(14,10)=(-1);
  g1(14,11)=(-1);
  g1(15,7)=(-(100/params(10)));
  g1(15,21)=1;
  g1(16,8)=(-(100/params(11)));
  g1(16,22)=1;
  g1(17,9)=(-(100/params(12)));
  g1(17,23)=1;
  g1(18,20)=(-100);
  g1(18,27)=1;
  g1(19,16)=(-(100/params(19)));
  g1(19,24)=1;
  g1(20,15)=(-100);
  g1(20,28)=1;
  g1(21,18)=(-100);
  g1(21,29)=1;
  g1(22,10)=(-(100*1/params(10)));
  g1(22,25)=1;
  g1(23,11)=(-(100*1/params(10)));
  g1(23,26)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(47,3);
  v2(1,1)=1;
  v2(1,2)=592;
  v2(1,3)=(-1);
  v2(2,1)=1;
  v2(2,2)=557;
  v2(2,3)=  v2(1,3);
  v2(3,1)=1;
  v2(3,2)=692;
  v2(3,3)=(-(params(4)/((1-y(20))*(1-y(20)))));
  v2(4,1)=1;
  v2(4,2)=272;
  v2(4,3)=  v2(3,3);
  v2(5,1)=1;
  v2(5,2)=704;
  v2(5,3)=(-((-(params(4)*y(8)*((-(1-y(20)))-(1-y(20)))))/((1-y(20))*(1-y(20))*(1-y(20))*(1-y(20)))));
  v2(6,1)=2;
  v2(6,2)=1110;
  v2(6,3)=(-(params(1)*(1-y(32))));
  v2(7,1)=2;
  v2(7,2)=1075;
  v2(7,3)=  v2(6,3);
  v2(8,1)=2;
  v2(8,2)=1146;
  v2(8,3)=(-(params(1)*(-y(31))));
  v2(9,1)=2;
  v2(9,2)=1076;
  v2(9,3)=  v2(8,3);
  v2(10,1)=2;
  v2(10,2)=1147;
  v2(10,3)=params(1)*y(30);
  v2(11,1)=2;
  v2(11,2)=1112;
  v2(11,3)=  v2(10,3);
  v2(12,1)=3;
  v2(12,2)=260;
  v2(12,3)=(-((y(8)+y(8))/(y(8)*y(8)*y(8)*y(8))));
  v2(13,1)=6;
  v2(13,2)=75;
  v2(13,3)=(-(T55*T50*getPowerDeriv(y(3),params(3),2)));
  v2(14,1)=6;
  v2(14,2)=471;
  v2(14,3)=(-(T55*getPowerDeriv(y(3),params(3),1)*y(19)*getPowerDeriv(y(14),params(2),1)));
  v2(15,1)=6;
  v2(15,2)=86;
  v2(15,3)=  v2(14,3);
  v2(16,1)=6;
  v2(16,2)=482;
  v2(16,3)=(-(T55*T52*y(19)*getPowerDeriv(y(14),params(2),2)));
  v2(17,1)=6;
  v2(17,2)=651;
  v2(17,3)=(-(T55*y(14)^params(2)*getPowerDeriv(y(3),params(3),1)));
  v2(18,1)=6;
  v2(18,2)=91;
  v2(18,3)=  v2(17,3);
  v2(19,1)=6;
  v2(19,2)=662;
  v2(19,3)=(-(T55*T52*getPowerDeriv(y(14),params(2),1)));
  v2(20,1)=6;
  v2(20,2)=487;
  v2(20,3)=  v2(19,3);
  v2(21,1)=6;
  v2(21,2)=687;
  v2(21,3)=(-(T50*getPowerDeriv(y(3),params(3),1)*T231));
  v2(22,1)=6;
  v2(22,2)=92;
  v2(22,3)=  v2(21,3);
  v2(23,1)=6;
  v2(23,2)=698;
  v2(23,3)=(-(T52*y(19)*getPowerDeriv(y(14),params(2),1)*T231));
  v2(24,1)=6;
  v2(24,2)=488;
  v2(24,3)=  v2(23,3);
  v2(25,1)=6;
  v2(25,2)=703;
  v2(25,3)=(-(y(14)^params(2)*T52*T231));
  v2(26,1)=6;
  v2(26,2)=668;
  v2(26,3)=  v2(25,3);
  v2(27,1)=6;
  v2(27,2)=704;
  v2(27,3)=(-(T53*getPowerDeriv(y(20),1-params(3),2)));
  v2(28,1)=7;
  v2(28,2)=700;
  v2(28,3)=1;
  v2(29,1)=7;
  v2(29,2)=560;
  v2(29,3)=  v2(28,3);
  v2(30,1)=8;
  v2(30,2)=507;
  v2(30,3)=1;
  v2(31,1)=8;
  v2(31,2)=87;
  v2(31,3)=  v2(30,3);
  v2(32,1)=9;
  v2(32,2)=186;
  v2(32,3)=(-(params(8)*(-(T219*T219))/(T70*T70)));
  v2(33,1)=9;
  v2(33,2)=667;
  v2(33,3)=(-(T219*T219))/(T66*T66);
  v2(34,1)=10;
  v2(34,2)=507;
  v2(34,3)=(-y(17));
  v2(35,1)=10;
  v2(35,2)=87;
  v2(35,3)=  v2(34,3);
  v2(36,1)=10;
  v2(36,2)=579;
  v2(36,3)=(-y(15));
  v2(37,1)=10;
  v2(37,2)=89;
  v2(37,3)=  v2(36,3);
  v2(38,1)=10;
  v2(38,2)=591;
  v2(38,3)=(-y(3));
  v2(39,1)=10;
  v2(39,2)=521;
  v2(39,3)=  v2(38,3);
  v2(40,1)=10;
  v2(40,2)=592;
  v2(40,3)=(-y(20));
  v2(41,1)=10;
  v2(41,2)=557;
  v2(41,3)=  v2(40,3);
  v2(42,1)=10;
  v2(42,2)=700;
  v2(42,3)=(-y(17));
  v2(43,1)=10;
  v2(43,2)=560;
  v2(43,3)=  v2(42,3);
  v2(44,1)=10;
  v2(44,2)=701;
  v2(44,3)=(-y(16));
  v2(45,1)=10;
  v2(45,2)=596;
  v2(45,3)=  v2(44,3);
  v2(46,1)=13;
  v2(46,2)=149;
  v2(46,3)=(-(params(9)*(-(T209*T209))/(T106*T106)));
  v2(47,1)=13;
  v2(47,2)=593;
  v2(47,3)=(-(T209*T209))/(T102*T102);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),23,1296);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,46656);
end
end
