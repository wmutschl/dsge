function [residual, g1, g2] = baxter_king_static(y, x, params)
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

T48 = y(8)*y(12)^params(4)*y(10)^params(5);
T50 = y(2)^(1-params(5));
T189 = 1/params(13)/(y(5)/params(13));
T198 = 1/params(10)/(y(8)/params(10));
lhs =(1-y(5))*y(3);
rhs =params(2)*y(1)/(1-y(2));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =params(1)*y(6)*(1-params(3)+(1-y(5))*y(4));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =1/y(1);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =(1-params(3))*y(10)+y(11);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =(1-params(3))*y(12)+y(13);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =T48*T50;
residual(6)= lhs-rhs;
lhs =y(3)*y(2);
rhs =y(9)*(1-params(5));
residual(7)= lhs-rhs;
lhs =y(4)*y(10);
rhs =y(9)*params(5);
residual(8)= lhs-rhs;
lhs =log(y(8)/params(10));
rhs =log(y(8)/params(10))*params(6)+x(1);
residual(9)= lhs-rhs;
lhs =y(13)+y(14)+y(7);
rhs =y(5)*(y(3)*y(2)+y(4)*y(10));
residual(10)= lhs-rhs;
lhs =y(14)-params(11);
rhs =(y(14)-params(11))*params(7)+x(2);
residual(11)= lhs-rhs;
lhs =y(13)-params(12);
rhs =(y(13)-params(12))*params(8)+x(3);
residual(12)= lhs-rhs;
lhs =log(y(5)/params(13));
rhs =log(y(5)/params(13))*params(9)+x(4);
residual(13)= lhs-rhs;
lhs =y(9);
rhs =y(11)+y(13)+y(1)+y(14);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =100*(y(9)-params(14))/params(14);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =100*(y(1)-params(18))/params(18);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =100*(y(11)-params(15))/params(15);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =100*(y(2)-params(16));
residual(18)= lhs-rhs;
lhs =y(19);
rhs =100*(y(3)-params(17))/params(17);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =100*(y(4)-params(20));
residual(20)= lhs-rhs;
lhs =y(21);
rhs =100*(y(7)-params(19));
residual(21)= lhs-rhs;
lhs =y(22);
rhs =100*(y(14)/y(9)-params(11)/params(14));
residual(22)= lhs-rhs;
lhs =y(23);
rhs =100*(y(13)/y(9)-params(12)/params(14));
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
  g1(1,3)=1-y(5);
  g1(1,5)=(-y(3));
  g1(2,4)=(-(params(1)*(1-y(5))*y(6)));
  g1(2,5)=(-(params(1)*y(6)*(-y(4))));
  g1(2,6)=1-params(1)*(1-params(3)+(1-y(5))*y(4));
  g1(3,1)=(-((-1)/(y(1)*y(1))));
  g1(3,6)=1;
  g1(4,10)=1-(1-params(3));
  g1(4,11)=(-1);
  g1(5,12)=1-(1-params(3));
  g1(5,13)=(-1);
  g1(6,2)=(-(T48*getPowerDeriv(y(2),1-params(5),1)));
  g1(6,8)=(-(T50*y(12)^params(4)*y(10)^params(5)));
  g1(6,9)=1;
  g1(6,10)=(-(T50*y(8)*y(12)^params(4)*getPowerDeriv(y(10),params(5),1)));
  g1(6,12)=(-(T50*y(10)^params(5)*y(8)*getPowerDeriv(y(12),params(4),1)));
  g1(7,2)=y(3);
  g1(7,3)=y(2);
  g1(7,9)=(-(1-params(5)));
  g1(8,4)=y(10);
  g1(8,9)=(-params(5));
  g1(8,10)=y(4);
  g1(9,8)=T198-params(6)*T198;
  g1(10,2)=(-(y(5)*y(3)));
  g1(10,3)=(-(y(5)*y(2)));
  g1(10,4)=(-(y(5)*y(10)));
  g1(10,5)=(-(y(3)*y(2)+y(4)*y(10)));
  g1(10,7)=1;
  g1(10,10)=(-(y(5)*y(4)));
  g1(10,13)=1;
  g1(10,14)=1;
  g1(11,14)=1-params(7);
  g1(12,13)=1-params(8);
  g1(13,5)=T189-params(9)*T189;
  g1(14,1)=(-1);
  g1(14,9)=1;
  g1(14,11)=(-1);
  g1(14,13)=(-1);
  g1(14,14)=(-1);
  g1(15,9)=(-(100*1/params(14)));
  g1(15,15)=1;
  g1(16,1)=(-(100*1/params(18)));
  g1(16,16)=1;
  g1(17,11)=(-(100*1/params(15)));
  g1(17,17)=1;
  g1(18,2)=(-100);
  g1(18,18)=1;
  g1(19,3)=(-(100*1/params(17)));
  g1(19,19)=1;
  g1(20,4)=(-100);
  g1(20,20)=1;
  g1(21,7)=(-100);
  g1(21,21)=1;
  g1(22,9)=(-(100*(-y(14))/(y(9)*y(9))));
  g1(22,14)=(-(100*1/y(9)));
  g1(22,22)=1;
  g1(23,9)=(-(100*(-y(13))/(y(9)*y(9))));
  g1(23,13)=(-(100*1/y(9)));
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
