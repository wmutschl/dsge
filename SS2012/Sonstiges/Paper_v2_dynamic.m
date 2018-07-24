function [residual, g1, g2, g3] = Paper_v2_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(16, 1);
T21 = (1-params(1))/((1+params(1))*params(2));
T37 = params(3)/(1+params(3));
T88 = (1-params(3)*params(7))*(1-params(7))/((1+params(3)*params(6))*params(7));
T133 = (1+params(3))*(1-params(3)*params(10))*(1-params(10))/(1+params(10)*1/params(12)*(1+params(12))*params(11));
lhs =y(19);
rhs =params(1)/(1+params(1))*y(5)+1/(1+params(1))*y(34)-T21*(y(20)-y(30))+T21*y(26);
residual(1)= lhs-rhs;
lhs =y(18);
rhs =1/(1+params(3))*y(4)+T37*y(33)+params(4)/(1+params(3))*y(17)+y(25)/(1+params(3));
residual(2)= lhs-rhs;
lhs =y(17);
rhs =(-(y(20)-y(30)))+(1-params(5))/(1-params(5)+params(24))*y(32)+params(24)/(1-params(5)+params(24))*y(35)+x(it_, 8);
residual(3)= lhs-rhs;
lhs =y(16);
rhs =(1-params(5))*y(3)+y(4)*params(5);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =y(30)*params(3)/(1+params(3)*params(6))+params(6)/(1+params(3)*params(6))*y(1)+T88*(params(8)*y(21)+(1-params(8))*y(15)-y(24)+x(it_, 7));
residual(5)= lhs-rhs;
lhs =y(15);
rhs =T37*y(31)+1/(1+params(3))*y(2)+y(30)*T37-y(14)*(1+params(3)*params(9))/(1+params(3))+y(1)*params(9)/(1+params(3))-T133*(y(15)-params(11)*y(22)-params(2)/(1-params(1))*(y(19)-params(1)*y(5))+y(27)-x(it_, 10));
residual(6)= lhs-rhs;
lhs =y(22);
rhs =y(3)+(-y(15))+y(21)*(1+params(13));
residual(7)= lhs-rhs;
lhs =y(23);
rhs =y(24)*params(14)+y(3)*params(8)*params(14)+y(21)*params(13)*params(8)*params(14)+y(22)*(1-params(8))*params(14);
residual(8)= lhs-rhs;
lhs =y(23);
rhs =y(19)*(1-params(5)*params(15)-params(16))+y(18)*params(5)*params(15)+params(16)*y(28);
residual(9)= lhs-rhs;
lhs =y(20);
rhs =params(17)*y(6)+(1-params(17))*(y(29)+params(18)*(y(1)-y(29))+y(23)*params(19))+params(20)*(y(14)-y(1))+params(21)*(y(23)-y(7))+x(it_, 9);
residual(10)= lhs-rhs;
lhs =y(25);
rhs =params(26)*y(9)+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(26);
rhs =params(27)*y(10)+x(it_, 3);
residual(12)= lhs-rhs;
lhs =y(27);
rhs =params(28)*y(11)+x(it_, 4);
residual(13)= lhs-rhs;
lhs =y(28);
rhs =params(29)*y(12)+x(it_, 5);
residual(14)= lhs-rhs;
lhs =y(24);
rhs =params(25)*y(8)+x(it_, 1);
residual(15)= lhs-rhs;
lhs =y(29);
rhs =params(30)*y(13)+x(it_, 6);
residual(16)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(16, 45);

  %
  % Jacobian matrix
  %

  g1(1,30)=(-T21);
  g1(1,5)=(-(params(1)/(1+params(1))));
  g1(1,19)=1;
  g1(1,34)=(-(1/(1+params(1))));
  g1(1,20)=T21;
  g1(1,26)=(-T21);
  g1(2,17)=(-(params(4)/(1+params(3))));
  g1(2,4)=(-(1/(1+params(3))));
  g1(2,18)=1;
  g1(2,33)=(-T37);
  g1(2,25)=(-(1/(1+params(3))));
  g1(3,30)=(-1);
  g1(3,17)=1;
  g1(3,32)=(-((1-params(5))/(1-params(5)+params(24))));
  g1(3,20)=1;
  g1(3,35)=(-(params(24)/(1-params(5)+params(24))));
  g1(3,43)=(-1);
  g1(4,3)=(-(1-params(5)));
  g1(4,16)=1;
  g1(4,4)=(-params(5));
  g1(5,1)=(-(params(6)/(1+params(3)*params(6))));
  g1(5,14)=1;
  g1(5,30)=(-(params(3)/(1+params(3)*params(6))));
  g1(5,15)=(-(T88*(1-params(8))));
  g1(5,21)=(-(T88*params(8)));
  g1(5,24)=T88;
  g1(5,42)=(-T88);
  g1(6,1)=(-(params(9)/(1+params(3))));
  g1(6,14)=(1+params(3)*params(9))/(1+params(3));
  g1(6,30)=(-T37);
  g1(6,2)=(-(1/(1+params(3))));
  g1(6,15)=1-(-T133);
  g1(6,31)=(-T37);
  g1(6,5)=T133*(-(params(2)/(1-params(1))*(-params(1))));
  g1(6,19)=T133*(-(params(2)/(1-params(1))));
  g1(6,22)=T133*(-params(11));
  g1(6,27)=T133;
  g1(6,45)=(-T133);
  g1(7,15)=1;
  g1(7,3)=(-1);
  g1(7,21)=(-(1+params(13)));
  g1(7,22)=1;
  g1(8,3)=(-(params(8)*params(14)));
  g1(8,21)=(-(params(13)*params(8)*params(14)));
  g1(8,22)=(-((1-params(8))*params(14)));
  g1(8,23)=1;
  g1(8,24)=(-params(14));
  g1(9,18)=(-(params(5)*params(15)));
  g1(9,19)=(-(1-params(5)*params(15)-params(16)));
  g1(9,23)=1;
  g1(9,28)=(-params(16));
  g1(10,1)=(-((1-params(17))*params(18)-params(20)));
  g1(10,14)=(-params(20));
  g1(10,6)=(-params(17));
  g1(10,20)=1;
  g1(10,7)=params(21);
  g1(10,23)=(-(params(21)+(1-params(17))*params(19)));
  g1(10,29)=(-((1-params(17))*(1-params(18))));
  g1(10,44)=(-1);
  g1(11,9)=(-params(26));
  g1(11,25)=1;
  g1(11,37)=(-1);
  g1(12,10)=(-params(27));
  g1(12,26)=1;
  g1(12,38)=(-1);
  g1(13,11)=(-params(28));
  g1(13,27)=1;
  g1(13,39)=(-1);
  g1(14,12)=(-params(29));
  g1(14,28)=1;
  g1(14,40)=(-1);
  g1(15,8)=(-params(25));
  g1(15,24)=1;
  g1(15,36)=(-1);
  g1(16,13)=(-params(30));
  g1(16,29)=1;
  g1(16,41)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],16,2025);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],16,91125);
end
end
