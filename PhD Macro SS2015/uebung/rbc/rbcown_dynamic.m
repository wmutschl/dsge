function [residual, g1, g2, g3] = rbcown_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(12, 1);
T28 = y(6)^params(2);
T31 = (1-y(5))^(1-params(2));
T35 = (T28*T31)^(-params(3));
T38 = y(6)^(params(2)-1);
T46 = (1-y(5))^(-params(2));
T77 = params(4)*y(1)^params(5)+(1-params(4))*y(5)^params(5);
T100 = getPowerDeriv(y(14)/y(1),1-params(5),1);
T105 = params(4)*getPowerDeriv(y(1),params(5),1);
T106 = getPowerDeriv(T77,1/params(5),1);
T112 = getPowerDeriv(y(14)/y(5),1-params(5),1);
T117 = (-(getPowerDeriv(1-y(5),1-params(2),1)));
T119 = getPowerDeriv(T28*T31,(-params(3)),1);
T130 = (-(getPowerDeriv(1-y(5),(-params(2)),1)));
T136 = (1-params(4))*getPowerDeriv(y(5),params(5),1);
T139 = getPowerDeriv(y(6),params(2),1);
T140 = T31*T139;
T143 = getPowerDeriv(y(6),params(2)-1,1);
T146 = T38*params(2)*T119*T140+params(2)*T35*T143;
T152 = (1-params(2))*T35*T139+T28*(1-params(2))*T119*T140;
T167 = 1/y(1);
T171 = 1/y(5);
T181 = getPowerDeriv(y(14)/y(1),1-params(5),2);
T182 = (-y(14))/(y(1)*y(1))*T181;
T203 = getPowerDeriv(y(14)/y(5),1-params(5),2);
T204 = (-y(14))/(y(5)*y(5))*T203;
T230 = T119*T28*getPowerDeriv(1-y(5),1-params(2),2)+T28*T117*T28*T117*getPowerDeriv(T28*T31,(-params(3)),2);
T240 = T140*T28*T117*getPowerDeriv(T28*T31,(-params(3)),2)+T119*T117*T139;
T254 = T140*T140*getPowerDeriv(T28*T31,(-params(3)),2)+T119*T31*getPowerDeriv(y(6),params(2),2);
T267 = T28*(1-params(2))*T28*T117*T119*T130;
T297 = getPowerDeriv(T77,1/params(5),2);
T298 = T105*T297;
lhs =y(12);
rhs =params(4)*(y(14)/y(1))^(1-params(5));
residual(1)= lhs-rhs;
lhs =y(13);
rhs =(1-params(4))*(y(14)/y(5))^(1-params(5));
residual(2)= lhs-rhs;
lhs =y(10);
rhs =T31*params(2)*T35*T38;
residual(3)= lhs-rhs;
lhs =y(11);
rhs =(-(T28*(1-params(2))*T35*T46));
residual(4)= lhs-rhs;
lhs =y(10);
rhs =params(1)*y(16)*(1+y(15)*y(17)-params(6));
residual(5)= lhs-rhs;
lhs =y(7);
rhs =params(8)*exp(y(8));
residual(6)= lhs-rhs;
lhs =y(8);
rhs =params(7)*y(2)+x(it_, 1);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =T77^(1/params(5));
residual(8)= lhs-rhs;
lhs =y(4);
rhs =y(14)*y(7);
residual(9)= lhs-rhs;
lhs =y(3);
rhs =y(9)+y(1)*(1-params(6));
residual(10)= lhs-rhs;
residual(11) = y(11)/y(10)+y(13)*y(7);
lhs =y(6)+y(3);
rhs =y(14)*y(7)+y(1)*(1-params(6));
residual(12)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(12, 18);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(4)*(-y(14))/(y(1)*y(1))*T100));
  g1(1,12)=1;
  g1(1,14)=(-(params(4)*T100*T167));
  g1(2,5)=(-((1-params(4))*(-y(14))/(y(5)*y(5))*T112));
  g1(2,13)=1;
  g1(2,14)=(-((1-params(4))*T112*T171));
  g1(3,5)=(-(params(2)*T35*T38*T117+T31*T38*params(2)*T28*T117*T119));
  g1(3,6)=(-(T31*T146));
  g1(3,10)=1;
  g1(4,5)=T46*T28*(1-params(2))*T28*T117*T119+T28*(1-params(2))*T35*T130;
  g1(4,6)=T46*T152;
  g1(4,11)=1;
  g1(5,15)=(-(params(1)*y(16)*y(17)));
  g1(5,10)=1;
  g1(5,16)=(-(params(1)*(1+y(15)*y(17)-params(6))));
  g1(5,17)=(-(params(1)*y(16)*y(15)));
  g1(6,7)=1;
  g1(6,8)=(-(params(8)*exp(y(8))));
  g1(7,2)=(-params(7));
  g1(7,8)=1;
  g1(7,18)=(-1);
  g1(8,1)=(-(T105*T106));
  g1(8,5)=(-(T106*T136));
  g1(8,14)=1;
  g1(9,4)=1;
  g1(9,7)=(-y(14));
  g1(9,14)=(-y(7));
  g1(10,1)=(-(1-params(6)));
  g1(10,3)=1;
  g1(10,9)=(-1);
  g1(11,7)=y(13);
  g1(11,10)=(-y(11))/(y(10)*y(10));
  g1(11,11)=1/y(10);
  g1(11,13)=y(7);
  g1(12,1)=(-(1-params(6)));
  g1(12,3)=1;
  g1(12,6)=1;
  g1(12,7)=(-y(14));
  g1(12,14)=(-y(7));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(36,3);
  v2(1,1)=1;
  v2(1,2)=1;
  v2(1,3)=(-(params(4)*(T100*(-((-y(14))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))+(-y(14))/(y(1)*y(1))*T182)));
  v2(2,1)=1;
  v2(2,2)=235;
  v2(2,3)=(-(params(4)*(T167*T182+T100*(-1)/(y(1)*y(1)))));
  v2(3,1)=1;
  v2(3,2)=14;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=248;
  v2(4,3)=(-(params(4)*T167*T167*T181));
  v2(5,1)=2;
  v2(5,2)=77;
  v2(5,3)=(-((1-params(4))*(T112*(-((-y(14))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+(-y(14))/(y(5)*y(5))*T204)));
  v2(6,1)=2;
  v2(6,2)=239;
  v2(6,3)=(-((1-params(4))*(T171*T204+T112*(-1)/(y(5)*y(5)))));
  v2(7,1)=2;
  v2(7,2)=86;
  v2(7,3)=  v2(6,3);
  v2(8,1)=2;
  v2(8,2)=248;
  v2(8,3)=(-((1-params(4))*T171*T171*T203));
  v2(9,1)=3;
  v2(9,2)=77;
  v2(9,3)=(-(T117*T38*params(2)*T28*T117*T119+params(2)*T35*T38*getPowerDeriv(1-y(5),1-params(2),2)+T117*T38*params(2)*T28*T117*T119+T31*T38*params(2)*T230));
  v2(10,1)=3;
  v2(10,2)=95;
  v2(10,3)=(-(T117*T146+T31*(T38*params(2)*T240+params(2)*T28*T117*T119*T143)));
  v2(11,1)=3;
  v2(11,2)=78;
  v2(11,3)=  v2(10,3);
  v2(12,1)=3;
  v2(12,2)=96;
  v2(12,3)=(-(T31*(params(2)*T119*T140*T143+T38*params(2)*T254+params(2)*T119*T140*T143+params(2)*T35*getPowerDeriv(y(6),params(2)-1,2))));
  v2(13,1)=4;
  v2(13,2)=77;
  v2(13,3)=T267+T46*T28*(1-params(2))*T230+T267+T28*(1-params(2))*T35*getPowerDeriv(1-y(5),(-params(2)),2);
  v2(14,1)=4;
  v2(14,2)=95;
  v2(14,3)=T130*T152+T46*((1-params(2))*T28*T117*T119*T139+T28*(1-params(2))*T240);
  v2(15,1)=4;
  v2(15,2)=78;
  v2(15,3)=  v2(14,3);
  v2(16,1)=4;
  v2(16,2)=96;
  v2(16,3)=T46*(T139*(1-params(2))*T119*T140+(1-params(2))*T35*getPowerDeriv(y(6),params(2),2)+T139*(1-params(2))*T119*T140+T28*(1-params(2))*T254);
  v2(17,1)=5;
  v2(17,2)=285;
  v2(17,3)=(-(params(1)*y(17)));
  v2(18,1)=5;
  v2(18,2)=268;
  v2(18,3)=  v2(17,3);
  v2(19,1)=5;
  v2(19,2)=303;
  v2(19,3)=(-(params(1)*y(16)));
  v2(20,1)=5;
  v2(20,2)=269;
  v2(20,3)=  v2(19,3);
  v2(21,1)=5;
  v2(21,2)=304;
  v2(21,3)=(-(params(1)*y(15)));
  v2(22,1)=5;
  v2(22,2)=287;
  v2(22,3)=  v2(21,3);
  v2(23,1)=6;
  v2(23,2)=134;
  v2(23,3)=(-(params(8)*exp(y(8))));
  v2(24,1)=8;
  v2(24,2)=1;
  v2(24,3)=(-(T106*params(4)*getPowerDeriv(y(1),params(5),2)+T105*T298));
  v2(25,1)=8;
  v2(25,2)=73;
  v2(25,3)=(-(T136*T298));
  v2(26,1)=8;
  v2(26,2)=5;
  v2(26,3)=  v2(25,3);
  v2(27,1)=8;
  v2(27,2)=77;
  v2(27,3)=(-(T136*T136*T297+T106*(1-params(4))*getPowerDeriv(y(5),params(5),2)));
  v2(28,1)=9;
  v2(28,2)=241;
  v2(28,3)=(-1);
  v2(29,1)=9;
  v2(29,2)=122;
  v2(29,3)=  v2(28,3);
  v2(30,1)=11;
  v2(30,2)=172;
  v2(30,3)=(-((-y(11))*(y(10)+y(10))))/(y(10)*y(10)*y(10)*y(10));
  v2(31,1)=11;
  v2(31,2)=190;
  v2(31,3)=(-1)/(y(10)*y(10));
  v2(32,1)=11;
  v2(32,2)=173;
  v2(32,3)=  v2(31,3);
  v2(33,1)=11;
  v2(33,2)=223;
  v2(33,3)=1;
  v2(34,1)=11;
  v2(34,2)=121;
  v2(34,3)=  v2(33,3);
  v2(35,1)=12;
  v2(35,2)=241;
  v2(35,3)=(-1);
  v2(36,1)=12;
  v2(36,2)=122;
  v2(36,3)=  v2(35,3);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),12,324);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,5832);
end
end
