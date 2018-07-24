function [residual, g1, g2] = bk_static(y, x, params)
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

T48 = y(14)*y(11)^params(4)*y(7)^params(5);
T50 = y(2)^(1-params(5));
T197 = 1/params(25)/(y(9)/params(25));
T226 = 1/params(26)/(y(14)/params(26));
lhs =(1-y(9))*y(5);
rhs =params(2)*y(1)/(1-y(2));
residual(1)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(1)*(1-params(3)+(1-y(9))*y(6));
residual(2)= lhs-rhs;
lhs =y(10);
rhs =1/y(1);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =(1-params(3))*y(7)+y(12);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =(1-params(3))*y(11)+y(4);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =T48*T50;
residual(6)= lhs-rhs;
lhs =y(5)*y(2);
rhs =y(13)*(1-params(5));
residual(7)= lhs-rhs;
lhs =y(6)*y(7);
rhs =y(13)*params(5);
residual(8)= lhs-rhs;
lhs =log(y(14)/params(26));
rhs =log(y(14)/params(26))*params(6)+x(1);
residual(9)= lhs-rhs;
lhs =y(4)+y(3)+y(8);
rhs =y(9)*(y(5)*y(2)+y(6)*y(7));
residual(10)= lhs-rhs;
lhs =y(3)-params(15);
rhs =(y(3)-params(15))*params(7)+x(2);
residual(11)= lhs-rhs;
lhs =y(4)-params(16);
rhs =(y(4)-params(16))*params(8)+x(3);
residual(12)= lhs-rhs;
lhs =log(y(9)/params(25));
rhs =log(y(9)/params(25))*params(9)+x(4);
residual(13)= lhs-rhs;
lhs =y(13);
rhs =y(4)+y(3)+y(1)+y(12);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =100*(y(13)-params(14))/params(14);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =100*(y(1)-params(24))/params(24);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =100*(y(12)-params(23))/params(23);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =100*(y(2)-params(19));
residual(18)= lhs-rhs;
lhs =y(19);
rhs =100*(y(5)-params(20))/params(20);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =100*(y(6)-params(21));
residual(20)= lhs-rhs;
lhs =y(21);
rhs =100*(y(8)-params(22));
residual(21)= lhs-rhs;
lhs =y(22);
rhs =100*(y(3)/y(13)-params(15)/params(14));
residual(22)= lhs-rhs;
lhs =y(23);
rhs =100*(y(4)/y(13)-params(16)/params(14));
residual(23)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(2)*1/(1-y(2))));
  g1(1,2)=(-(params(2)*y(1)/((1-y(2))*(1-y(2)))));
  g1(1,5)=1-y(9);
  g1(1,9)=(-y(5));
  g1(2,6)=(-((1-y(9))*y(10)*params(1)));
  g1(2,9)=(-(y(10)*params(1)*(-y(6))));
  g1(2,10)=1-params(1)*(1-params(3)+(1-y(9))*y(6));
  g1(3,1)=(-((-1)/(y(1)*y(1))));
  g1(3,10)=1;
  g1(4,7)=1-(1-params(3));
  g1(4,12)=(-1);
  g1(5,4)=(-1);
  g1(5,11)=1-(1-params(3));
  g1(6,2)=(-(T48*getPowerDeriv(y(2),1-params(5),1)));
  g1(6,7)=(-(T50*y(14)*y(11)^params(4)*getPowerDeriv(y(7),params(5),1)));
  g1(6,11)=(-(T50*y(7)^params(5)*y(14)*getPowerDeriv(y(11),params(4),1)));
  g1(6,13)=1;
  g1(6,14)=(-(T50*y(11)^params(4)*y(7)^params(5)));
  g1(7,2)=y(5);
  g1(7,5)=y(2);
  g1(7,13)=(-(1-params(5)));
  g1(8,6)=y(7);
  g1(8,7)=y(6);
  g1(8,13)=(-params(5));
  g1(9,14)=T226-params(6)*T226;
  g1(10,2)=(-(y(9)*y(5)));
  g1(10,3)=1;
  g1(10,4)=1;
  g1(10,5)=(-(y(9)*y(2)));
  g1(10,6)=(-(y(9)*y(7)));
  g1(10,7)=(-(y(9)*y(6)));
  g1(10,8)=1;
  g1(10,9)=(-(y(5)*y(2)+y(6)*y(7)));
  g1(11,3)=1-params(7);
  g1(12,4)=1-params(8);
  g1(13,9)=T197-params(9)*T197;
  g1(14,1)=(-1);
  g1(14,3)=(-1);
  g1(14,4)=(-1);
  g1(14,12)=(-1);
  g1(14,13)=1;
  g1(15,13)=(-(100/params(14)));
  g1(15,15)=1;
  g1(16,1)=(-(100/params(24)));
  g1(16,16)=1;
  g1(17,12)=(-(100/params(23)));
  g1(17,17)=1;
  g1(18,2)=(-100);
  g1(18,18)=1;
  g1(19,5)=(-(100/params(20)));
  g1(19,19)=1;
  g1(20,6)=(-100);
  g1(20,20)=1;
  g1(21,8)=(-100);
  g1(21,21)=1;
  g1(22,3)=(-(100*1/y(13)));
  g1(22,13)=(-(100*(-y(3))/(y(13)*y(13))));
  g1(22,22)=1;
  g1(23,4)=(-(100*1/y(13)));
  g1(23,13)=(-(100*(-y(4))/(y(13)*y(13))));
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
