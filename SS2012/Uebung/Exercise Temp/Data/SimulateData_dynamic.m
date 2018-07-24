function [residual, g1, g2, g3] = SimulateData_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(11, 1);
lhs =y(6);
rhs =y(17)+y(10)-y(19)-1/params(1)*(y(9)-y(18)-y(20));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =y(18)*params(14)+params(2)*(y(6)-y(10));
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(6)-y(10);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =params(5)*y(3)+y(8)*(1-params(5))*params(3)+(y(6)-y(10))*(1-params(5))*params(4)+params(11)/100*x(it_, 3);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =params(6)*y(4)+params(12)/100*x(it_, 2);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =params(7)*y(5)+params(13)/100*x(it_, 1);
residual(6)= lhs-rhs;
lhs =y(12);
rhs =params(10)+100*(y(11)+y(6)-y(1));
residual(7)= lhs-rhs;
lhs =y(13);
rhs =params(9)+y(8)*400;
residual(8)= lhs-rhs;
lhs =y(14);
rhs =params(9)+params(8)+params(10)*4+y(9)*400;
residual(9)= lhs-rhs;
lhs =y(15);
rhs =params(10)+100*y(11);
residual(10)= lhs-rhs;
lhs =y(16);
rhs =params(10)+100*(y(11)+y(7)-y(2));
residual(11)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(11, 23);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,17)=(-1);
  g1(1,18)=(-(1/params(1)));
  g1(1,9)=1/params(1);
  g1(1,10)=(-1);
  g1(1,19)=1;
  g1(1,20)=(-(1/params(1)));
  g1(2,6)=(-params(2));
  g1(2,8)=1;
  g1(2,18)=(-params(14));
  g1(2,10)=params(2);
  g1(3,6)=(-1);
  g1(3,7)=1;
  g1(3,10)=1;
  g1(4,6)=(-((1-params(5))*params(4)));
  g1(4,8)=(-((1-params(5))*params(3)));
  g1(4,3)=(-params(5));
  g1(4,9)=1;
  g1(4,10)=(1-params(5))*params(4);
  g1(4,23)=(-(params(11)/100));
  g1(5,4)=(-params(6));
  g1(5,10)=1;
  g1(5,22)=(-(params(12)/100));
  g1(6,5)=(-params(7));
  g1(6,11)=1;
  g1(6,21)=(-(params(13)/100));
  g1(7,1)=100;
  g1(7,6)=(-100);
  g1(7,11)=(-100);
  g1(7,12)=1;
  g1(8,8)=(-400);
  g1(8,13)=1;
  g1(9,9)=(-400);
  g1(9,14)=1;
  g1(10,11)=(-100);
  g1(10,15)=1;
  g1(11,2)=100;
  g1(11,7)=(-100);
  g1(11,11)=(-100);
  g1(11,16)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],11,529);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],11,12167);
end
end
