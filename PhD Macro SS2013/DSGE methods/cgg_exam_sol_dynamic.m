function [residual, g1, g2, g3] = cgg_exam_sol_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
lhs =y(5);
rhs =params(2)*y(13)+params(3)*y(6);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =(-(y(7)-y(13)-y(8)))+y(14);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =params(6)*y(2)+(1-params(6))*(y(5)*params(5)+y(6)*params(4));
residual(3)= lhs-rhs;
lhs =y(8);
rhs =y(15)-(y(16)-y(10))/(1+params(1));
residual(4)= lhs-rhs;
lhs =y(11);
rhs =y(6)-y(1)+y(9)-(y(10)-y(3))/(1+params(1));
residual(5)= lhs-rhs;
lhs =y(12);
rhs =params(7)*y(4)+params(9)*x(it_, 1);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(12)-y(4);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(3)*params(8)+params(10)*x(it_, 2);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 18);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,13)=(-params(2));
  g1(1,6)=(-params(3));
  g1(2,13)=(-1);
  g1(2,6)=1;
  g1(2,14)=(-1);
  g1(2,7)=1;
  g1(2,8)=(-1);
  g1(3,5)=(-((1-params(6))*params(5)));
  g1(3,6)=(-((1-params(6))*params(4)));
  g1(3,2)=(-params(6));
  g1(3,7)=1;
  g1(4,8)=1;
  g1(4,15)=(-1);
  g1(4,10)=(-1)/(1+params(1));
  g1(4,16)=1/(1+params(1));
  g1(5,1)=1;
  g1(5,6)=(-1);
  g1(5,9)=(-1);
  g1(5,3)=(-1)/(1+params(1));
  g1(5,10)=1/(1+params(1));
  g1(5,11)=1;
  g1(6,4)=(-params(7));
  g1(6,12)=1;
  g1(6,17)=(-params(9));
  g1(7,9)=1;
  g1(7,4)=1;
  g1(7,12)=(-1);
  g1(8,3)=(-params(8));
  g1(8,10)=1;
  g1(8,18)=(-params(10));
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
