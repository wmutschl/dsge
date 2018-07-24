function [residual, g1, g2, g3] = Exercise_3c_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(6, 1);
T18 = 1/(1+params(1))*1/(y(9)*(1+params(6)));
T36 = y(1)/(1+params(6));
T41 = y(5)^(1-params(4));
T45 = T36^params(4);
T48 = y(5)^(-params(4));
T85 = 1/(1+params(6))*getPowerDeriv(T36,params(4),1);
lhs =1/y(3);
rhs =T18*(1+y(10)-params(2));
residual(1)= lhs-rhs;
lhs =y(5)^params(3);
rhs =y(6)/y(3);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =params(4)*y(8)*T36^(params(4)-1)*T41;
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(8)*(1-params(4))*T45*T48;
residual(4)= lhs-rhs;
lhs =y(3)+y(4);
rhs =T36*(1-params(2))+T41*y(8)*T45;
residual(5)= lhs-rhs;
lhs =log(y(8));
rhs =params(5)*log(y(2))+x(it_, 1);
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 11);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-1)/(y(3)*y(3));
  g1(1,9)=(-((1+y(10)-params(2))*1/(1+params(1))*(-(1+params(6)))/(y(9)*(1+params(6))*y(9)*(1+params(6)))));
  g1(1,10)=(-T18);
  g1(2,3)=(-((-y(6))/(y(3)*y(3))));
  g1(2,5)=getPowerDeriv(y(5),params(3),1);
  g1(2,6)=(-(1/y(3)));
  g1(3,1)=(-(T41*params(4)*y(8)*1/(1+params(6))*getPowerDeriv(T36,params(4)-1,1)));
  g1(3,5)=(-(params(4)*y(8)*T36^(params(4)-1)*getPowerDeriv(y(5),1-params(4),1)));
  g1(3,7)=1;
  g1(3,8)=(-(T41*params(4)*T36^(params(4)-1)));
  g1(4,1)=(-(T48*y(8)*(1-params(4))*T85));
  g1(4,5)=(-(y(8)*(1-params(4))*T45*getPowerDeriv(y(5),(-params(4)),1)));
  g1(4,6)=1;
  g1(4,8)=(-(T48*(1-params(4))*T45));
  g1(5,3)=1;
  g1(5,1)=(-((1-params(2))*1/(1+params(6))+T41*y(8)*T85));
  g1(5,4)=1;
  g1(5,5)=(-(y(8)*T45*getPowerDeriv(y(5),1-params(4),1)));
  g1(5,8)=(-(T41*T45));
  g1(6,2)=(-(params(5)*1/y(2)));
  g1(6,8)=1/y(8);
  g1(6,11)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,121);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1331);
end
end
