function [residual, g1, g2, g3] = Pset3_1_chrismalnewvalues2_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(22, 1);
T22 = 1/y(29);
T63 = y(18)*y(2)^params(3);
T64 = y(1)^params(4);
T65 = T63*T64;
T66 = y(11)^(1-params(4));
T93 = y(19)/(steady_state(13));
T96 = y(6)/(steady_state(13));
T103 = y(18)/(steady_state(12));
T106 = y(5)/(steady_state(12));
T204 = getPowerDeriv(y(11),1-params(4),1);
T225 = 1/(steady_state(12));
T233 = 1/(steady_state(13));
lhs =(1-y(19))*y(15);
rhs =params(6)*y(8)/(1-y(11));
residual(1)= lhs-rhs;
lhs =1/y(8);
rhs =params(1)*T22*(1-params(2)+(1-y(31))*y(30));
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(8)+y(13)+y(14)+y(12);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(13)+(1-params(2))*y(1);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(12)+(1-params(2))*y(2);
residual(5)= lhs-rhs;
lhs =y(15)*y(11);
rhs =y(7)*(1-params(4));
residual(6)= lhs-rhs;
lhs =y(1)*y(16);
rhs =y(7)*params(4);
residual(7)= lhs-rhs;
lhs =y(7);
rhs =T65*T66;
residual(8)= lhs-rhs;
lhs =y(14)+y(12)+y(17);
rhs =y(19)*(y(15)*y(11)+y(1)*y(16));
residual(9)= lhs-rhs;
lhs =y(14)-(steady_state(8));
rhs =params(5)*(y(4)-(steady_state(8)))+x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(12)-(steady_state(6));
rhs =params(5)*(y(3)-(steady_state(6)))+x(it_, 3);
residual(11)= lhs-rhs;
lhs =log(T93);
rhs =params(5)*log(T96)+x(it_, 4);
residual(12)= lhs-rhs;
lhs =log(T103);
rhs =params(5)*log(T106)+x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(20);
rhs =100*(y(7)-(steady_state(1)))/(steady_state(1));
residual(14)= lhs-rhs;
lhs =y(21);
rhs =100*(y(8)-(steady_state(2)))/(steady_state(2));
residual(15)= lhs-rhs;
lhs =y(22);
rhs =100*(y(13)-(steady_state(7)))/(steady_state(7));
residual(16)= lhs-rhs;
lhs =y(23);
rhs =100*(y(11)-(steady_state(5)));
residual(17)= lhs-rhs;
lhs =y(24);
rhs =100*(y(15)-(steady_state(9)))/(steady_state(9));
residual(18)= lhs-rhs;
lhs =y(25);
rhs =100*(y(16)-(steady_state(10)));
residual(19)= lhs-rhs;
lhs =y(26);
rhs =100*(y(17)-(steady_state(11)));
residual(20)= lhs-rhs;
lhs =y(27);
rhs =100*(y(14)/y(7)-(steady_state(8))/(steady_state(1)));
residual(21)= lhs-rhs;
lhs =y(28);
rhs =100*(y(12)/y(7)-(steady_state(6))/(steady_state(1)));
residual(22)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(22, 35);

  %
  % Jacobian matrix
  %

  g1(1,8)=(-(params(6)/(1-y(11))));
  g1(1,11)=(-(params(6)*y(8)/((1-y(11))*(1-y(11)))));
  g1(1,15)=1-y(19);
  g1(1,19)=(-y(15));
  g1(2,8)=(-1)/(y(8)*y(8));
  g1(2,29)=(-(params(1)*(1-params(2)+(1-y(31))*y(30))*(-1)/(y(29)*y(29))));
  g1(2,30)=(-(params(1)*T22*(1-y(31))));
  g1(2,31)=(-(params(1)*T22*(-y(30))));
  g1(3,7)=1;
  g1(3,8)=(-1);
  g1(3,12)=(-1);
  g1(3,13)=(-1);
  g1(3,14)=(-1);
  g1(4,1)=(-(1-params(2)));
  g1(4,9)=1;
  g1(4,13)=(-1);
  g1(5,2)=(-(1-params(2)));
  g1(5,10)=1;
  g1(5,12)=(-1);
  g1(6,7)=(-(1-params(4)));
  g1(6,11)=y(15);
  g1(6,15)=y(11);
  g1(7,7)=(-params(4));
  g1(7,1)=y(16);
  g1(7,16)=y(1);
  g1(8,7)=1;
  g1(8,1)=(-(T66*T63*getPowerDeriv(y(1),params(4),1)));
  g1(8,2)=(-(T66*T64*y(18)*getPowerDeriv(y(2),params(3),1)));
  g1(8,11)=(-(T65*T204));
  g1(8,18)=(-(T66*y(2)^params(3)*T64));
  g1(9,1)=(-(y(19)*y(16)));
  g1(9,11)=(-(y(19)*y(15)));
  g1(9,12)=1;
  g1(9,14)=1;
  g1(9,15)=(-(y(19)*y(11)));
  g1(9,16)=(-(y(19)*y(1)));
  g1(9,17)=1;
  g1(9,19)=(-(y(15)*y(11)+y(1)*y(16)));
  g1(10,4)=(-params(5));
  g1(10,14)=1;
  g1(10,33)=(-1);
  g1(11,3)=(-params(5));
  g1(11,12)=1;
  g1(11,34)=(-1);
  g1(12,6)=(-(params(5)*T233/T96));
  g1(12,19)=T233/T93;
  g1(12,35)=(-1);
  g1(13,5)=(-(params(5)*T225/T106));
  g1(13,18)=T225/T103;
  g1(13,32)=(-1);
  g1(14,7)=(-(100/(steady_state(1))));
  g1(14,20)=1;
  g1(15,8)=(-(100/(steady_state(2))));
  g1(15,21)=1;
  g1(16,13)=(-(100/(steady_state(7))));
  g1(16,22)=1;
  g1(17,11)=(-100);
  g1(17,23)=1;
  g1(18,15)=(-(100/(steady_state(9))));
  g1(18,24)=1;
  g1(19,16)=(-100);
  g1(19,25)=1;
  g1(20,17)=(-100);
  g1(20,26)=1;
  g1(21,7)=(-(100*(-y(14))/(y(7)*y(7))));
  g1(21,14)=(-(100*1/y(7)));
  g1(21,27)=1;
  g1(22,7)=(-(100*(-y(12))/(y(7)*y(7))));
  g1(22,12)=(-(100*1/y(7)));
  g1(22,28)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(54,3);
  v2(1,1)=1;
  v2(1,2)=358;
  v2(1,3)=(-(params(6)/((1-y(11))*(1-y(11)))));
  v2(2,1)=1;
  v2(2,2)=256;
  v2(2,3)=  v2(1,3);
  v2(3,1)=1;
  v2(3,2)=361;
  v2(3,3)=(-((-(params(6)*y(8)*((-(1-y(11)))-(1-y(11)))))/((1-y(11))*(1-y(11))*(1-y(11))*(1-y(11)))));
  v2(4,1)=1;
  v2(4,2)=645;
  v2(4,3)=(-1);
  v2(5,1)=1;
  v2(5,2)=509;
  v2(5,3)=  v2(4,3);
  v2(6,1)=2;
  v2(6,2)=253;
  v2(6,3)=(y(8)+y(8))/(y(8)*y(8)*y(8)*y(8));
  v2(7,1)=2;
  v2(7,2)=1009;
  v2(7,3)=(-(params(1)*(1-params(2)+(1-y(31))*y(30))*(y(29)+y(29))/(y(29)*y(29)*y(29)*y(29))));
  v2(8,1)=2;
  v2(8,2)=1044;
  v2(8,3)=(-(params(1)*(1-y(31))*(-1)/(y(29)*y(29))));
  v2(9,1)=2;
  v2(9,2)=1010;
  v2(9,3)=  v2(8,3);
  v2(10,1)=2;
  v2(10,2)=1079;
  v2(10,3)=(-(params(1)*(-1)/(y(29)*y(29))*(-y(30))));
  v2(11,1)=2;
  v2(11,2)=1011;
  v2(11,3)=  v2(10,3);
  v2(12,1)=2;
  v2(12,2)=1080;
  v2(12,3)=(-(params(1)*(-T22)));
  v2(13,1)=2;
  v2(13,2)=1046;
  v2(13,3)=  v2(12,3);
  v2(14,1)=6;
  v2(14,2)=501;
  v2(14,3)=1;
  v2(15,1)=6;
  v2(15,2)=365;
  v2(15,3)=  v2(14,3);
  v2(16,1)=7;
  v2(16,2)=526;
  v2(16,3)=1;
  v2(17,1)=7;
  v2(17,2)=16;
  v2(17,3)=  v2(16,3);
  v2(18,1)=8;
  v2(18,2)=1;
  v2(18,3)=(-(T66*T63*getPowerDeriv(y(1),params(4),2)));
  v2(19,1)=8;
  v2(19,2)=36;
  v2(19,3)=(-(T66*getPowerDeriv(y(1),params(4),1)*y(18)*getPowerDeriv(y(2),params(3),1)));
  v2(20,1)=8;
  v2(20,2)=2;
  v2(20,3)=  v2(19,3);
  v2(21,1)=8;
  v2(21,2)=37;
  v2(21,3)=(-(T66*T64*y(18)*getPowerDeriv(y(2),params(3),2)));
  v2(22,1)=8;
  v2(22,2)=351;
  v2(22,3)=(-(T63*getPowerDeriv(y(1),params(4),1)*T204));
  v2(23,1)=8;
  v2(23,2)=11;
  v2(23,3)=  v2(22,3);
  v2(24,1)=8;
  v2(24,2)=352;
  v2(24,3)=(-(T64*y(18)*getPowerDeriv(y(2),params(3),1)*T204));
  v2(25,1)=8;
  v2(25,2)=46;
  v2(25,3)=  v2(24,3);
  v2(26,1)=8;
  v2(26,2)=361;
  v2(26,3)=(-(T65*getPowerDeriv(y(11),1-params(4),2)));
  v2(27,1)=8;
  v2(27,2)=596;
  v2(27,3)=(-(T66*y(2)^params(3)*getPowerDeriv(y(1),params(4),1)));
  v2(28,1)=8;
  v2(28,2)=18;
  v2(28,3)=  v2(27,3);
  v2(29,1)=8;
  v2(29,2)=597;
  v2(29,3)=(-(T66*T64*getPowerDeriv(y(2),params(3),1)));
  v2(30,1)=8;
  v2(30,2)=53;
  v2(30,3)=  v2(29,3);
  v2(31,1)=8;
  v2(31,2)=606;
  v2(31,3)=(-(T204*y(2)^params(3)*T64));
  v2(32,1)=8;
  v2(32,2)=368;
  v2(32,3)=  v2(31,3);
  v2(33,1)=9;
  v2(33,2)=501;
  v2(33,3)=(-y(19));
  v2(34,1)=9;
  v2(34,2)=365;
  v2(34,3)=  v2(33,3);
  v2(35,1)=9;
  v2(35,2)=526;
  v2(35,3)=(-y(19));
  v2(36,1)=9;
  v2(36,2)=16;
  v2(36,3)=  v2(35,3);
  v2(37,1)=9;
  v2(37,2)=631;
  v2(37,3)=(-y(16));
  v2(38,1)=9;
  v2(38,2)=19;
  v2(38,3)=  v2(37,3);
  v2(39,1)=9;
  v2(39,2)=641;
  v2(39,3)=(-y(15));
  v2(40,1)=9;
  v2(40,2)=369;
  v2(40,3)=  v2(39,3);
  v2(41,1)=9;
  v2(41,2)=645;
  v2(41,3)=(-y(11));
  v2(42,1)=9;
  v2(42,2)=509;
  v2(42,3)=  v2(41,3);
  v2(43,1)=9;
  v2(43,2)=646;
  v2(43,3)=(-y(1));
  v2(44,1)=9;
  v2(44,2)=544;
  v2(44,3)=  v2(43,3);
  v2(45,1)=12;
  v2(45,2)=181;
  v2(45,3)=(-(params(5)*(-(T233*T233))/(T96*T96)));
  v2(46,1)=12;
  v2(46,2)=649;
  v2(46,3)=(-(T233*T233))/(T93*T93);
  v2(47,1)=13;
  v2(47,2)=145;
  v2(47,3)=(-(params(5)*(-(T225*T225))/(T106*T106)));
  v2(48,1)=13;
  v2(48,2)=613;
  v2(48,3)=(-(T225*T225))/(T103*T103);
  v2(49,1)=21;
  v2(49,2)=217;
  v2(49,3)=(-(100*(-((-y(14))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))));
  v2(50,1)=21;
  v2(50,2)=462;
  v2(50,3)=(-(100*(-1)/(y(7)*y(7))));
  v2(51,1)=21;
  v2(51,2)=224;
  v2(51,3)=  v2(50,3);
  v2(52,1)=22;
  v2(52,2)=217;
  v2(52,3)=(-(100*(-((-y(12))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))));
  v2(53,1)=22;
  v2(53,2)=392;
  v2(53,3)=(-(100*(-1)/(y(7)*y(7))));
  v2(54,1)=22;
  v2(54,2)=222;
  v2(54,3)=  v2(53,3);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),22,1225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],22,42875);
end
end
