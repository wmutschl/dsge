function [residual, g1, g2] = Baxter_King_static(y, x, params)
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

T48 = y(13)*y(8)^params(2)*y(7)^params(3);
T50 = y(14)^(1-params(3));
T199 = 1/params(20)/(y(11)/params(20));
T206 = 1/params(22)/(y(13)/params(22));
lhs =(1-y(11))*y(10);
rhs =params(4)*y(2)/(1-y(14));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(1)*(1-params(5)+(1-y(11))*y(9));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =1/y(2);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =(1-params(5))*y(7)+y(3);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =(1-params(5))*y(8)+y(5);
residual(5)= lhs-rhs;
lhs =y(1);
rhs =T48*T50;
residual(6)= lhs-rhs;
lhs =y(10)*y(14);
rhs =y(1)*(1-params(3));
residual(7)= lhs-rhs;
lhs =y(9)*y(7);
rhs =y(1)*params(3);
residual(8)= lhs-rhs;
lhs =log(y(13)/params(22));
rhs =log(y(13)/params(22))*params(8)+x(1);
residual(9)= lhs-rhs;
lhs =y(5)+y(4)+y(12);
rhs =y(11)*(y(10)*y(14)+y(9)*y(7));
residual(10)= lhs-rhs;
lhs =y(4)-params(13);
rhs =(y(4)-params(13))*params(6)+x(2);
residual(11)= lhs-rhs;
lhs =y(5)-params(14);
rhs =(y(5)-params(14))*params(7)+x(3);
residual(12)= lhs-rhs;
lhs =log(y(11)/params(20));
rhs =log(y(11)/params(20))*params(9)+x(4);
residual(13)= lhs-rhs;
lhs =y(1);
rhs =y(5)+y(4)+y(2)+y(3);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =100*(y(1)-params(10))/params(10);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =100*(y(2)-params(11))/params(11);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =100*(y(3)-params(12))/params(12);
residual(17)= lhs-rhs;
lhs =y(21);
rhs =100*(y(14)-params(23));
residual(18)= lhs-rhs;
lhs =y(18);
rhs =100*(y(10)-params(19))/params(19);
residual(19)= lhs-rhs;
lhs =y(22);
rhs =100*(y(9)-params(18));
residual(20)= lhs-rhs;
lhs =y(23);
rhs =100*(y(12)-params(21));
residual(21)= lhs-rhs;
lhs =y(19);
rhs =100*(y(4)/params(10)-params(13)/params(10));
residual(22)= lhs-rhs;
lhs =y(20);
rhs =100*(y(5)/params(10)-params(14)/params(10));
residual(23)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-(params(4)/(1-y(14))));
  g1(1,10)=1-y(11);
  g1(1,11)=(-y(10));
  g1(1,14)=(-(params(4)*y(2)/((1-y(14))*(1-y(14)))));
  g1(2,6)=1-params(1)*(1-params(5)+(1-y(11))*y(9));
  g1(2,9)=(-((1-y(11))*y(6)*params(1)));
  g1(2,11)=(-(y(6)*params(1)*(-y(9))));
  g1(3,2)=(-((-1)/(y(2)*y(2))));
  g1(3,6)=1;
  g1(4,3)=(-1);
  g1(4,7)=1-(1-params(5));
  g1(5,5)=(-1);
  g1(5,8)=1-(1-params(5));
  g1(6,1)=1;
  g1(6,7)=(-(T50*y(13)*y(8)^params(2)*getPowerDeriv(y(7),params(3),1)));
  g1(6,8)=(-(T50*y(7)^params(3)*y(13)*getPowerDeriv(y(8),params(2),1)));
  g1(6,13)=(-(T50*y(8)^params(2)*y(7)^params(3)));
  g1(6,14)=(-(T48*getPowerDeriv(y(14),1-params(3),1)));
  g1(7,1)=(-(1-params(3)));
  g1(7,10)=y(14);
  g1(7,14)=y(10);
  g1(8,1)=(-params(3));
  g1(8,7)=y(9);
  g1(8,9)=y(7);
  g1(9,13)=T206-params(8)*T206;
  g1(10,4)=1;
  g1(10,5)=1;
  g1(10,7)=(-(y(11)*y(9)));
  g1(10,9)=(-(y(11)*y(7)));
  g1(10,10)=(-(y(11)*y(14)));
  g1(10,11)=(-(y(10)*y(14)+y(9)*y(7)));
  g1(10,12)=1;
  g1(10,14)=(-(y(11)*y(10)));
  g1(11,4)=1-params(6);
  g1(12,5)=1-params(7);
  g1(13,11)=T199-params(9)*T199;
  g1(14,1)=1;
  g1(14,2)=(-1);
  g1(14,3)=(-1);
  g1(14,4)=(-1);
  g1(14,5)=(-1);
  g1(15,1)=(-(100/params(10)));
  g1(15,15)=1;
  g1(16,2)=(-(100/params(11)));
  g1(16,16)=1;
  g1(17,3)=(-(100/params(12)));
  g1(17,17)=1;
  g1(18,14)=(-100);
  g1(18,21)=1;
  g1(19,10)=(-(100/params(19)));
  g1(19,18)=1;
  g1(20,9)=(-100);
  g1(20,22)=1;
  g1(21,12)=(-100);
  g1(21,23)=1;
  g1(22,4)=(-(100*1/params(10)));
  g1(22,19)=1;
  g1(23,5)=(-(100*1/params(10)));
  g1(23,20)=1;
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
