function [residual, g1, g2] = cgg_exam_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 7, 1);

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
rhs =params(7)*y(5)+(1-params(8))/(1+params(1))*y(6);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(5);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =params(7)*y(5)+params(9)*x(1);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =params(8)*y(6)+params(10)*x(2);
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

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
  g1(4,5)=(-params(7));
  g1(4,6)=(-((1-params(8))/(1+params(1))));
  g1(5,5)=(-1);
  g1(5,7)=1;
  g1(6,5)=1-params(7);
  g1(7,6)=1-params(8);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,49);
end
end
