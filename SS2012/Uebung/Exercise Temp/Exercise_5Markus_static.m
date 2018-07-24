function [residual, g1, g2] = Exercise_5Markus_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 13, 1);

%
% Model equations
%

T23 = params(2)*y(4)^params(3)+(1-params(2))*y(7)^params(3);
T41 = y(2)^params(6)*(1-y(7))^(1-params(6));
T44 = T41^(1-params(4));
T60 = params(2)+(1-params(2))*(y(7)/y(4))^params(3);
T62 = (1-params(3))/params(3);
T71 = 1+params(2)*(y(4)/y(7))^params(3)-params(2);
T99 = (1-y(7))^(1-params(6))*getPowerDeriv(y(2),params(6),1)*getPowerDeriv(T41,1-params(4),1);
T113 = getPowerDeriv(T23,1/params(3),1);
T120 = getPowerDeriv(y(7)/y(4),params(3),1);
T123 = getPowerDeriv(T60,T62,1);
T128 = getPowerDeriv(y(4)/y(7),params(3),1);
T148 = getPowerDeriv(T41,1-params(4),1)*y(2)^params(6)*(-(getPowerDeriv(1-y(7),1-params(6),1)));
lhs =y(1);
rhs =y(2)+y(3);
residual(1)= lhs-rhs;
lhs =y(8);
rhs =T23^(1/params(3));
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(8)*y(5);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(3)+y(4)*(1-params(1));
residual(4)= lhs-rhs;
lhs =y(9);
rhs =T44/(1-params(4));
residual(5)= lhs-rhs;
lhs =y(10);
rhs =T44*(-(1-params(6)))/(1-y(7));
residual(6)= lhs-rhs;
lhs =y(11);
rhs =params(6)*T44/y(2);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =params(2)*T60^T62;
residual(8)= lhs-rhs;
lhs =y(13);
rhs =(1-params(2))*T71^T62;
residual(9)= lhs-rhs;
residual(10) = y(11)-y(11)*params(5)*(1+y(5)*y(12)-params(1));
residual(11) = (-y(10))/y(11)-y(5)*y(13);
lhs =y(5);
rhs =exp(y(6));
residual(12)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+x(1);
residual(13)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(13, 13);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,2)=(-1);
  g1(1,3)=(-1);
  g1(2,4)=(-(params(2)*getPowerDeriv(y(4),params(3),1)*T113));
  g1(2,7)=(-(T113*(1-params(2))*getPowerDeriv(y(7),params(3),1)));
  g1(2,8)=1;
  g1(3,1)=1;
  g1(3,5)=(-y(8));
  g1(3,8)=(-y(5));
  g1(4,3)=(-1);
  g1(4,4)=1-(1-params(1));
  g1(5,2)=(-(T99/(1-params(4))));
  g1(5,7)=(-(T148/(1-params(4))));
  g1(5,9)=1;
  g1(6,2)=(-((-(1-params(6)))*T99/(1-y(7))));
  g1(6,7)=(-(((1-y(7))*(-(1-params(6)))*T148-(-(T44*(-(1-params(6))))))/((1-y(7))*(1-y(7)))));
  g1(6,10)=1;
  g1(7,2)=(-((y(2)*params(6)*T99-params(6)*T44)/(y(2)*y(2))));
  g1(7,7)=(-(params(6)*T148/y(2)));
  g1(7,11)=1;
  g1(8,4)=(-(params(2)*(1-params(2))*(-y(7))/(y(4)*y(4))*T120*T123));
  g1(8,7)=(-(params(2)*T123*(1-params(2))*T120*1/y(4)));
  g1(8,12)=1;
  g1(9,4)=(-((1-params(2))*params(2)*1/y(7)*T128*getPowerDeriv(T71,T62,1)));
  g1(9,7)=(-((1-params(2))*getPowerDeriv(T71,T62,1)*params(2)*T128*(-y(4))/(y(7)*y(7))));
  g1(9,13)=1;
  g1(10,5)=(-(y(12)*y(11)*params(5)));
  g1(10,11)=1-params(5)*(1+y(5)*y(12)-params(1));
  g1(10,12)=(-(y(5)*y(11)*params(5)));
  g1(11,5)=(-y(13));
  g1(11,10)=(-1)/y(11);
  g1(11,11)=y(10)/(y(11)*y(11));
  g1(11,13)=(-y(5));
  g1(12,5)=1;
  g1(12,6)=(-exp(y(6)));
  g1(13,6)=1-params(7);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,169);
end
end
