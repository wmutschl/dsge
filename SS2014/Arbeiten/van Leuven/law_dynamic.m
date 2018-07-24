function [residual, g1, g2, g3] = law_dynamic(y, x, params, steady_state, it_)
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
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(5, 1);
lhs =y(2);
rhs =params(6)*y(7)+params(5)*(params(4)*(1+params(7))*y(3)+params(8)*y(4));
residual(1)= lhs-rhs;
lhs =y(3);
rhs =(-(y(4)-y(7)-y(5)))+y(8);
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(7)*params(9)+y(3)*params(10);
residual(3)= lhs-rhs;
lhs =y(5);
rhs =1/params(4)*(params(3)-1)*log(y(6));
residual(4)= lhs-rhs;
lhs =log(y(6));
rhs =params(3)*log(y(1))+params(1)*x(it_, 1);
residual(5)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(5, 9);

  %
  % Jacobian matrix
  %

  g1(1,2)=1;
  g1(1,7)=(-params(6));
  g1(1,3)=(-(params(5)*params(4)*(1+params(7))));
  g1(1,4)=(-(params(5)*params(8)));
  g1(2,7)=(-1);
  g1(2,3)=1;
  g1(2,8)=(-1);
  g1(2,4)=1;
  g1(2,5)=(-1);
  g1(3,7)=(-params(9));
  g1(3,3)=(-params(10));
  g1(3,4)=1;
  g1(4,5)=1;
  g1(4,6)=(-(1/params(4)*(params(3)-1)*1/y(6)));
  g1(5,1)=(-(params(3)*1/y(1)));
  g1(5,6)=1/y(6);
  g1(5,9)=(-params(1));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],5,81);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,729);
end
end
