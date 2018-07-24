function [residual, g1, g2, g3] = Exercise1_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(13, 1);
T50 = y(10)*y(6)^params(4)*y(5)^params(1);
T52 = y(17)^(1-params(1));
lhs =(1-y(7))*y(9);
rhs =params(5)*y(11)/(1-y(17));
residual(1)= lhs-rhs;
lhs =y(22);
rhs =y(11)*params(2)*(1-params(3)+(1-y(20))*y(21));
residual(2)= lhs-rhs;
lhs =y(15);
rhs =(1-params(3))*y(5)+y(13);
residual(3)= lhs-rhs;
lhs =y(16);
rhs =(1-params(3))*y(6)+y(14);
residual(4)= lhs-rhs;
lhs =y(19);
rhs =T50*T52;
residual(5)= lhs-rhs;
lhs =y(9)*y(17);
rhs =y(19)*(1-params(1));
residual(6)= lhs-rhs;
lhs =y(5)*y(8);
rhs =y(19)*params(1);
residual(7)= lhs-rhs;
lhs =y(14)+y(12)+y(18);
rhs =y(7)*(y(9)*y(17)+y(5)*y(8));
residual(8)= lhs-rhs;
lhs =log(y(10)/params(11));
rhs =params(7)*log(y(2)/params(11))+x(it_, 2);
residual(9)= lhs-rhs;
lhs =log(y(7)/params(10));
rhs =params(6)*log(y(1)/params(10))+x(it_, 1);
residual(10)= lhs-rhs;
lhs =y(12)-0.2;
rhs =params(8)*(y(3)-0.2)+x(it_, 3);
residual(11)= lhs-rhs;
lhs =y(14)-0.02;
rhs =params(9)*(y(4)-0.02)+x(it_, 4);
residual(12)= lhs-rhs;
lhs =y(19);
rhs =y(14)+y(12)+y(11)+y(13);
residual(13)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(13, 26);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-y(9));
  g1(1,9)=1-y(7);
  g1(1,11)=(-(params(5)/(1-y(17))));
  g1(1,17)=(-(params(5)*y(11)/((1-y(17))*(1-y(17)))));
  g1(2,20)=(-(y(11)*params(2)*(-y(21))));
  g1(2,21)=(-(y(11)*params(2)*(1-y(20))));
  g1(2,11)=(-(params(2)*(1-params(3)+(1-y(20))*y(21))));
  g1(2,22)=1;
  g1(3,13)=(-1);
  g1(3,5)=(-(1-params(3)));
  g1(3,15)=1;
  g1(4,14)=(-1);
  g1(4,6)=(-(1-params(3)));
  g1(4,16)=1;
  g1(5,10)=(-(T52*y(6)^params(4)*y(5)^params(1)));
  g1(5,5)=(-(T52*y(10)*y(6)^params(4)*getPowerDeriv(y(5),params(1),1)));
  g1(5,6)=(-(T52*y(5)^params(1)*y(10)*getPowerDeriv(y(6),params(4),1)));
  g1(5,17)=(-(T50*getPowerDeriv(y(17),1-params(1),1)));
  g1(5,19)=1;
  g1(6,9)=y(17);
  g1(6,17)=y(9);
  g1(6,19)=(-(1-params(1)));
  g1(7,8)=y(5);
  g1(7,5)=y(8);
  g1(7,19)=(-params(1));
  g1(8,7)=(-(y(9)*y(17)+y(5)*y(8)));
  g1(8,8)=(-(y(7)*y(5)));
  g1(8,9)=(-(y(7)*y(17)));
  g1(8,12)=1;
  g1(8,14)=1;
  g1(8,5)=(-(y(7)*y(8)));
  g1(8,17)=(-(y(7)*y(9)));
  g1(8,18)=1;
  g1(9,2)=(-(params(7)*1/params(11)/(y(2)/params(11))));
  g1(9,10)=1/params(11)/(y(10)/params(11));
  g1(9,24)=(-1);
  g1(10,1)=(-(params(6)*1/params(10)/(y(1)/params(10))));
  g1(10,7)=1/params(10)/(y(7)/params(10));
  g1(10,23)=(-1);
  g1(11,3)=(-params(8));
  g1(11,12)=1;
  g1(11,25)=(-1);
  g1(12,4)=(-params(9));
  g1(12,14)=1;
  g1(12,26)=(-1);
  g1(13,11)=(-1);
  g1(13,12)=(-1);
  g1(13,13)=(-1);
  g1(13,14)=(-1);
  g1(13,19)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,676);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,17576);
end
end
