function [residual, g1, g2, g3] = cggexamedited_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
lhs =y(7);
rhs =params(2)*y(15)+params(3)*y(8);
residual(1)= lhs-rhs;
lhs =y(8);
rhs =(-(y(9)-y(15)-y(10)))+y(16);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =(-(1-params(7)))*y(11)+x(it_, 2)+(1-params(8))/(1+params(1))*y(12);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(10)+params(6)*(y(2)-y(3))+(1-params(6))*(y(7)*params(5)+y(8)*params(4));
residual(4)= lhs-rhs;
lhs =y(13);
rhs =y(11)+y(8)-y(1)-y(4)-(y(12)-y(5))/(1+params(1));
residual(5)= lhs-rhs;
lhs =y(11);
rhs =params(7)*y(4)+x(it_, 1)+y(6);
residual(6)= lhs-rhs;
lhs =y(12);
rhs =params(8)*y(5)+params(10)*x(it_, 3);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =x(it_, 2);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 19);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,15)=(-params(2));
  g1(1,8)=(-params(3));
  g1(2,15)=(-1);
  g1(2,8)=1;
  g1(2,16)=(-1);
  g1(2,9)=1;
  g1(2,10)=(-1);
  g1(3,10)=1;
  g1(3,11)=1-params(7);
  g1(3,12)=(-((1-params(8))/(1+params(1))));
  g1(3,18)=(-1);
  g1(4,7)=(-((1-params(6))*params(5)));
  g1(4,8)=(-((1-params(6))*params(4)));
  g1(4,2)=(-params(6));
  g1(4,9)=1;
  g1(4,3)=params(6);
  g1(4,10)=(-1);
  g1(5,1)=1;
  g1(5,8)=(-1);
  g1(5,4)=1;
  g1(5,11)=(-1);
  g1(5,5)=(-1)/(1+params(1));
  g1(5,12)=1/(1+params(1));
  g1(5,13)=1;
  g1(6,4)=(-params(7));
  g1(6,11)=1;
  g1(6,17)=(-1);
  g1(6,6)=(-1);
  g1(7,5)=(-params(8));
  g1(7,12)=1;
  g1(7,19)=(-params(10));
  g1(8,18)=(-1);
  g1(8,14)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,361);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,6859);
end
end
