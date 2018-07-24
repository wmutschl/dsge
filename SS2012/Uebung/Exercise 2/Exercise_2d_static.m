function [residual, g1, g2] = Exercise_2d_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 8, 1);

%
% Model equations
%

lhs =exp((-y(2)));
rhs =params(2)*exp(y(2))*(1+params(6)*exp(y(7)-params(3)));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(2)+params(7)/(1-params(7))*y(5);
residual(2)= lhs-rhs;
lhs =exp(y(1));
rhs =exp(y(2))*params(8)+(1-params(8))*exp(y(4));
residual(3)= lhs-rhs;
lhs =y(1);
rhs =y(8)+params(1)*y(3)+y(5)*(1-params(1));
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(1)-y(3);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =y(1)-y(3);
residual(6)= lhs-rhs;
lhs =params(3)*exp(y(4));
rhs =exp(y(3))-exp(y(3))*(1-params(3));
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(4)+x(1);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-exp((-y(2))))-params(2)*exp(y(2))*(1+params(6)*exp(y(7)-params(3)));
  g1(1,7)=(-(params(2)*exp(y(2))*params(6)*exp(y(7)-params(3))));
  g1(2,2)=(-1);
  g1(2,5)=(-(params(7)/(1-params(7))));
  g1(2,6)=1;
  g1(3,1)=exp(y(1));
  g1(3,2)=(-(exp(y(2))*params(8)));
  g1(3,4)=(-((1-params(8))*exp(y(4))));
  g1(4,1)=1;
  g1(4,3)=(-params(1));
  g1(4,5)=(-(1-params(1)));
  g1(4,8)=(-1);
  g1(5,1)=(-1);
  g1(5,3)=1;
  g1(5,6)=1;
  g1(6,1)=(-1);
  g1(6,3)=1;
  g1(6,7)=1;
  g1(7,3)=(-(exp(y(3))-exp(y(3))*(1-params(3))));
  g1(7,4)=params(3)*exp(y(4));
  g1(8,8)=1-params(4);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,64);
end
end
