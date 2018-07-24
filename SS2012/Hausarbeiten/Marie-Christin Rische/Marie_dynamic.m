function [residual, g1, g2, g3] = Marie_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(6, 1);
T27 = params(3)/params(1);
lhs =y(4);
rhs =y(9)+params(2)*y(8)+(1-params(2))*y(7);
residual(1)= lhs-rhs;
lhs =y(9);
rhs =params(5)*y(3)+x(it_, 1);
residual(2)= lhs-rhs;
lhs =y(4)*(T27-1+params(4));
rhs =(T27-1+params(4)-params(2)*(params(4)+params(3)-1))*y(5)+params(2)*(params(4)+params(3)-1)*y(6);
residual(3)= lhs-rhs;
lhs =y(8)*params(3);
rhs =(1-params(4))*y(2)+(params(4)+params(3)-1)*y(1);
residual(4)= lhs-rhs;
lhs =y(7)+y(5);
rhs =y(4);
residual(5)= lhs-rhs;
lhs =0;
rhs =T27*y(5)-T27*y(11)+(1+T27-params(4))*y(10)-(1+T27-params(4))*y(12);
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 13);

  %
  % Jacobian matrix
  %

  g1(1,4)=1;
  g1(1,7)=(-(1-params(2)));
  g1(1,8)=(-params(2));
  g1(1,9)=(-1);
  g1(2,3)=(-params(5));
  g1(2,9)=1;
  g1(2,13)=(-1);
  g1(3,4)=T27-1+params(4);
  g1(3,5)=(-(T27-1+params(4)-params(2)*(params(4)+params(3)-1)));
  g1(3,6)=(-(params(2)*(params(4)+params(3)-1)));
  g1(4,1)=(-(params(4)+params(3)-1));
  g1(4,2)=(-(1-params(4)));
  g1(4,8)=params(3);
  g1(5,4)=(-1);
  g1(5,5)=1;
  g1(5,7)=1;
  g1(6,10)=(-(1+T27-params(4)));
  g1(6,5)=(-T27);
  g1(6,11)=T27;
  g1(6,12)=1+T27-params(4);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,169);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,2197);
end
end
