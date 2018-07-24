function [residual, g1, g2, g3] = rbc_static(y, x, params)
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
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
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

T18 = params(4)*y(1)^params(5)+(1-params(4))*y(3)^params(5);
T37 = (1-y(3))^(1-params(2));
T39 = y(4)^params(2);
T43 = (T37*T39)^(-params(3));
T46 = y(4)^(params(2)-1);
T47 = params(2)*T43*T46;
T54 = (1-y(3))^(-params(2));
lhs =y(12);
rhs =T18^(1/params(5));
residual(1)= lhs-rhs;
lhs =y(10);
rhs =params(4)*(y(12)/y(1))^(1-params(5));
residual(2)= lhs-rhs;
lhs =y(11);
rhs =(1-params(4))*(y(12)/y(3))^(1-params(5));
residual(3)= lhs-rhs;
lhs =y(8);
rhs =T37*T47;
residual(4)= lhs-rhs;
lhs =y(9);
rhs =(-(T39*(1-params(2))*T43*T54));
residual(5)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(1)*(1+y(10)*y(5)-params(6));
residual(6)= lhs-rhs;
lhs =y(5);
rhs =params(8)*exp(y(6));
residual(7)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+x(1);
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

T94 = getPowerDeriv(T18,1/params(5),1);
T100 = getPowerDeriv(y(12)/y(1),1-params(5),1);
T111 = getPowerDeriv(y(12)/y(3),1-params(5),1);
T116 = (-(getPowerDeriv(1-y(3),1-params(2),1)));
T118 = getPowerDeriv(T37*T39,(-params(3)),1);
T134 = getPowerDeriv(y(4),params(2),1);
  g1(1,1)=(-(params(4)*getPowerDeriv(y(1),params(5),1)*T94));
  g1(1,3)=(-(T94*(1-params(4))*getPowerDeriv(y(3),params(5),1)));
  g1(1,12)=1;
  g1(2,1)=(-(params(4)*(-y(12))/(y(1)*y(1))*T100));
  g1(2,10)=1;
  g1(2,12)=(-(params(4)*T100*1/y(1)));
  g1(3,3)=(-((1-params(4))*(-y(12))/(y(3)*y(3))*T111));
  g1(3,11)=1;
  g1(3,12)=(-((1-params(4))*T111*1/y(3)));
  g1(4,3)=(-(T47*T116+T37*T46*params(2)*T39*T116*T118));
  g1(4,4)=(-(T37*(T46*params(2)*T118*T37*T134+params(2)*T43*getPowerDeriv(y(4),params(2)-1,1))));
  g1(4,8)=1;
  g1(5,3)=T54*T39*(1-params(2))*T39*T116*T118+T39*(1-params(2))*T43*(-(getPowerDeriv(1-y(3),(-params(2)),1)));
  g1(5,4)=T54*((1-params(2))*T43*T134+T39*(1-params(2))*T118*T37*T134);
  g1(5,9)=1;
  g1(6,5)=(-(y(10)*y(8)*params(1)));
  g1(6,8)=1-params(1)*(1+y(10)*y(5)-params(6));
  g1(6,10)=(-(y(8)*params(1)*y(5)));
  g1(7,5)=1;
  g1(7,6)=(-(params(8)*exp(y(6))));
  g1(8,6)=1-params(7);
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
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],12,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,1728);
end
end
end
end
