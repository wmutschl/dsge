function [residual, g1, g2] = Paper_v3_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 16, 1);

%
% Model equations
%

T19 = (1-params(1))/((1+params(1))*params(2));
T32 = 1/(1+params(3));
T34 = params(3)/(1+params(3));
T80 = (1-params(3)*params(7))*(1-params(7))/((1+params(3)*params(6))*params(7));
T122 = (1+params(3))*(1-params(3)*params(10))*(1-params(10))/(1+params(10)*1/params(12)*(1+params(12))*params(11));
lhs =y(6);
rhs =y(6)*params(1)/(1+params(1))+y(6)*1/(1+params(1))-T19*(y(7)-y(1))+T19*y(13);
residual(1)= lhs-rhs;
lhs =y(5);
rhs =y(5)*T32+y(5)*T34+params(4)/(1+params(3))*y(4)-y(12)/(1+params(3));
residual(2)= lhs-rhs;
lhs =y(4);
rhs =(-(y(7)-y(1)))+y(4)*(1-params(5))/(1-params(5)+params(24))+params(24)/(1-params(5)+params(24))*y(8)+x(8);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =(1-params(5))*y(3)+y(5)*params(5);
residual(4)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(3)/(1+params(3)*params(6))+y(1)*params(6)/(1+params(3)*params(6))+T80*(y(8)*params(8)+(1-params(8))*y(2)-y(11)+x(7));
residual(5)= lhs-rhs;
lhs =y(2);
rhs =T34*y(2)+T32*y(2)+y(1)*T34-y(1)*(1+params(3)*params(9))/(1+params(3))+y(1)*params(9)/(1+params(3))-T122*(y(2)-params(11)*y(9)-params(2)/(1-params(1))*(y(6)-y(6)*params(1))+y(14)-x(10));
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(3)+(-y(2))+y(8)*(1+params(13));
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(11)*params(14)+y(3)*params(8)*params(14)+y(8)*params(13)*params(8)*params(14)+y(9)*(1-params(8))*params(14);
residual(8)= lhs-rhs;
lhs =y(10);
rhs =y(6)*(1-params(5)*params(15)-params(16))+y(5)*params(5)*params(15)+params(16)*y(15);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(17)+(1-params(17))*(y(16)+params(18)*(y(1)-y(16))+y(10)*params(19))-params(22)*x(1)-params(23)*x(4)+x(9);
residual(10)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(26)+x(2);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(27)+x(3);
residual(12)= lhs-rhs;
lhs =y(14);
rhs =x(4)+y(14)*params(28);
residual(13)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(29)+x(5);
residual(14)= lhs-rhs;
lhs =y(11);
rhs =x(1)+y(11)*params(25);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(30)+x(6);
residual(16)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(16, 16);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-T19);
  g1(1,6)=1-(params(1)/(1+params(1))+1/(1+params(1)));
  g1(1,7)=T19;
  g1(1,13)=(-T19);
  g1(2,4)=(-(params(4)/(1+params(3))));
  g1(2,5)=1-(T32+T34);
  g1(2,12)=T32;
  g1(3,1)=(-1);
  g1(3,4)=1-(1-params(5))/(1-params(5)+params(24));
  g1(3,7)=1;
  g1(3,8)=(-(params(24)/(1-params(5)+params(24))));
  g1(4,3)=1-(1-params(5));
  g1(4,5)=(-params(5));
  g1(5,1)=1-(params(3)/(1+params(3)*params(6))+params(6)/(1+params(3)*params(6)));
  g1(5,2)=(-(T80*(1-params(8))));
  g1(5,8)=(-(T80*params(8)));
  g1(5,11)=T80;
  g1(6,1)=(-(params(9)/(1+params(3))+T34-(1+params(3)*params(9))/(1+params(3))));
  g1(6,2)=1-(T32+T34-T122);
  g1(6,6)=T122*(-((1-params(1))*params(2)/(1-params(1))));
  g1(6,9)=T122*(-params(11));
  g1(6,14)=T122;
  g1(7,2)=1;
  g1(7,3)=(-1);
  g1(7,8)=(-(1+params(13)));
  g1(7,9)=1;
  g1(8,3)=(-(params(8)*params(14)));
  g1(8,8)=(-(params(13)*params(8)*params(14)));
  g1(8,9)=(-((1-params(8))*params(14)));
  g1(8,10)=1;
  g1(8,11)=(-params(14));
  g1(9,5)=(-(params(5)*params(15)));
  g1(9,6)=(-(1-params(5)*params(15)-params(16)));
  g1(9,10)=1;
  g1(9,15)=(-params(16));
  g1(10,1)=(-((1-params(17))*params(18)));
  g1(10,7)=1-params(17);
  g1(10,10)=(-((1-params(17))*params(19)));
  g1(10,16)=(-((1-params(17))*(1-params(18))));
  g1(11,12)=1-params(26);
  g1(12,13)=1-params(27);
  g1(13,14)=1-params(28);
  g1(14,15)=1-params(29);
  g1(15,11)=1-params(25);
  g1(16,16)=1-params(30);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],16,256);
end
end
