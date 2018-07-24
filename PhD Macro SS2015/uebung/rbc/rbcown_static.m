function [residual, g1, g2] = rbcown_static(y, x, params)
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

residual = zeros( 12, 1);

%
% Model equations
%

T29 = (1-y(3))^(1-params(2));
T31 = y(4)^params(2);
T35 = (T29*T31)^(-params(3));
T38 = y(4)^(params(2)-1);
T46 = (1-y(3))^(-params(2));
T73 = params(4)*y(1)^params(5)+(1-params(4))*y(3)^params(5);
T95 = getPowerDeriv(y(12)/y(1),1-params(5),1);
T101 = getPowerDeriv(T73,1/params(5),1);
T107 = getPowerDeriv(y(12)/y(3),1-params(5),1);
T114 = getPowerDeriv(T29*T31,(-params(3)),1);
lhs =y(10);
rhs =params(4)*(y(12)/y(1))^(1-params(5));
residual(1)= lhs-rhs;
lhs =y(11);
rhs =(1-params(4))*(y(12)/y(3))^(1-params(5));
residual(2)= lhs-rhs;
lhs =y(8);
rhs =T29*params(2)*T35*T38;
residual(3)= lhs-rhs;
lhs =y(9);
rhs =(-(T31*(1-params(2))*T35*T46));
residual(4)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(1)*(1+y(10)*y(5)-params(6));
residual(5)= lhs-rhs;
lhs =y(5);
rhs =params(8)*exp(y(6));
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+x(1);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =T73^(1/params(5));
residual(8)= lhs-rhs;
lhs =y(2);
rhs =y(12)*y(5);
residual(9)= lhs-rhs;
lhs =y(1);
rhs =y(7)+y(1)*(1-params(6));
residual(10)= lhs-rhs;
residual(11) = y(9)/y(8)+y(11)*y(5);
lhs =y(1)+y(4);
rhs =y(12)*y(5)+y(1)*(1-params(6));
residual(12)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(12, 12);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(4)*(-y(12))/(y(1)*y(1))*T95));
  g1(1,10)=1;
  g1(1,12)=(-(params(4)*T95*1/y(1)));
  g1(2,3)=(-((1-params(4))*(-y(12))/(y(3)*y(3))*T107));
  g1(2,11)=1;
  g1(2,12)=(-((1-params(4))*T107*1/y(3)));
  g1(3,3)=(-(params(2)*T35*T38*(-(getPowerDeriv(1-y(3),1-params(2),1)))+T29*T38*params(2)*T31*(-(getPowerDeriv(1-y(3),1-params(2),1)))*T114));
  g1(3,4)=(-(T29*(T38*params(2)*T114*T29*getPowerDeriv(y(4),params(2),1)+params(2)*T35*getPowerDeriv(y(4),params(2)-1,1))));
  g1(3,8)=1;
  g1(4,3)=T46*T31*(1-params(2))*T31*(-(getPowerDeriv(1-y(3),1-params(2),1)))*T114+T31*(1-params(2))*T35*(-(getPowerDeriv(1-y(3),(-params(2)),1)));
  g1(4,4)=T46*((1-params(2))*T35*getPowerDeriv(y(4),params(2),1)+T31*(1-params(2))*T114*T29*getPowerDeriv(y(4),params(2),1));
  g1(4,9)=1;
  g1(5,5)=(-(y(10)*y(8)*params(1)));
  g1(5,8)=1-params(1)*(1+y(10)*y(5)-params(6));
  g1(5,10)=(-(y(8)*params(1)*y(5)));
  g1(6,5)=1;
  g1(6,6)=(-(params(8)*exp(y(6))));
  g1(7,6)=1-params(7);
  g1(8,1)=(-(params(4)*getPowerDeriv(y(1),params(5),1)*T101));
  g1(8,3)=(-(T101*(1-params(4))*getPowerDeriv(y(3),params(5),1)));
  g1(8,12)=1;
  g1(9,2)=1;
  g1(9,5)=(-y(12));
  g1(9,12)=(-y(5));
  g1(10,1)=1-(1-params(6));
  g1(10,7)=(-1);
  g1(11,5)=y(11);
  g1(11,8)=(-y(9))/(y(8)*y(8));
  g1(11,9)=1/y(8);
  g1(11,11)=y(5);
  g1(12,1)=1-(1-params(6));
  g1(12,4)=1;
  g1(12,5)=(-y(12));
  g1(12,12)=(-y(5));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],12,144);
end
end
