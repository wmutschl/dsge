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

residual = zeros( 14, 1);

%
% Model equations
%

T50 = y(2)*y(4)^params(4)*y(13)^params(5);
T52 = y(8)^(1-params(5));
T123 = 1/params(20)/(y(1)/params(20));
T130 = 1/params(17)/(y(2)/params(17));
lhs =y(1);
rhs =(-(params(2)*y(6)/(1-y(8))/y(3)-1));
residual(1)= lhs-rhs;
lhs =y(14);
rhs =y(14)*params(1)*(1-params(3)+(1-y(1))*y(9));
residual(2)= lhs-rhs;
lhs =y(14);
rhs =1/y(6);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =(1-params(3))*y(13)+y(7);
residual(4)= lhs-rhs;
lhs =y(4);
rhs =(1-params(3))*y(4)+y(12);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =T50*T52;
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(5)*(1-params(5))/y(8);
residual(7)= lhs-rhs;
lhs =y(9);
rhs =y(5)*params(5)/y(13);
residual(8)= lhs-rhs;
lhs =log(y(2)/params(17));
rhs =log(y(2)/params(17))*params(9)+params(13)*x(1);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =(y(10)/y(1)+y(12)+y(11)-y(9)*y(13))/y(3);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =params(18)+params(10)*(y(11)-params(18))+params(14)*x(2);
residual(11)= lhs-rhs;
lhs =y(12);
rhs =params(19)+params(11)*(y(12)-params(19))+params(15)*x(3);
residual(12)= lhs-rhs;
lhs =log(y(1)/params(20));
rhs =log(y(1)/params(20))*params(12)+params(16)*x(4);
residual(13)= lhs-rhs;
lhs =y(5);
rhs =y(12)+y(11)+y(6)+y(7);
residual(14)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,3)=(-(params(2)*y(6)/(1-y(8))))/(y(3)*y(3));
  g1(1,6)=params(2)/(1-y(8))/y(3);
  g1(1,8)=params(2)*y(6)/((1-y(8))*(1-y(8)))/y(3);
  g1(2,1)=(-(y(14)*params(1)*(-y(9))));
  g1(2,9)=(-(y(14)*params(1)*(1-y(1))));
  g1(2,14)=1-params(1)*(1-params(3)+(1-y(1))*y(9));
  g1(3,6)=(-((-1)/(y(6)*y(6))));
  g1(3,14)=1;
  g1(4,7)=(-1);
  g1(4,13)=1-(1-params(3));
  g1(5,4)=1-(1-params(3));
  g1(5,12)=(-1);
  g1(6,2)=(-(T52*y(4)^params(4)*y(13)^params(5)));
  g1(6,4)=(-(T52*y(13)^params(5)*y(2)*getPowerDeriv(y(4),params(4),1)));
  g1(6,5)=1;
  g1(6,8)=(-(T50*getPowerDeriv(y(8),1-params(5),1)));
  g1(6,13)=(-(T52*y(2)*y(4)^params(4)*getPowerDeriv(y(13),params(5),1)));
  g1(7,3)=1;
  g1(7,5)=(-((1-params(5))/y(8)));
  g1(7,8)=(-((-(y(5)*(1-params(5))))/(y(8)*y(8))));
  g1(8,5)=(-(params(5)/y(13)));
  g1(8,9)=1;
  g1(8,13)=(-((-(y(5)*params(5)))/(y(13)*y(13))));
  g1(9,2)=T130-params(9)*T130;
  g1(10,1)=(-((-y(10))/(y(1)*y(1))/y(3)));
  g1(10,3)=(-((-(y(10)/y(1)+y(12)+y(11)-y(9)*y(13)))/(y(3)*y(3))));
  g1(10,8)=1;
  g1(10,9)=(-((-y(13))/y(3)));
  g1(10,10)=(-(1/y(1)/y(3)));
  g1(10,11)=(-(1/y(3)));
  g1(10,12)=(-(1/y(3)));
  g1(10,13)=(-((-y(9))/y(3)));
  g1(11,11)=1-params(10);
  g1(12,12)=1-params(11);
  g1(13,1)=T123-params(12)*T123;
  g1(14,5)=1;
  g1(14,6)=(-1);
  g1(14,7)=(-1);
  g1(14,11)=(-1);
  g1(14,12)=(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,196);
end
end
