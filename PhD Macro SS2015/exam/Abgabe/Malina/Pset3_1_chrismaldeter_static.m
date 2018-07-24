function [residual, g1, g2] = Pset3_1_chrismaldeter_static(y, x, params)
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

T19 = 1/y(2);
T58 = y(12)*y(4)^params(3)*y(3)^params(4);
T59 = y(5)^(1-params(4));
T196 = (-(100*(1/y(1)-1/(y(1)))));
T218 = ((y(12))-y(12))/((y(12))*(y(12)))/(y(12)/(y(12)));
T230 = ((y(21))-y(21))/((y(21))*(y(21)))/(y(21)/(y(21)));
lhs =(1-y(21))*y(9);
rhs =params(6)*y(2)/(1-y(5));
residual(1)= lhs-rhs;
lhs =T19;
rhs =params(1)*T19*(1-params(2)+(1-y(21))*y(10));
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(7)+y(8)+y(6);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(7)+(1-params(2))*y(3);
residual(4)= lhs-rhs;
lhs =y(4);
rhs =y(6)+(1-params(2))*y(4);
residual(5)= lhs-rhs;
lhs =y(9)*y(5);
rhs =y(1)*(1-params(4));
residual(6)= lhs-rhs;
lhs =y(10)*y(3);
rhs =y(1)*params(4);
residual(7)= lhs-rhs;
lhs =y(1);
rhs =T58*T59;
residual(8)= lhs-rhs;
lhs =y(8)+y(6)+y(11);
rhs =y(21)*(y(9)*y(5)+y(10)*y(3));
residual(9)= lhs-rhs;
lhs =y(8)-(y(8));
rhs =(y(8)-(y(8)))*params(5);
residual(10)= lhs-rhs;
lhs =y(6)-(y(6));
rhs =params(5)*(y(6)-(y(6)));
residual(11)= lhs-rhs;
lhs =log(y(21)/(y(21)));
rhs =params(5)*log(y(21)/(y(21)));
residual(12)= lhs-rhs;
lhs =log(y(12)/(y(12)));
rhs =params(5)*log(y(12)/(y(12)));
residual(13)= lhs-rhs;
lhs =y(13);
rhs =100*(y(1)-(y(1)))/(y(1));
residual(14)= lhs-rhs;
lhs =y(14);
rhs =100*(y(2)-(y(2)))/(y(2));
residual(15)= lhs-rhs;
lhs =y(15);
rhs =100*(y(7)-(y(7)))/(y(7));
residual(16)= lhs-rhs;
lhs =y(16);
rhs =100*(y(5)-(y(5)));
residual(17)= lhs-rhs;
lhs =y(17);
rhs =100*(y(9)-(y(9)))/(y(9));
residual(18)= lhs-rhs;
lhs =y(18);
rhs =100*(y(10)-(y(10)));
residual(19)= lhs-rhs;
lhs =y(19);
rhs =100*(y(11)-(y(11)));
residual(20)= lhs-rhs;
lhs =y(20);
rhs =100*(y(8)/y(1)-(y(8))/(y(1)));
residual(21)= lhs-rhs;
lhs =y(22);
rhs =100*(y(6)/y(1)-(y(6))/(y(1)));
residual(22)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(22, 22);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-(params(6)/(1-y(5))));
  g1(1,5)=(-(params(6)*y(2)/((1-y(5))*(1-y(5)))));
  g1(1,9)=1-y(21);
  g1(1,21)=(-y(9));
  g1(2,2)=(-1)/(y(2)*y(2))-params(1)*(1-params(2)+(1-y(21))*y(10))*(-1)/(y(2)*y(2));
  g1(2,10)=(-(params(1)*(1-y(21))*T19));
  g1(2,21)=(-(params(1)*T19*(-y(10))));
  g1(3,1)=1;
  g1(3,2)=(-1);
  g1(3,6)=(-1);
  g1(3,7)=(-1);
  g1(3,8)=(-1);
  g1(4,3)=1-(1-params(2));
  g1(4,7)=(-1);
  g1(5,4)=1-(1-params(2));
  g1(5,6)=(-1);
  g1(6,1)=(-(1-params(4)));
  g1(6,5)=y(9);
  g1(6,9)=y(5);
  g1(7,1)=(-params(4));
  g1(7,3)=y(10);
  g1(7,10)=y(3);
  g1(8,1)=1;
  g1(8,3)=(-(T59*y(12)*y(4)^params(3)*getPowerDeriv(y(3),params(4),1)));
  g1(8,4)=(-(T59*y(3)^params(4)*y(12)*getPowerDeriv(y(4),params(3),1)));
  g1(8,5)=(-(T58*getPowerDeriv(y(5),1-params(4),1)));
  g1(8,12)=(-(T59*y(4)^params(3)*y(3)^params(4)));
  g1(9,3)=(-(y(21)*y(10)));
  g1(9,5)=(-(y(21)*y(9)));
  g1(9,6)=1;
  g1(9,8)=1;
  g1(9,9)=(-(y(21)*y(5)));
  g1(9,10)=(-(y(21)*y(3)));
  g1(9,11)=1;
  g1(9,21)=(-(y(9)*y(5)+y(10)*y(3)));
  g1(12,21)=T230-params(5)*T230;
  g1(13,12)=T218-params(5)*T218;
  g1(14,1)=(-((-(100*(y(1)-(y(1)))))/((y(1))*(y(1)))));
  g1(14,13)=1;
  g1(15,2)=(-((-(100*(y(2)-(y(2)))))/((y(2))*(y(2)))));
  g1(15,14)=1;
  g1(16,7)=(-((-(100*(y(7)-(y(7)))))/((y(7))*(y(7)))));
  g1(16,15)=1;
  g1(17,16)=1;
  g1(18,9)=(-((-(100*(y(9)-(y(9)))))/((y(9))*(y(9)))));
  g1(18,17)=1;
  g1(19,18)=1;
  g1(20,19)=1;
  g1(21,1)=(-(100*((-y(8))/(y(1)*y(1))-(-(y(8)))/((y(1))*(y(1))))));
  g1(21,8)=T196;
  g1(21,20)=1;
  g1(22,1)=(-(100*((-y(6))/(y(1)*y(1))-(-(y(6)))/((y(1))*(y(1))))));
  g1(22,6)=T196;
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
