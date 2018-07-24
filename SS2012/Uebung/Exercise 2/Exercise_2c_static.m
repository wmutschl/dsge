function [residual, g1, g2] = Exercise_2c_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 8, 1);

%
% Model equations
%

T35 = y(5)^(1-params(4));
lhs =1/y(2);
rhs =1/y(2)*params(1)*(1+y(7)-params(3));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(2)*params(2)/(1-y(5));
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(4);
residual(3)= lhs-rhs;
lhs =y(1);
rhs =y(8)*y(3)^params(4)*T35;
residual(4)= lhs-rhs;
lhs =y(6);
rhs =(1-params(4))*y(1)*(params(7)-1)/params(7)/y(5);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =params(4)*y(1)*(params(7)-1)/params(7)/y(3);
residual(6)= lhs-rhs;
lhs =y(4);
rhs =y(3)-y(3)*(1-params(3));
residual(7)= lhs-rhs;
lhs =log(y(8));
rhs =log(y(8))*params(5)+x(1);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-1)/(y(2)*y(2))-(1+y(7)-params(3))*params(1)*(-1)/(y(2)*y(2));
  g1(1,7)=(-(1/y(2)*params(1)));
  g1(2,2)=(-(params(2)/(1-y(5))));
  g1(2,5)=(-(y(2)*params(2)/((1-y(5))*(1-y(5)))));
  g1(2,6)=1;
  g1(3,1)=1;
  g1(3,2)=(-1);
  g1(3,4)=(-1);
  g1(4,1)=1;
  g1(4,3)=(-(T35*y(8)*getPowerDeriv(y(3),params(4),1)));
  g1(4,5)=(-(y(8)*y(3)^params(4)*getPowerDeriv(y(5),1-params(4),1)));
  g1(4,8)=(-(y(3)^params(4)*T35));
  g1(5,1)=(-((1-params(4))*(params(7)-1)/params(7)/y(5)));
  g1(5,5)=(-((-((1-params(4))*y(1)*(params(7)-1)/params(7)))/(y(5)*y(5))));
  g1(5,6)=1;
  g1(6,1)=(-(params(4)*(params(7)-1)/params(7)/y(3)));
  g1(6,3)=(-((-(params(4)*y(1)*(params(7)-1)/params(7)))/(y(3)*y(3))));
  g1(6,7)=1;
  g1(7,3)=(-(1-(1-params(3))));
  g1(7,4)=1;
  g1(8,8)=1/y(8)-params(5)*1/y(8);
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
