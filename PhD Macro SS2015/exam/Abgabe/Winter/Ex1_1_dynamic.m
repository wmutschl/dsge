function [residual, g1, g2, g3] = Ex1_1_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(23, 1);
T53 = y(29)*y(4)^params(5)*y(3)^params(1);
T55 = y(23)^(1-params(1));
lhs =(1-y(26))*y(24);
rhs =params(21)*y(7)/(1-y(23));
residual(1)= lhs-rhs;
lhs =y(22);
rhs =params(2)*y(30)*(1-params(4)+(1-y(32))*y(31));
residual(2)= lhs-rhs;
lhs =y(22);
rhs =1/y(7);
residual(3)= lhs-rhs;
lhs =y(20);
rhs =(1-params(4))*y(3)+y(18);
residual(4)= lhs-rhs;
lhs =y(21);
rhs =(1-params(4))*y(4)+y(19);
residual(5)= lhs-rhs;
lhs =y(28);
rhs =T53*T55;
residual(6)= lhs-rhs;
lhs =y(24)*y(23);
rhs =y(28)*(1-params(1));
residual(7)= lhs-rhs;
lhs =y(3)*y(25);
rhs =y(28)*params(1);
residual(8)= lhs-rhs;
lhs =log(y(29)/params(24));
rhs =params(17)*log(y(6)/params(24))+x(it_, 4);
residual(9)= lhs-rhs;
lhs =y(19)+y(17)+y(27);
rhs =y(26)*(y(24)*y(23)+y(3)*y(25));
residual(10)= lhs-rhs;
lhs =y(17)-params(6);
rhs =params(14)*(y(1)-params(6))+x(it_, 1);
residual(11)= lhs-rhs;
lhs =y(19)-params(7);
rhs =params(15)*(y(2)-params(7))+x(it_, 2);
residual(12)= lhs-rhs;
lhs =log(y(26)/params(20));
rhs =params(16)*log(y(5)/params(20))+x(it_, 3);
residual(13)= lhs-rhs;
lhs =y(28);
rhs =y(19)+y(17)+y(7)+y(18);
residual(14)= lhs-rhs;
lhs =y(16);
rhs =100*(y(28)-params(23))/params(23);
residual(15)= lhs-rhs;
lhs =y(8);
rhs =100*(y(7)-params(3))/params(3);
residual(16)= lhs-rhs;
lhs =y(10);
rhs =100*(y(18)-params(8))/params(8);
residual(17)= lhs-rhs;
lhs =y(12);
rhs =100*(y(23)-params(12));
residual(18)= lhs-rhs;
lhs =y(13);
rhs =100*(y(24)-params(13))/params(13);
residual(19)= lhs-rhs;
lhs =y(14);
rhs =100*(y(25)-params(19));
residual(20)= lhs-rhs;
lhs =y(15);
rhs =100*(y(27)-params(22));
residual(21)= lhs-rhs;
lhs =y(9);
rhs =100*(y(17)/y(28)-params(6)/params(23));
residual(22)= lhs-rhs;
lhs =y(11);
rhs =100*(y(19)/y(28)-params(7)/params(23));
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 36);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-(params(21)*1/(1-y(23))));
  g1(1,23)=(-(params(21)*y(7)/((1-y(23))*(1-y(23)))));
  g1(1,24)=1-y(26);
  g1(1,26)=(-y(24));
  g1(2,22)=1;
  g1(2,30)=(-(params(2)*(1-params(4)+(1-y(32))*y(31))));
  g1(2,31)=(-(params(2)*y(30)*(1-y(32))));
  g1(2,32)=(-(params(2)*y(30)*(-y(31))));
  g1(3,7)=(-((-1)/(y(7)*y(7))));
  g1(3,22)=1;
  g1(4,18)=(-1);
  g1(4,3)=(-(1-params(4)));
  g1(4,20)=1;
  g1(5,19)=(-1);
  g1(5,4)=(-(1-params(4)));
  g1(5,21)=1;
  g1(6,3)=(-(T55*y(29)*y(4)^params(5)*getPowerDeriv(y(3),params(1),1)));
  g1(6,4)=(-(T55*y(3)^params(1)*y(29)*getPowerDeriv(y(4),params(5),1)));
  g1(6,23)=(-(T53*getPowerDeriv(y(23),1-params(1),1)));
  g1(6,28)=1;
  g1(6,29)=(-(T55*y(4)^params(5)*y(3)^params(1)));
  g1(7,23)=y(24);
  g1(7,24)=y(23);
  g1(7,28)=(-(1-params(1)));
  g1(8,3)=y(25);
  g1(8,25)=y(3);
  g1(8,28)=(-params(1));
  g1(9,6)=(-(params(17)*1/params(24)/(y(6)/params(24))));
  g1(9,29)=1/params(24)/(y(29)/params(24));
  g1(9,36)=(-1);
  g1(10,17)=1;
  g1(10,19)=1;
  g1(10,3)=(-(y(26)*y(25)));
  g1(10,23)=(-(y(26)*y(24)));
  g1(10,24)=(-(y(26)*y(23)));
  g1(10,25)=(-(y(26)*y(3)));
  g1(10,26)=(-(y(24)*y(23)+y(3)*y(25)));
  g1(10,27)=1;
  g1(11,1)=(-params(14));
  g1(11,17)=1;
  g1(11,33)=(-1);
  g1(12,2)=(-params(15));
  g1(12,19)=1;
  g1(12,34)=(-1);
  g1(13,5)=(-(params(16)*1/params(20)/(y(5)/params(20))));
  g1(13,26)=1/params(20)/(y(26)/params(20));
  g1(13,35)=(-1);
  g1(14,7)=(-1);
  g1(14,17)=(-1);
  g1(14,18)=(-1);
  g1(14,19)=(-1);
  g1(14,28)=1;
  g1(15,16)=1;
  g1(15,28)=(-(100/params(23)));
  g1(16,7)=(-(100/params(3)));
  g1(16,8)=1;
  g1(17,10)=1;
  g1(17,18)=(-(100/params(8)));
  g1(18,12)=1;
  g1(18,23)=(-100);
  g1(19,13)=1;
  g1(19,24)=(-(100/params(13)));
  g1(20,14)=1;
  g1(20,25)=(-100);
  g1(21,15)=1;
  g1(21,27)=(-100);
  g1(22,9)=1;
  g1(22,17)=(-(100*1/y(28)));
  g1(22,28)=(-(100*(-y(17))/(y(28)*y(28))));
  g1(23,11)=1;
  g1(23,19)=(-(100*1/y(28)));
  g1(23,28)=(-(100*(-y(19))/(y(28)*y(28))));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,1296);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,46656);
end
end
