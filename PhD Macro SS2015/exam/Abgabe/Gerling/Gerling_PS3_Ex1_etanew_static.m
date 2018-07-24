function [residual, g1, g2] = Gerling_PS3_Ex1_etanew_static(y, x, params)
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

T19 = 1/y(13);
T46 = y(22)*y(20)^params(3)*y(19)^params(5);
T48 = y(11)^(1-params(5));
T210 = 1/params(22)/(y(21)/params(22));
T217 = 1/params(21)/(y(22)/params(21));
lhs =(1-y(21))*y(9);
rhs =params(4)*y(13)/(1-y(11));
residual(1)= lhs-rhs;
lhs =T19;
rhs =params(1)*T19*(1-params(2)+(1-y(21))*y(17));
residual(2)= lhs-rhs;
lhs =y(19);
rhs =(1-params(2))*y(19)+y(15);
residual(3)= lhs-rhs;
lhs =y(20);
rhs =(1-params(2))*y(20)+y(5);
residual(4)= lhs-rhs;
lhs =y(1);
rhs =T46*T48;
residual(5)= lhs-rhs;
lhs =y(9)*y(11);
rhs =y(1)*(1-params(5));
residual(6)= lhs-rhs;
lhs =y(17)*y(19);
rhs =y(1)*params(5);
residual(7)= lhs-rhs;
lhs =log(y(22)/params(21));
rhs =log(y(22)/params(21))*params(6)+x(1);
residual(8)= lhs-rhs;
lhs =y(5)+y(3)+y(7);
rhs =y(21)*(y(9)*y(11)+y(17)*y(19));
residual(9)= lhs-rhs;
lhs =y(3)-params(11);
rhs =(y(3)-params(11))*params(7)+x(2);
residual(10)= lhs-rhs;
lhs =y(5)-params(12);
rhs =(y(5)-params(12))*params(8)+x(3);
residual(11)= lhs-rhs;
lhs =log(y(21)/params(22));
rhs =log(y(21)/params(22))*params(9)+x(4);
residual(12)= lhs-rhs;
lhs =y(1);
rhs =y(5)+y(3)+y(13)+y(15);
residual(13)= lhs-rhs;
lhs =y(2);
rhs =100*(y(1)-params(10))/params(10);
residual(14)= lhs-rhs;
lhs =y(14);
rhs =100*(y(13)-params(16))/params(16);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =100*(y(15)-params(17))/params(17);
residual(16)= lhs-rhs;
lhs =y(12);
rhs =100*(y(11)-params(15))/params(15);
residual(17)= lhs-rhs;
lhs =y(10);
rhs =100*(y(9)-params(14))/params(14);
residual(18)= lhs-rhs;
lhs =y(18);
rhs =100*(y(17)-params(18));
residual(19)= lhs-rhs;
lhs =y(8);
rhs =100*(y(7)-params(13));
residual(20)= lhs-rhs;
lhs =y(4);
rhs =(y(3)-params(11))*100/params(11);
residual(21)= lhs-rhs;
lhs =y(6);
rhs =(y(5)-params(12))*100/params(12);
residual(22)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(22, 22);

  %
  % Jacobian matrix
  %

  g1(1,9)=1-y(21);
  g1(1,11)=(-(params(4)*y(13)/((1-y(11))*(1-y(11)))));
  g1(1,13)=(-(params(4)*1/(1-y(11))));
  g1(1,21)=(-y(9));
  g1(2,13)=(-1)/(y(13)*y(13))-params(1)*(1-params(2)+(1-y(21))*y(17))*(-1)/(y(13)*y(13));
  g1(2,17)=(-(params(1)*(1-y(21))*T19));
  g1(2,21)=(-(params(1)*T19*(-y(17))));
  g1(3,15)=(-1);
  g1(3,19)=1-(1-params(2));
  g1(4,5)=(-1);
  g1(4,20)=1-(1-params(2));
  g1(5,1)=1;
  g1(5,11)=(-(T46*getPowerDeriv(y(11),1-params(5),1)));
  g1(5,19)=(-(T48*y(22)*y(20)^params(3)*getPowerDeriv(y(19),params(5),1)));
  g1(5,20)=(-(T48*y(19)^params(5)*y(22)*getPowerDeriv(y(20),params(3),1)));
  g1(5,22)=(-(T48*y(20)^params(3)*y(19)^params(5)));
  g1(6,1)=(-(1-params(5)));
  g1(6,9)=y(11);
  g1(6,11)=y(9);
  g1(7,1)=(-params(5));
  g1(7,17)=y(19);
  g1(7,19)=y(17);
  g1(8,22)=T217-params(6)*T217;
  g1(9,3)=1;
  g1(9,5)=1;
  g1(9,7)=1;
  g1(9,9)=(-(y(21)*y(11)));
  g1(9,11)=(-(y(21)*y(9)));
  g1(9,17)=(-(y(21)*y(19)));
  g1(9,19)=(-(y(21)*y(17)));
  g1(9,21)=(-(y(9)*y(11)+y(17)*y(19)));
  g1(10,3)=1-params(7);
  g1(11,5)=1-params(8);
  g1(12,21)=T210-params(9)*T210;
  g1(13,1)=1;
  g1(13,3)=(-1);
  g1(13,5)=(-1);
  g1(13,13)=(-1);
  g1(13,15)=(-1);
  g1(14,1)=(-(100/params(10)));
  g1(14,2)=1;
  g1(15,13)=(-(100/params(16)));
  g1(15,14)=1;
  g1(16,15)=(-(100/params(17)));
  g1(16,16)=1;
  g1(17,11)=(-(100/params(15)));
  g1(17,12)=1;
  g1(18,9)=(-(100/params(14)));
  g1(18,10)=1;
  g1(19,17)=(-100);
  g1(19,18)=1;
  g1(20,7)=(-100);
  g1(20,8)=1;
  g1(21,3)=(-(100/params(11)));
  g1(21,4)=1;
  g1(22,5)=(-(100/params(12)));
  g1(22,6)=1;
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
