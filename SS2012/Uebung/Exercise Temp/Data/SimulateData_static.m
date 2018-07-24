function [residual, g1, g2] = SimulateData_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 11, 1);

%
% Model equations
%

lhs =y(1);
rhs =y(1)+y(5)-y(5)-1/params(1)*(y(4)-y(3)-y(6));
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(14)+params(2)*(y(1)-y(5));
residual(2)= lhs-rhs;
lhs =y(2);
rhs =y(1)-y(5);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(5)+y(3)*(1-params(5))*params(3)+(y(1)-y(5))*(1-params(5))*params(4)+params(11)/100*x(3);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(6)+params(12)/100*x(2);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+params(13)/100*x(1);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =params(10)+y(6)*100;
residual(7)= lhs-rhs;
lhs =y(8);
rhs =params(9)+y(3)*400;
residual(8)= lhs-rhs;
lhs =y(9);
rhs =params(9)+params(8)+params(10)*4+y(4)*400;
residual(9)= lhs-rhs;
lhs =y(10);
rhs =params(10)+y(6)*100;
residual(10)= lhs-rhs;
lhs =y(11);
rhs =params(10)+y(6)*100;
residual(11)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(11, 11);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-(1/params(1)));
  g1(1,4)=1/params(1);
  g1(1,6)=(-(1/params(1)));
  g1(2,1)=(-params(2));
  g1(2,3)=1-params(14);
  g1(2,5)=params(2);
  g1(3,1)=(-1);
  g1(3,2)=1;
  g1(3,5)=1;
  g1(4,1)=(-((1-params(5))*params(4)));
  g1(4,3)=(-((1-params(5))*params(3)));
  g1(4,4)=1-params(5);
  g1(4,5)=(1-params(5))*params(4);
  g1(5,5)=1-params(6);
  g1(6,6)=1-params(7);
  g1(7,6)=(-100);
  g1(7,7)=1;
  g1(8,3)=(-400);
  g1(8,8)=1;
  g1(9,4)=(-400);
  g1(9,9)=1;
  g1(10,6)=(-100);
  g1(10,10)=1;
  g1(11,6)=(-100);
  g1(11,11)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],11,121);
end
end
