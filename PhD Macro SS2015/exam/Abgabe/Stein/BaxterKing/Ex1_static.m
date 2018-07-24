function [residual, g1, g2] = Ex1_static(y, x, params)
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

residual = zeros( 22, 1);

%
% Model equations
%

T46 = y(13)*y(10)^params(4)*y(5)^params(5);
T48 = y(3)^(1-params(5));
T228 = (-(100*(1/y(2)-1/(y(2)))));
T241 = 1/params(12)/(y(11)/params(12));
T248 = 1/params(11)/(y(13)/params(11));
lhs =(1-y(11))*y(6);
rhs =params(2)/(1-y(3))*y(1);
residual(1)= lhs-rhs;
lhs =1/y(1);
rhs =1/y(1)*params(1)*(1-params(3)+(1-y(11))*y(7));
residual(2)= lhs-rhs;
lhs =y(5);
rhs =(1-params(3))*y(5)+y(4);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =(1-params(3))*y(10)+y(9);
residual(4)= lhs-rhs;
lhs =y(2);
rhs =T46*T48;
residual(5)= lhs-rhs;
lhs =y(6)*y(3);
rhs =y(2)*(1-params(5));
residual(6)= lhs-rhs;
lhs =y(7)*y(5);
rhs =y(2)*params(5);
residual(7)= lhs-rhs;
lhs =log(y(13)/params(11));
rhs =log(y(13)/params(11))*params(6)+x(4)*params(14);
residual(8)= lhs-rhs;
lhs =y(9)+y(8)+y(12);
rhs =y(11)*(y(6)*y(3)+y(7)*y(5));
residual(9)= lhs-rhs;
lhs =y(8)-params(10);
rhs =(y(8)-params(10))*params(7)+x(1)*params(17);
residual(10)= lhs-rhs;
lhs =y(9)-params(13);
rhs =(y(9)-params(13))*params(8)+x(2)*params(16);
residual(11)= lhs-rhs;
lhs =log(y(11)/params(12));
rhs =log(y(11)/params(12))*params(9)+x(3)*params(15);
residual(12)= lhs-rhs;
lhs =y(2);
rhs =y(9)+y(8)+y(1)+y(4);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =100*(y(2)-(y(2)))/(y(2));
residual(14)= lhs-rhs;
lhs =y(15);
rhs =100*(y(1)-(y(1)))/(y(1));
residual(15)= lhs-rhs;
lhs =y(16);
rhs =100*(y(4)-(y(4)))/(y(4));
residual(16)= lhs-rhs;
lhs =y(17);
rhs =100*(y(3)-(y(3)));
residual(17)= lhs-rhs;
lhs =y(18);
rhs =100*(y(6)-(y(6)))/(y(6));
residual(18)= lhs-rhs;
lhs =y(19);
rhs =100*(y(7)-(y(7)));
residual(19)= lhs-rhs;
lhs =y(20);
rhs =100*(y(12)-(y(12)));
residual(20)= lhs-rhs;
lhs =y(21);
rhs =100*(y(8)/y(2)-(y(8))/(y(2)));
residual(21)= lhs-rhs;
lhs =y(22);
rhs =100*(y(9)/y(2)-(y(9))/(y(2)));
residual(22)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(22, 22);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(2)/(1-y(3))));
  g1(1,3)=(-(y(1)*params(2)/((1-y(3))*(1-y(3)))));
  g1(1,6)=1-y(11);
  g1(1,11)=(-y(6));
  g1(2,1)=(-1)/(y(1)*y(1))-(1-params(3)+(1-y(11))*y(7))*params(1)*(-1)/(y(1)*y(1));
  g1(2,7)=(-((1-y(11))*1/y(1)*params(1)));
  g1(2,11)=(-(1/y(1)*params(1)*(-y(7))));
  g1(3,4)=(-1);
  g1(3,5)=1-(1-params(3));
  g1(4,9)=(-1);
  g1(4,10)=1-(1-params(3));
  g1(5,2)=1;
  g1(5,3)=(-(T46*getPowerDeriv(y(3),1-params(5),1)));
  g1(5,5)=(-(T48*y(13)*y(10)^params(4)*getPowerDeriv(y(5),params(5),1)));
  g1(5,10)=(-(T48*y(5)^params(5)*y(13)*getPowerDeriv(y(10),params(4),1)));
  g1(5,13)=(-(T48*y(10)^params(4)*y(5)^params(5)));
  g1(6,2)=(-(1-params(5)));
  g1(6,3)=y(6);
  g1(6,6)=y(3);
  g1(7,2)=(-params(5));
  g1(7,5)=y(7);
  g1(7,7)=y(5);
  g1(8,13)=T248-params(6)*T248;
  g1(9,3)=(-(y(11)*y(6)));
  g1(9,5)=(-(y(11)*y(7)));
  g1(9,6)=(-(y(11)*y(3)));
  g1(9,7)=(-(y(11)*y(5)));
  g1(9,8)=1;
  g1(9,9)=1;
  g1(9,11)=(-(y(6)*y(3)+y(7)*y(5)));
  g1(9,12)=1;
  g1(10,8)=1-params(7);
  g1(11,9)=1-params(8);
  g1(12,11)=T241-params(9)*T241;
  g1(13,1)=(-1);
  g1(13,2)=1;
  g1(13,4)=(-1);
  g1(13,8)=(-1);
  g1(13,9)=(-1);
  g1(14,2)=(-(100*(-(y(2)-(y(2))))/((y(2))*(y(2)))));
  g1(14,14)=1;
  g1(15,1)=(-((-(100*(y(1)-(y(1)))))/((y(1))*(y(1)))));
  g1(15,15)=1;
  g1(16,4)=(-((-(100*(y(4)-(y(4)))))/((y(4))*(y(4)))));
  g1(16,16)=1;
  g1(17,17)=1;
  g1(18,6)=(-((-(100*(y(6)-(y(6)))))/((y(6))*(y(6)))));
  g1(18,18)=1;
  g1(19,19)=1;
  g1(20,20)=1;
  g1(21,2)=(-(100*((-y(8))/(y(2)*y(2))-(-(y(8)))/((y(2))*(y(2))))));
  g1(21,8)=T228;
  g1(21,21)=1;
  g1(22,2)=(-(100*((-y(9))/(y(2)*y(2))-(-(y(9)))/((y(2))*(y(2))))));
  g1(22,9)=T228;
  g1(22,22)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],22,484);
end
end
