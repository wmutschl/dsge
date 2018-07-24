function [residual, g1, g2, g3] = Exercise_5Markus_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(13, 1);
T23 = params(2)*y(1)^params(3)+(1-params(2))*y(9)^params(3);
T42 = y(4)^params(6)*(1-y(9))^(1-params(6));
T45 = T42^(1-params(4));
T61 = params(2)+(1-params(2))*(y(9)/y(1))^params(3);
T63 = (1-params(3))/params(3);
T72 = 1+params(2)*(y(1)/y(9))^params(3)-params(2);
T104 = (1-y(9))^(1-params(6))*getPowerDeriv(y(4),params(6),1)*getPowerDeriv(T42,1-params(4),1);
T118 = getPowerDeriv(T23,1/params(3),1);
T125 = getPowerDeriv(y(9)/y(1),params(3),1);
T128 = getPowerDeriv(T61,T63,1);
T133 = getPowerDeriv(y(1)/y(9),params(3),1);
T153 = getPowerDeriv(T42,1-params(4),1)*y(4)^params(6)*(-(getPowerDeriv(1-y(9),1-params(6),1)));
lhs =y(3);
rhs =y(4)+y(5);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =T23^(1/params(3));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(10)*y(7);
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(5)+y(1)*(1-params(1));
residual(4)= lhs-rhs;
lhs =y(11);
rhs =T45/(1-params(4));
residual(5)= lhs-rhs;
lhs =y(12);
rhs =T45*(-(1-params(6)))/(1-y(9));
residual(6)= lhs-rhs;
lhs =y(13);
rhs =params(6)*T45/y(4);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =params(2)*T61^T63;
residual(8)= lhs-rhs;
lhs =y(15);
rhs =(1-params(2))*T72^T63;
residual(9)= lhs-rhs;
residual(10) = y(13)-params(5)*y(17)*(1+y(16)*y(18)-params(1));
residual(11) = (-y(12))/y(13)-y(7)*y(15);
lhs =y(7);
rhs =exp(y(8));
residual(12)= lhs-rhs;
lhs =y(8);
rhs =params(7)*y(2)+x(it_, 1);
residual(13)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(13, 19);

  %
  % Jacobian matrix
  %

  g1(1,3)=1;
  g1(1,4)=(-1);
  g1(1,5)=(-1);
  g1(2,1)=(-(params(2)*getPowerDeriv(y(1),params(3),1)*T118));
  g1(2,9)=(-(T118*(1-params(2))*getPowerDeriv(y(9),params(3),1)));
  g1(2,10)=1;
  g1(3,3)=1;
  g1(3,7)=(-y(10));
  g1(3,10)=(-y(7));
  g1(4,5)=(-1);
  g1(4,1)=(-(1-params(1)));
  g1(4,6)=1;
  g1(5,4)=(-(T104/(1-params(4))));
  g1(5,9)=(-(T153/(1-params(4))));
  g1(5,11)=1;
  g1(6,4)=(-((-(1-params(6)))*T104/(1-y(9))));
  g1(6,9)=(-(((1-y(9))*(-(1-params(6)))*T153-(-(T45*(-(1-params(6))))))/((1-y(9))*(1-y(9)))));
  g1(6,12)=1;
  g1(7,4)=(-((y(4)*params(6)*T104-params(6)*T45)/(y(4)*y(4))));
  g1(7,9)=(-(params(6)*T153/y(4)));
  g1(7,13)=1;
  g1(8,1)=(-(params(2)*(1-params(2))*(-y(9))/(y(1)*y(1))*T125*T128));
  g1(8,9)=(-(params(2)*T128*(1-params(2))*T125*1/y(1)));
  g1(8,14)=1;
  g1(9,1)=(-((1-params(2))*params(2)*1/y(9)*T133*getPowerDeriv(T72,T63,1)));
  g1(9,9)=(-((1-params(2))*getPowerDeriv(T72,T63,1)*params(2)*T133*(-y(1))/(y(9)*y(9))));
  g1(9,15)=1;
  g1(10,16)=(-(params(5)*y(17)*y(18)));
  g1(10,13)=1;
  g1(10,17)=(-(params(5)*(1+y(16)*y(18)-params(1))));
  g1(10,18)=(-(params(5)*y(17)*y(16)));
  g1(11,7)=(-y(15));
  g1(11,12)=(-1)/y(13);
  g1(11,13)=y(12)/(y(13)*y(13));
  g1(11,15)=(-y(7));
  g1(12,7)=1;
  g1(12,8)=(-exp(y(8)));
  g1(13,2)=(-params(7));
  g1(13,8)=1;
  g1(13,19)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,361);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,6859);
end
end
