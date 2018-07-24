function [residual, g1, g2, g3] = Exercise_2d_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
lhs =exp((-y(4)));
rhs =params(2)*exp(y(11))*(1+params(6)*exp(y(12)-params(3)));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =y(4)+params(7)/(1-params(7))*y(7);
residual(2)= lhs-rhs;
lhs =exp(y(3));
rhs =params(8)*exp(y(4))+(1-params(8))*exp(y(6));
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(10)+params(1)*y(1)+y(7)*(1-params(1));
residual(4)= lhs-rhs;
lhs =y(8);
rhs =y(3)-y(5);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =y(3)-y(1);
residual(6)= lhs-rhs;
lhs =params(3)*exp(y(6));
rhs =exp(y(5))-(1-params(3))*exp(y(1));
residual(7)= lhs-rhs;
lhs =y(10);
rhs =params(4)*y(2)+x(it_, 1);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 13);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-exp((-y(4))));
  g1(1,11)=(-(params(2)*exp(y(11))*(1+params(6)*exp(y(12)-params(3)))));
  g1(1,12)=(-(params(2)*exp(y(11))*params(6)*exp(y(12)-params(3))));
  g1(2,4)=(-1);
  g1(2,7)=(-(params(7)/(1-params(7))));
  g1(2,8)=1;
  g1(3,3)=exp(y(3));
  g1(3,4)=(-(params(8)*exp(y(4))));
  g1(3,6)=(-((1-params(8))*exp(y(6))));
  g1(4,3)=1;
  g1(4,1)=(-params(1));
  g1(4,7)=(-(1-params(1)));
  g1(4,10)=(-1);
  g1(5,3)=(-1);
  g1(5,5)=1;
  g1(5,8)=1;
  g1(6,3)=(-1);
  g1(6,1)=1;
  g1(6,9)=1;
  g1(7,1)=(1-params(3))*exp(y(1));
  g1(7,5)=(-exp(y(5)));
  g1(7,6)=params(3)*exp(y(6));
  g1(8,2)=(-params(4));
  g1(8,10)=1;
  g1(8,13)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,169);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,2197);
end
end
