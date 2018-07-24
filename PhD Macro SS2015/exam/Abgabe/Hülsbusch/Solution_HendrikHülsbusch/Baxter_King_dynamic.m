function [residual, g1, g2, g3] = Baxter_King_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(14, 1);
T54 = y(8)*y(3)^params(4)*y(6)^params(5);
T56 = y(14)^(1-params(5));
lhs =y(7);
rhs =(-(params(2)*y(12)/(1-y(14))/y(9)-1));
residual(1)= lhs-rhs;
lhs =y(20);
rhs =params(1)*y(23)*(1-params(3)+(1-y(21))*y(22));
residual(2)= lhs-rhs;
lhs =y(20);
rhs =1/y(12);
residual(3)= lhs-rhs;
lhs =y(19);
rhs =(1-params(3))*y(6)+y(13);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =(1-params(3))*y(3)+y(18);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =T54*T56;
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(11)*(1-params(5))/y(14);
residual(7)= lhs-rhs;
lhs =y(15);
rhs =y(11)*params(5)/y(6);
residual(8)= lhs-rhs;
lhs =log(y(8)/params(17));
rhs =params(9)*log(y(2)/params(17))+params(13)*x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(14);
rhs =(y(16)/y(7)+y(18)+y(17)-y(6)*y(15))/y(9);
residual(10)= lhs-rhs;
lhs =y(17);
rhs =params(18)+params(10)*(y(4)-params(18))+params(14)*x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(18);
rhs =params(19)+params(11)*(y(5)-params(19))+params(15)*x(it_, 3);
residual(12)= lhs-rhs;
lhs =log(y(7)/params(20));
rhs =params(12)*log(y(1)/params(20))+params(16)*x(it_, 4);
residual(13)= lhs-rhs;
lhs =y(11);
rhs =y(18)+y(17)+y(12)+y(13);
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 27);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,9)=(-(params(2)*y(12)/(1-y(14))))/(y(9)*y(9));
  g1(1,12)=params(2)/(1-y(14))/y(9);
  g1(1,14)=params(2)*y(12)/((1-y(14))*(1-y(14)))/y(9);
  g1(2,21)=(-(params(1)*y(23)*(-y(22))));
  g1(2,22)=(-(params(1)*y(23)*(1-y(21))));
  g1(2,20)=1;
  g1(2,23)=(-(params(1)*(1-params(3)+(1-y(21))*y(22))));
  g1(3,12)=(-((-1)/(y(12)*y(12))));
  g1(3,20)=1;
  g1(4,13)=(-1);
  g1(4,6)=(-(1-params(3)));
  g1(4,19)=1;
  g1(5,3)=(-(1-params(3)));
  g1(5,10)=1;
  g1(5,18)=(-1);
  g1(6,8)=(-(T56*y(3)^params(4)*y(6)^params(5)));
  g1(6,3)=(-(T56*y(6)^params(5)*y(8)*getPowerDeriv(y(3),params(4),1)));
  g1(6,11)=1;
  g1(6,14)=(-(T54*getPowerDeriv(y(14),1-params(5),1)));
  g1(6,6)=(-(T56*y(8)*y(3)^params(4)*getPowerDeriv(y(6),params(5),1)));
  g1(7,9)=1;
  g1(7,11)=(-((1-params(5))/y(14)));
  g1(7,14)=(-((-(y(11)*(1-params(5))))/(y(14)*y(14))));
  g1(8,11)=(-(params(5)/y(6)));
  g1(8,15)=1;
  g1(8,6)=(-((-(y(11)*params(5)))/(y(6)*y(6))));
  g1(9,2)=(-(params(9)*1/params(17)/(y(2)/params(17))));
  g1(9,8)=1/params(17)/(y(8)/params(17));
  g1(9,24)=(-params(13));
  g1(10,7)=(-((-y(16))/(y(7)*y(7))/y(9)));
  g1(10,9)=(-((-(y(16)/y(7)+y(18)+y(17)-y(6)*y(15)))/(y(9)*y(9))));
  g1(10,14)=1;
  g1(10,15)=(-((-y(6))/y(9)));
  g1(10,16)=(-(1/y(7)/y(9)));
  g1(10,17)=(-(1/y(9)));
  g1(10,18)=(-(1/y(9)));
  g1(10,6)=(-((-y(15))/y(9)));
  g1(11,4)=(-params(10));
  g1(11,17)=1;
  g1(11,25)=(-params(14));
  g1(12,5)=(-params(11));
  g1(12,18)=1;
  g1(12,26)=(-params(15));
  g1(13,1)=(-(params(12)*1/params(20)/(y(1)/params(20))));
  g1(13,7)=1/params(20)/(y(7)/params(20));
  g1(13,27)=(-params(16));
  g1(14,11)=1;
  g1(14,12)=(-1);
  g1(14,13)=(-1);
  g1(14,17)=(-1);
  g1(14,18)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,729);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,19683);
end
end
