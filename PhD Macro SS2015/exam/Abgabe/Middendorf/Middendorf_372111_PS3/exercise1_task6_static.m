function [residual, g1, g2] = exercise1_task6_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 23, 1);

%
% Model equations
%

T48 = y(10)*y(7)^params(5)*y(5)^params(4);
T50 = y(4)^(1-params(4));
T158 = 1/params(24)/(y(1)/params(24));
T221 = 1/params(23)/(y(10)/params(23));
lhs =(1-y(1))*y(2);
rhs =params(1)*y(3)/(1-y(4));
residual(1)= lhs-rhs;
lhs =y(23);
rhs =y(23)*params(2)*(1-params(3)+(1-y(1))*y(11));
residual(2)= lhs-rhs;
lhs =y(23);
rhs =1/y(3);
residual(3)= lhs-rhs;
lhs =y(5);
rhs =(1-params(3))*y(5)+y(6);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =(1-params(3))*y(7)+y(8);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =T48*T50;
residual(6)= lhs-rhs;
lhs =y(2)*y(4);
rhs =y(9)*(1-params(4));
residual(7)= lhs-rhs;
lhs =y(11)*y(5);
rhs =y(9)*params(4);
residual(8)= lhs-rhs;
lhs =log(y(10)/params(23));
rhs =log(y(10)/params(23))*params(6)+x(1);
residual(9)= lhs-rhs;
lhs =y(8)+y(12)+y(13);
rhs =y(1)*(y(2)*y(4)+y(11)*y(5));
residual(10)= lhs-rhs;
lhs =y(12)-params(14);
rhs =(y(12)-params(14))*params(8)+x(2);
residual(11)= lhs-rhs;
lhs =y(8)-params(15);
rhs =(y(8)-params(15))*params(10)+x(3);
residual(12)= lhs-rhs;
lhs =log(y(1)/params(24));
rhs =log(y(1)/params(24))*params(12)+x(4);
residual(13)= lhs-rhs;
lhs =y(9);
rhs =y(8)+y(12)+y(3)+y(6);
residual(14)= lhs-rhs;
lhs =y(14);
rhs =100*(y(9)-params(16))/params(16);
residual(15)= lhs-rhs;
lhs =y(15);
rhs =100*(y(3)-params(17))/params(17);
residual(16)= lhs-rhs;
lhs =y(16);
rhs =100*(y(6)-params(18))/params(18);
residual(17)= lhs-rhs;
lhs =y(17);
rhs =100*(y(4)-params(19));
residual(18)= lhs-rhs;
lhs =y(18);
rhs =100*(y(2)-params(20))/params(20);
residual(19)= lhs-rhs;
lhs =y(19);
rhs =100*(y(11)-params(21));
residual(20)= lhs-rhs;
lhs =y(20);
rhs =100*(y(13)-params(22));
residual(21)= lhs-rhs;
lhs =y(21);
rhs =100*(y(12)/y(9)-params(14)/params(16));
residual(22)= lhs-rhs;
lhs =y(22);
rhs =100*(y(8)/y(9)-params(15)/params(16));
residual(23)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-y(2));
  g1(1,2)=1-y(1);
  g1(1,3)=(-(params(1)/(1-y(4))));
  g1(1,4)=(-(params(1)*y(3)/((1-y(4))*(1-y(4)))));
  g1(2,1)=(-(y(23)*params(2)*(-y(11))));
  g1(2,11)=(-((1-y(1))*y(23)*params(2)));
  g1(2,23)=1-params(2)*(1-params(3)+(1-y(1))*y(11));
  g1(3,3)=(-((-1)/(y(3)*y(3))));
  g1(3,23)=1;
  g1(4,5)=1-(1-params(3));
  g1(4,6)=(-1);
  g1(5,7)=1-(1-params(3));
  g1(5,8)=(-1);
  g1(6,4)=(-(T48*getPowerDeriv(y(4),1-params(4),1)));
  g1(6,5)=(-(T50*y(10)*y(7)^params(5)*getPowerDeriv(y(5),params(4),1)));
  g1(6,7)=(-(T50*y(5)^params(4)*y(10)*getPowerDeriv(y(7),params(5),1)));
  g1(6,9)=1;
  g1(6,10)=(-(T50*y(7)^params(5)*y(5)^params(4)));
  g1(7,2)=y(4);
  g1(7,4)=y(2);
  g1(7,9)=(-(1-params(4)));
  g1(8,5)=y(11);
  g1(8,9)=(-params(4));
  g1(8,11)=y(5);
  g1(9,10)=T221-params(6)*T221;
  g1(10,1)=(-(y(2)*y(4)+y(11)*y(5)));
  g1(10,2)=(-(y(1)*y(4)));
  g1(10,4)=(-(y(1)*y(2)));
  g1(10,5)=(-(y(1)*y(11)));
  g1(10,8)=1;
  g1(10,11)=(-(y(1)*y(5)));
  g1(10,12)=1;
  g1(10,13)=1;
  g1(11,12)=1-params(8);
  g1(12,8)=1-params(10);
  g1(13,1)=T158-params(12)*T158;
  g1(14,3)=(-1);
  g1(14,6)=(-1);
  g1(14,8)=(-1);
  g1(14,9)=1;
  g1(14,12)=(-1);
  g1(15,9)=(-(100*1/params(16)));
  g1(15,14)=1;
  g1(16,3)=(-(100*1/params(17)));
  g1(16,15)=1;
  g1(17,6)=(-(100*1/params(18)));
  g1(17,16)=1;
  g1(18,4)=(-100);
  g1(18,17)=1;
  g1(19,2)=(-(100*1/params(20)));
  g1(19,18)=1;
  g1(20,11)=(-100);
  g1(20,19)=1;
  g1(21,13)=(-100);
  g1(21,20)=1;
  g1(22,9)=(-(100*(-y(12))/(y(9)*y(9))));
  g1(22,12)=(-(100*1/y(9)));
  g1(22,21)=1;
  g1(23,8)=(-(100*1/y(9)));
  g1(23,9)=(-(100*(-y(8))/(y(9)*y(9))));
  g1(23,22)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,529);
end
end
