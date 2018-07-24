function [residual, g1, g2] = rbcexam1_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 6, 1);

%
% Model equations
%

T28 = y(1)^(1-params(3));
T50 = y(2)^params(1)*(1-y(1))^(1-params(1));
T54 = T50^(1-params(2))/y(2);
T61 = 1+y(4)*y(5)*params(3)/y(3)-params(5);
T80 = y(2)^params(1)*(-(getPowerDeriv(1-y(1),1-params(1),1)))*getPowerDeriv(T50,1-params(2),1)/y(2);
T92 = (y(2)*getPowerDeriv(T50,1-params(2),1)*(1-y(1))^(1-params(1))*getPowerDeriv(y(2),params(1),1)-T50^(1-params(2)))/(y(2)*y(2));
lhs =y(5);
rhs =params(7)*exp(y(6));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(6)+params(8)*x(1);
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(5)*y(3)^params(3)*T28;
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(3)+y(2)-y(3)*(1-params(5));
residual(4)= lhs-rhs;
lhs =(1-params(1))/params(1)*y(2)/(1-y(1));
rhs =y(4)*y(5)*(1-params(3))/y(1);
residual(5)= lhs-rhs;
lhs =T54;
rhs =T54*params(4)*T61;
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,6)=(-(params(7)*exp(y(6))));
  g1(2,6)=1-params(6);
  g1(3,1)=(-(y(5)*y(3)^params(3)*getPowerDeriv(y(1),1-params(3),1)));
  g1(3,3)=(-(T28*y(5)*getPowerDeriv(y(3),params(3),1)));
  g1(3,4)=1;
  g1(3,5)=(-(y(3)^params(3)*T28));
  g1(4,2)=(-1);
  g1(4,3)=(-(1-(1-params(5))));
  g1(4,4)=1;
  g1(5,1)=(1-params(1))/params(1)*y(2)/((1-y(1))*(1-y(1)))-(-(y(4)*y(5)*(1-params(3))))/(y(1)*y(1));
  g1(5,2)=(1-params(1))/params(1)*1/(1-y(1));
  g1(5,4)=(-(y(5)*(1-params(3))/y(1)));
  g1(5,5)=(-(y(4)*(1-params(3))/y(1)));
  g1(6,1)=T80-T61*params(4)*T80;
  g1(6,2)=T92-T61*params(4)*T92;
  g1(6,3)=(-(T54*params(4)*(-(y(4)*y(5)*params(3)))/(y(3)*y(3))));
  g1(6,4)=(-(T54*params(4)*y(5)*params(3)/y(3)));
  g1(6,5)=(-(T54*params(4)*y(4)*params(3)/y(3)));
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
