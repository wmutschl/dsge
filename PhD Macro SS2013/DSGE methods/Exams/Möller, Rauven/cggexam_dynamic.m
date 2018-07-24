function [residual, g1, g2, g3] = cggexam_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
lhs =y(6);
rhs =params(2)*y(14)+params(3)*y(7);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =(-(y(8)-y(14)-y(9)))+y(15);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =params(6)*y(2)+(1-params(6))*(y(6)*params(5)+y(7)*params(4));
residual(3)= lhs-rhs;
lhs =y(9);
rhs =(-(1-params(7)))*y(10)+(1-params(8))/(1+params(1))*y(11)+x(it_, 3);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =y(10)+y(7)-y(1)-(y(11)-y(4))/(1+params(1));
residual(5)= lhs-rhs;
lhs =y(13);
rhs =x(it_, 3);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =params(7)*y(3)+x(it_, 1)+y(5);
residual(7)= lhs-rhs;
lhs =y(11);
rhs =params(8)*y(4)+x(it_, 2);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 18);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,14)=(-params(2));
  g1(1,7)=(-params(3));
  g1(2,14)=(-1);
  g1(2,7)=1;
  g1(2,15)=(-1);
  g1(2,8)=1;
  g1(2,9)=(-1);
  g1(3,6)=(-((1-params(6))*params(5)));
  g1(3,7)=(-((1-params(6))*params(4)));
  g1(3,2)=(-params(6));
  g1(3,8)=1;
  g1(4,9)=1;
  g1(4,10)=1-params(7);
  g1(4,11)=(-((1-params(8))/(1+params(1))));
  g1(4,18)=(-1);
  g1(5,1)=1;
  g1(5,7)=(-1);
  g1(5,10)=(-1);
  g1(5,4)=(-1)/(1+params(1));
  g1(5,11)=1/(1+params(1));
  g1(5,12)=1;
  g1(6,13)=1;
  g1(6,18)=(-1);
  g1(7,3)=(-params(7));
  g1(7,10)=1;
  g1(7,5)=(-1);
  g1(7,16)=(-1);
  g1(8,4)=(-params(8));
  g1(8,11)=1;
  g1(8,17)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,324);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,5832);
end
end
