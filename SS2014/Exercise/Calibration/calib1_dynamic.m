function [residual, g1, g2, g3] = calib1_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(8, 1);
T35 = y(10)*y(1)^params(4);
T37 = y(7)^(1-params(4));
T92 = getPowerDeriv(y(7),1-params(4),1);
lhs =1/y(4);
rhs =params(1)*1/y(11)*(1+y(12)-params(3));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =y(4)*params(2)/(1-y(7));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(4)+y(6);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =T35*T37;
residual(4)= lhs-rhs;
lhs =y(8);
rhs =(1-params(4))*y(3)*(params(7)-1)/params(7)/y(7);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =params(4)*y(3)*(params(7)-1)/params(7)/y(1);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(5)-y(1)*(1-params(3));
residual(7)= lhs-rhs;
lhs =log(y(10));
rhs =params(5)*log(y(2))+x(it_, 1);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 13);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-1)/(y(4)*y(4));
  g1(1,11)=(-((1+y(12)-params(3))*params(1)*(-1)/(y(11)*y(11))));
  g1(1,12)=(-(params(1)*1/y(11)));
  g1(2,4)=(-(params(2)/(1-y(7))));
  g1(2,7)=(-(y(4)*params(2)/((1-y(7))*(1-y(7)))));
  g1(2,8)=1;
  g1(3,3)=1;
  g1(3,4)=(-1);
  g1(3,6)=(-1);
  g1(4,3)=1;
  g1(4,1)=(-(T37*y(10)*getPowerDeriv(y(1),params(4),1)));
  g1(4,7)=(-(T35*T92));
  g1(4,10)=(-(y(1)^params(4)*T37));
  g1(5,3)=(-((1-params(4))*(params(7)-1)/params(7)/y(7)));
  g1(5,7)=(-((-((1-params(4))*y(3)*(params(7)-1)/params(7)))/(y(7)*y(7))));
  g1(5,8)=1;
  g1(6,3)=(-(params(4)*(params(7)-1)/params(7)/y(1)));
  g1(6,1)=(-((-(params(4)*y(3)*(params(7)-1)/params(7)))/(y(1)*y(1))));
  g1(6,9)=1;
  g1(7,1)=1-params(3);
  g1(7,5)=(-1);
  g1(7,6)=1;
  g1(8,2)=(-(params(5)*1/y(2)));
  g1(8,10)=1/y(10);
  g1(8,13)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(23,3);
  v2(1,1)=1;
  v2(1,2)=43;
  v2(1,3)=(y(4)+y(4))/(y(4)*y(4)*y(4)*y(4));
  v2(2,1)=1;
  v2(2,2)=141;
  v2(2,3)=(-((1+y(12)-params(3))*params(1)*(y(11)+y(11))/(y(11)*y(11)*y(11)*y(11))));
  v2(3,1)=1;
  v2(3,2)=154;
  v2(3,3)=(-(params(1)*(-1)/(y(11)*y(11))));
  v2(4,1)=1;
  v2(4,2)=142;
  v2(4,3)=  v2(3,3);
  v2(5,1)=2;
  v2(5,2)=82;
  v2(5,3)=(-(params(2)/((1-y(7))*(1-y(7)))));
  v2(6,1)=2;
  v2(6,2)=46;
  v2(6,3)=  v2(5,3);
  v2(7,1)=2;
  v2(7,2)=85;
  v2(7,3)=(-((-(y(4)*params(2)*((-(1-y(7)))-(1-y(7)))))/((1-y(7))*(1-y(7))*(1-y(7))*(1-y(7)))));
  v2(8,1)=4;
  v2(8,2)=1;
  v2(8,3)=(-(T37*y(10)*getPowerDeriv(y(1),params(4),2)));
  v2(9,1)=4;
  v2(9,2)=79;
  v2(9,3)=(-(y(10)*getPowerDeriv(y(1),params(4),1)*T92));
  v2(10,1)=4;
  v2(10,2)=7;
  v2(10,3)=  v2(9,3);
  v2(11,1)=4;
  v2(11,2)=85;
  v2(11,3)=(-(T35*getPowerDeriv(y(7),1-params(4),2)));
  v2(12,1)=4;
  v2(12,2)=118;
  v2(12,3)=(-(T37*getPowerDeriv(y(1),params(4),1)));
  v2(13,1)=4;
  v2(13,2)=10;
  v2(13,3)=  v2(12,3);
  v2(14,1)=4;
  v2(14,2)=124;
  v2(14,3)=(-(y(1)^params(4)*T92));
  v2(15,1)=4;
  v2(15,2)=88;
  v2(15,3)=  v2(14,3);
  v2(16,1)=5;
  v2(16,2)=81;
  v2(16,3)=(-((-((1-params(4))*(params(7)-1)/params(7)))/(y(7)*y(7))));
  v2(17,1)=5;
  v2(17,2)=33;
  v2(17,3)=  v2(16,3);
  v2(18,1)=5;
  v2(18,2)=85;
  v2(18,3)=(-((-((-((1-params(4))*y(3)*(params(7)-1)/params(7)))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))));
  v2(19,1)=6;
  v2(19,2)=3;
  v2(19,3)=(-((-(params(4)*(params(7)-1)/params(7)))/(y(1)*y(1))));
  v2(20,1)=6;
  v2(20,2)=27;
  v2(20,3)=  v2(19,3);
  v2(21,1)=6;
  v2(21,2)=1;
  v2(21,3)=(-((-((-(params(4)*y(3)*(params(7)-1)/params(7)))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
  v2(22,1)=8;
  v2(22,2)=15;
  v2(22,3)=(-(params(5)*(-1)/(y(2)*y(2))));
  v2(23,1)=8;
  v2(23,2)=127;
  v2(23,3)=(-1)/(y(10)*y(10));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),8,169);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,2197);
end
end
