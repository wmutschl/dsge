function [residual, g1, g2] = Marie_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 6, 1);

%
% Model equations
%

T51 = 1+params(3)/params(1)-params(4);
lhs =y(1);
rhs =y(6)+params(2)*y(5)+(1-params(2))*y(4);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(5)+x(1);
residual(2)= lhs-rhs;
lhs =y(1)*(params(3)/params(1)-1+params(4));
rhs =(params(3)/params(1)-1+params(4)-params(2)*(params(4)+params(3)-1))*y(2)+params(2)*(params(4)+params(3)-1)*y(3);
residual(3)= lhs-rhs;
lhs =y(5)*params(3);
rhs =y(5)*(1-params(4))+(params(4)+params(3)-1)*y(3);
residual(4)= lhs-rhs;
lhs =y(4)+y(2);
rhs =y(1);
residual(5)= lhs-rhs;
lhs =0;
rhs =y(1)*T51-y(5)*T51;
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,4)=(-(1-params(2)));
  g1(1,5)=(-params(2));
  g1(1,6)=(-1);
  g1(2,6)=1-params(5);
  g1(3,1)=params(3)/params(1)-1+params(4);
  g1(3,2)=(-(params(3)/params(1)-1+params(4)-params(2)*(params(4)+params(3)-1)));
  g1(3,3)=(-(params(2)*(params(4)+params(3)-1)));
  g1(4,3)=(-(params(4)+params(3)-1));
  g1(4,5)=params(3)-(1-params(4));
  g1(5,1)=(-1);
  g1(5,2)=1;
  g1(5,4)=1;
  g1(6,1)=(-T51);
  g1(6,5)=T51;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
end
end
