function [residual, g1, g2, g3] = Exercise_2c_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
T37 = y(7)^(1-params(4));
lhs =1/y(4);
rhs =params(1)*1/y(11)*(1+y(12)-params(3));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =y(4)*params(2)/(1-y(7));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(4)+y(6);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(10)*y(1)^params(4)*T37;
residual(4)= lhs-rhs;
lhs =y(8);
rhs =(1-params(4))*y(3)*(params(7)-1)/params(7)/y(7);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =params(4)*y(3)*(params(7)-1)/params(7)/y(1);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(5)-y(1)*(1-params(3));
residual(7)= lhs-rhs;
lhs =log(y(10));
rhs =params(5)*log(y(2))+x(it_, 1);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 13);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-1)/(y(4)*y(4));
  g1(1,11)=(-((1+y(12)-params(3))*params(1)*(-1)/(y(11)*y(11))));
  g1(1,12)=(-(params(1)*1/y(11)));
  g1(2,4)=(-(params(2)/(1-y(7))));
  g1(2,7)=(-(y(4)*params(2)/((1-y(7))*(1-y(7)))));
  g1(2,8)=1;
  g1(3,3)=1;
  g1(3,4)=(-1);
  g1(3,6)=(-1);
  g1(4,3)=1;
  g1(4,1)=(-(T37*y(10)*getPowerDeriv(y(1),params(4),1)));
  g1(4,7)=(-(y(10)*y(1)^params(4)*getPowerDeriv(y(7),1-params(4),1)));
  g1(4,10)=(-(y(1)^params(4)*T37));
  g1(5,3)=(-((1-params(4))*(params(7)-1)/params(7)/y(7)));
  g1(5,7)=(-((-((1-params(4))*y(3)*(params(7)-1)/params(7)))/(y(7)*y(7))));
  g1(5,8)=1;
  g1(6,3)=(-(params(4)*(params(7)-1)/params(7)/y(1)));
  g1(6,1)=(-((-(params(4)*y(3)*(params(7)-1)/params(7)))/(y(1)*y(1))));
  g1(6,9)=1;
  g1(7,1)=1-params(3);
  g1(7,5)=(-1);
  g1(7,6)=1;
  g1(8,2)=(-(params(5)*1/y(2)));
  g1(8,10)=1/y(10);
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
