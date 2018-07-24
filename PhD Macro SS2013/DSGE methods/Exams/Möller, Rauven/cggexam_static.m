function [residual, g1, g2] = cggexam_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 8, 1);

%
% Model equations
%

lhs =y(1);
rhs =y(1)*params(2)+params(3)*y(2);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(2)+(-(y(3)-y(1)-y(4)));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(6)+(1-params(6))*(y(1)*params(5)+y(2)*params(4));
residual(3)= lhs-rhs;
lhs =y(4);
rhs =(-(1-params(7)))*y(5)+(1-params(8))/(1+params(1))*y(6)+x(3);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(5);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =x(3);
residual(6)= lhs-rhs;
lhs =y(5);
rhs =y(8)+params(7)*y(5)+x(1);
residual(7)= lhs-rhs;
lhs =y(6);
rhs =params(8)*y(6)+x(2);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-params(2);
  g1(1,2)=(-params(3));
  g1(2,1)=(-1);
  g1(2,3)=1;
  g1(2,4)=(-1);
  g1(3,1)=(-((1-params(6))*params(5)));
  g1(3,2)=(-((1-params(6))*params(4)));
  g1(3,3)=1-params(6);
  g1(4,4)=1;
  g1(4,5)=1-params(7);
  g1(4,6)=(-((1-params(8))/(1+params(1))));
  g1(5,5)=(-1);
  g1(5,7)=1;
  g1(6,8)=1;
  g1(7,5)=1-params(7);
  g1(7,8)=(-1);
  g1(8,6)=1-params(8);
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
