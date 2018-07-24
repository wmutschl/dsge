function [residual, g1, g2] = Exercise1_static(y, x, params)
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

residual = zeros( 13, 1);

%
% Model equations
%

T45 = y(4)*y(10)^params(4)*y(9)^params(1);
T47 = y(11)^(1-params(1));
T103 = 1/params(10)/(y(1)/params(10));
T116 = 1/params(11)/(y(4)/params(11));
lhs =(1-y(1))*y(3);
rhs =params(5)*y(5)/(1-y(11));
residual(1)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(2)*(1-params(3)+(1-y(1))*y(2));
residual(2)= lhs-rhs;
lhs =y(9);
rhs =(1-params(3))*y(9)+y(7);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =(1-params(3))*y(10)+y(8);
residual(4)= lhs-rhs;
lhs =y(13);
rhs =T45*T47;
residual(5)= lhs-rhs;
lhs =y(3)*y(11);
rhs =y(13)*(1-params(1));
residual(6)= lhs-rhs;
lhs =y(2)*y(9);
rhs =y(13)*params(1);
residual(7)= lhs-rhs;
lhs =y(8)+y(6)+y(12);
rhs =y(1)*(y(3)*y(11)+y(2)*y(9));
residual(8)= lhs-rhs;
lhs =log(y(4)/params(11));
rhs =log(y(4)/params(11))*params(7)+x(2);
residual(9)= lhs-rhs;
lhs =log(y(1)/params(10));
rhs =log(y(1)/params(10))*params(6)+x(1);
residual(10)= lhs-rhs;
lhs =y(6)-0.2;
rhs =(y(6)-0.2)*params(8)+x(3);
residual(11)= lhs-rhs;
lhs =y(8)-0.02;
rhs =(y(8)-0.02)*params(9)+x(4);
residual(12)= lhs-rhs;
lhs =y(13);
rhs =y(8)+y(6)+y(5)+y(7);
residual(13)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(13, 13);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-y(3));
  g1(1,3)=1-y(1);
  g1(1,5)=(-(params(5)/(1-y(11))));
  g1(1,11)=(-(params(5)*y(5)/((1-y(11))*(1-y(11)))));
  g1(2,1)=(-(y(5)*params(2)*(-y(2))));
  g1(2,2)=(-((1-y(1))*y(5)*params(2)));
  g1(2,5)=1-params(2)*(1-params(3)+(1-y(1))*y(2));
  g1(3,7)=(-1);
  g1(3,9)=1-(1-params(3));
  g1(4,8)=(-1);
  g1(4,10)=1-(1-params(3));
  g1(5,4)=(-(T47*y(10)^params(4)*y(9)^params(1)));
  g1(5,9)=(-(T47*y(4)*y(10)^params(4)*getPowerDeriv(y(9),params(1),1)));
  g1(5,10)=(-(T47*y(9)^params(1)*y(4)*getPowerDeriv(y(10),params(4),1)));
  g1(5,11)=(-(T45*getPowerDeriv(y(11),1-params(1),1)));
  g1(5,13)=1;
  g1(6,3)=y(11);
  g1(6,11)=y(3);
  g1(6,13)=(-(1-params(1)));
  g1(7,2)=y(9);
  g1(7,9)=y(2);
  g1(7,13)=(-params(1));
  g1(8,1)=(-(y(3)*y(11)+y(2)*y(9)));
  g1(8,2)=(-(y(1)*y(9)));
  g1(8,3)=(-(y(1)*y(11)));
  g1(8,6)=1;
  g1(8,8)=1;
  g1(8,9)=(-(y(1)*y(2)));
  g1(8,11)=(-(y(1)*y(3)));
  g1(8,12)=1;
  g1(9,4)=T116-params(7)*T116;
  g1(10,1)=T103-params(6)*T103;
  g1(11,6)=1-params(8);
  g1(12,8)=1-params(9);
  g1(13,5)=(-1);
  g1(13,6)=(-1);
  g1(13,7)=(-1);
  g1(13,8)=(-1);
  g1(13,13)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,169);
end
end
