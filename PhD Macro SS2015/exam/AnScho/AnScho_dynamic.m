function [residual, g1, g2, g3] = AnScho_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(9, 1);
bet__ = 1/(1+params(8)/400);
lhs =y(5);
rhs =y(14)+y(9)-y(16)-1/params(1)*(y(8)-y(15)-y(17));
residual(1)= lhs-rhs;
lhs =y(7);
rhs =y(15)*bet__+params(2)*(y(5)-y(9));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(5)-y(9);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =params(5)*y(2)+y(7)*(1-params(5))*params(3)+(y(5)-y(9))*(1-params(5))*params(4)+params(11)/100*x(it_, 3);
residual(4)= lhs-rhs;
lhs =y(9);
rhs =params(6)*y(3)+params(12)/100*x(it_, 2);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =params(7)*y(4)+params(13)/100*x(it_, 1);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =params(10)+100*(y(10)+y(5)-y(1));
residual(7)= lhs-rhs;
lhs =y(12);
rhs =params(9)+400*y(7);
residual(8)= lhs-rhs;
lhs =y(13);
rhs =params(8)+params(9)+params(10)*4+400*y(8);
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 20);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,14)=(-1);
  g1(1,15)=(-(1/params(1)));
  g1(1,8)=1/params(1);
  g1(1,9)=(-1);
  g1(1,16)=1;
  g1(1,17)=(-(1/params(1)));
  g1(2,5)=(-params(2));
  g1(2,7)=1;
  g1(2,15)=(-bet__);
  g1(2,9)=params(2);
  g1(3,5)=(-1);
  g1(3,6)=1;
  g1(3,9)=1;
  g1(4,5)=(-((1-params(5))*params(4)));
  g1(4,7)=(-((1-params(5))*params(3)));
  g1(4,2)=(-params(5));
  g1(4,8)=1;
  g1(4,9)=(1-params(5))*params(4);
  g1(4,20)=(-(params(11)/100));
  g1(5,3)=(-params(6));
  g1(5,9)=1;
  g1(5,19)=(-(params(12)/100));
  g1(6,4)=(-params(7));
  g1(6,10)=1;
  g1(6,18)=(-(params(13)/100));
  g1(7,1)=100;
  g1(7,5)=(-100);
  g1(7,10)=(-100);
  g1(7,11)=1;
  g1(8,7)=(-400);
  g1(8,12)=1;
  g1(9,8)=(-400);
  g1(9,13)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,400);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,8000);
end
end
