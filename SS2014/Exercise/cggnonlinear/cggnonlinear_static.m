function [residual, g1, g2] = cggnonlinear_static(y, x, params)
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
%                                                    columns: equations in order of declaration
%                                                    rows: variables in declaration order
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: equations in order of declaration
%                                                       rows: variables in declaration order
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 7, 1);

%
% Model equations
%

lhs =y(7);
rhs =y(7)*params(8)+params(9)*x(1);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+params(10)*x(2);
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(4)+params(5)*y(3);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(3)-(y(4)-y(1)-y(5));
residual(4)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(11)+(1-params(11))*(y(1)*params(12)+y(3)*params(13));
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(7)*params(8)+y(6)*(1-params(7))/(1+params(3));
residual(6)= lhs-rhs;
lhs =y(2);
rhs =y(7);
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

  %
  % Jacobian matrix
  %

  g1(1,7)=1-params(8);
  g1(2,6)=1-params(7);
  g1(3,1)=1-params(4);
  g1(3,3)=(-params(5));
  g1(4,1)=(-1);
  g1(4,4)=1;
  g1(4,5)=(-1);
  g1(5,1)=(-((1-params(11))*params(12)));
  g1(5,3)=(-((1-params(11))*params(13)));
  g1(5,4)=1-params(11);
  g1(6,5)=1;
  g1(6,6)=(-((1-params(7))/(1+params(3))));
  g1(6,7)=(-params(8));
  g1(7,2)=1;
  g1(7,7)=(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,49);
end
end
