function [residual, g1, g2, g3] = cggnonlinear_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           columns: equations in order of declaration
%                                                           rows: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(7, 1);
lhs =y(11);
rhs =params(8)*y(4)+params(9)*x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =params(7)*y(3)+params(10)*x(it_, 2);
residual(2)= lhs-rhs;
lhs =y(5);
rhs =params(4)*y(12)+params(5)*y(7);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =y(13)-(y(8)-y(12)-y(9));
residual(4)= lhs-rhs;
lhs =y(8);
rhs =params(11)*y(2)+(1-params(11))*(y(5)*params(12)+y(7)*params(13));
residual(5)= lhs-rhs;
lhs =y(9);
rhs =y(11)*params(8)+y(10)*(1-params(7))/(1+params(3));
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(11)+y(7)-y(1)-(y(10)-y(3))/(1+params(3));
residual(7)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(7, 15);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-params(8));
  g1(1,11)=1;
  g1(1,14)=(-params(9));
  g1(2,3)=(-params(7));
  g1(2,10)=1;
  g1(2,15)=(-params(10));
  g1(3,5)=1;
  g1(3,12)=(-params(4));
  g1(3,7)=(-params(5));
  g1(4,12)=(-1);
  g1(4,7)=1;
  g1(4,13)=(-1);
  g1(4,8)=1;
  g1(4,9)=(-1);
  g1(5,5)=(-((1-params(11))*params(12)));
  g1(5,7)=(-((1-params(11))*params(13)));
  g1(5,2)=(-params(11));
  g1(5,8)=1;
  g1(6,9)=1;
  g1(6,10)=(-((1-params(7))/(1+params(3))));
  g1(6,11)=(-params(8));
  g1(7,6)=1;
  g1(7,1)=1;
  g1(7,7)=(-1);
  g1(7,3)=(-1)/(1+params(3));
  g1(7,10)=1/(1+params(3));
  g1(7,11)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,3375);
end
end
