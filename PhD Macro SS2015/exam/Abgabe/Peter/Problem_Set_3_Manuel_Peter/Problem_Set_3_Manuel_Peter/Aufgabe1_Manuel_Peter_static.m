function [residual, g1, g2] = Aufgabe1_Manuel_Peter_static(y, x, params)
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

T48 = y(10)*y(6)^params(3)*y(5)^params(4);
T50 = y(3)^(1-params(4));
T156 = 1/params(13)/(y(1)/params(13));
T218 = 1/params(10)/(y(10)/params(10));
lhs =(1-y(1))*y(13);
rhs =params(1)*y(2)/(1-y(3));
residual(1)= lhs-rhs;
lhs =y(14);
rhs =params(5)*y(14)*(1-params(2)+(1-y(1))*y(4));
residual(2)= lhs-rhs;
lhs =y(14);
rhs =1/y(2);
residual(3)= lhs-rhs;
lhs =y(5);
rhs =(1-params(2))*y(5)+y(7);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =(1-params(2))*y(6)+y(8);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =T48*T50;
residual(6)= lhs-rhs;
lhs =y(13)*y(3);
rhs =y(9)*(1-params(4));
residual(7)= lhs-rhs;
lhs =y(4)*y(5);
rhs =y(9)*params(4);
residual(8)= lhs-rhs;
lhs =log(y(10)/params(10));
rhs =log(y(10)/params(10))*params(6)+x(1);
residual(9)= lhs-rhs;
lhs =y(8)+y(11)+y(12);
rhs =y(1)*(y(13)*y(3)+y(4)*y(5));
residual(10)= lhs-rhs;
lhs =y(11)-params(11);
rhs =(y(11)-params(11))*params(8)+x(3);
residual(11)= lhs-rhs;
lhs =y(8)-params(12);
rhs =(y(8)-params(12))*params(9)+x(4);
residual(12)= lhs-rhs;
lhs =log(y(1)/params(13));
rhs =log(y(1)/params(13))*params(7)+x(2);
residual(13)= lhs-rhs;
lhs =y(9);
rhs =y(8)+y(11)+y(2)+y(7);
residual(14)= lhs-rhs;
lhs =y(16);
rhs =100*(y(9)-params(17))/params(17);
residual(15)= lhs-rhs;
lhs =y(15);
rhs =100*(y(2)-params(14))/params(14);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =100*(y(7)-params(20))/params(20);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =100*(y(12)-params(18));
residual(18)= lhs-rhs;
lhs =y(19);
rhs =100*(y(13)-params(16))/params(16);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =100*(y(4)-params(19));
residual(20)= lhs-rhs;
lhs =y(21);
rhs =100*(y(12)-params(18));
residual(21)= lhs-rhs;
lhs =y(22);
rhs =100*(y(11)/y(9)-params(11)/params(17));
residual(22)= lhs-rhs;
lhs =y(23);
rhs =100*(y(8)/y(9)-params(12)/params(17));
residual(23)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-y(13));
  g1(1,2)=(-(params(1)*1/(1-y(3))));
  g1(1,3)=(-(params(1)*y(2)/((1-y(3))*(1-y(3)))));
  g1(1,13)=1-y(1);
  g1(2,1)=(-(params(5)*y(14)*(-y(4))));
  g1(2,4)=(-(params(5)*(1-y(1))*y(14)));
  g1(2,14)=1-params(5)*(1-params(2)+(1-y(1))*y(4));
  g1(3,2)=(-((-1)/(y(2)*y(2))));
  g1(3,14)=1;
  g1(4,5)=1-(1-params(2));
  g1(4,7)=(-1);
  g1(5,6)=1-(1-params(2));
  g1(5,8)=(-1);
  g1(6,3)=(-(T48*getPowerDeriv(y(3),1-params(4),1)));
  g1(6,5)=(-(T50*y(10)*y(6)^params(3)*getPowerDeriv(y(5),params(4),1)));
  g1(6,6)=(-(T50*y(5)^params(4)*y(10)*getPowerDeriv(y(6),params(3),1)));
  g1(6,9)=1;
  g1(6,10)=(-(T50*y(6)^params(3)*y(5)^params(4)));
  g1(7,3)=y(13);
  g1(7,9)=(-(1-params(4)));
  g1(7,13)=y(3);
  g1(8,4)=y(5);
  g1(8,5)=y(4);
  g1(8,9)=(-params(4));
  g1(9,10)=T218-params(6)*T218;
  g1(10,1)=(-(y(13)*y(3)+y(4)*y(5)));
  g1(10,3)=(-(y(1)*y(13)));
  g1(10,4)=(-(y(1)*y(5)));
  g1(10,5)=(-(y(1)*y(4)));
  g1(10,8)=1;
  g1(10,11)=1;
  g1(10,12)=1;
  g1(10,13)=(-(y(1)*y(3)));
  g1(11,11)=1-params(8);
  g1(12,8)=1-params(9);
  g1(13,1)=T156-params(7)*T156;
  g1(14,2)=(-1);
  g1(14,7)=(-1);
  g1(14,8)=(-1);
  g1(14,9)=1;
  g1(14,11)=(-1);
  g1(15,9)=(-(100/params(17)));
  g1(15,16)=1;
  g1(16,2)=(-(100/params(14)));
  g1(16,15)=1;
  g1(17,7)=(-(100/params(20)));
  g1(17,17)=1;
  g1(18,12)=(-100);
  g1(18,18)=1;
  g1(19,13)=(-(100/params(16)));
  g1(19,19)=1;
  g1(20,4)=(-100);
  g1(20,20)=1;
  g1(21,12)=(-100);
  g1(21,21)=1;
  g1(22,9)=(-(100*(-y(11))/(y(9)*y(9))));
  g1(22,11)=(-(100*1/y(9)));
  g1(22,22)=1;
  g1(23,8)=(-(100*1/y(9)));
  g1(23,9)=(-(100*(-y(8))/(y(9)*y(9))));
  g1(23,23)=1;
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
