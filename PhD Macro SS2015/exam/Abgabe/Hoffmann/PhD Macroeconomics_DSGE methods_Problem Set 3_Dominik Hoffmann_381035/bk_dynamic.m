function [residual, g1, g2, g3] = bk_dynamic(y, x, params, steady_state, it_)
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
T53 = y(20)*y(5)^params(4)*y(3)^params(5);
T55 = y(8)^(1-params(5));
lhs =(1-y(15))*y(11);
rhs =params(2)*y(7)/(1-y(8));
residual(1)= lhs-rhs;
lhs =y(16);
rhs =params(1)*y(32)*(1-params(3)+(1-y(31))*y(30));
residual(2)= lhs-rhs;
lhs =y(16);
rhs =1/y(7);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =(1-params(3))*y(3)+y(18);
residual(4)= lhs-rhs;
lhs =y(17);
rhs =(1-params(3))*y(5)+y(10);
residual(5)= lhs-rhs;
lhs =y(19);
rhs =T53*T55;
residual(6)= lhs-rhs;
lhs =y(11)*y(8);
rhs =y(19)*(1-params(5));
residual(7)= lhs-rhs;
lhs =y(3)*y(12);
rhs =y(19)*params(5);
residual(8)= lhs-rhs;
lhs =log(y(20)/params(26));
rhs =params(6)*log(y(6)/params(26))+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(10)+y(9)+y(14);
rhs =y(15)*(y(11)*y(8)+y(3)*y(12));
residual(10)= lhs-rhs;
lhs =y(9)-params(15);
rhs =params(7)*(y(1)-params(15))+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(10)-params(16);
rhs =params(8)*(y(2)-params(16))+x(it_, 3);
residual(12)= lhs-rhs;
lhs =log(y(15)/params(25));
rhs =params(9)*log(y(4)/params(25))+x(it_, 4);
residual(13)= lhs-rhs;
lhs =y(19);
rhs =y(10)+y(9)+y(7)+y(18);
residual(14)= lhs-rhs;
lhs =y(21);
rhs =100*(y(19)-params(14))/params(14);
residual(15)= lhs-rhs;
lhs =y(22);
rhs =100*(y(7)-params(24))/params(24);
residual(16)= lhs-rhs;
lhs =y(23);
rhs =100*(y(18)-params(23))/params(23);
residual(17)= lhs-rhs;
lhs =y(24);
rhs =100*(y(8)-params(19));
residual(18)= lhs-rhs;
lhs =y(25);
rhs =100*(y(11)-params(20))/params(20);
residual(19)= lhs-rhs;
lhs =y(26);
rhs =100*(y(12)-params(21));
residual(20)= lhs-rhs;
lhs =y(27);
rhs =100*(y(14)-params(22));
residual(21)= lhs-rhs;
lhs =y(28);
rhs =100*(y(9)/y(19)-params(15)/params(14));
residual(22)= lhs-rhs;
lhs =y(29);
rhs =100*(y(10)/y(19)-params(16)/params(14));
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 36);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-(params(2)*1/(1-y(8))));
  g1(1,8)=(-(params(2)*y(7)/((1-y(8))*(1-y(8)))));
  g1(1,11)=1-y(15);
  g1(1,15)=(-y(11));
  g1(2,30)=(-(params(1)*y(32)*(1-y(31))));
  g1(2,31)=(-(params(1)*y(32)*(-y(30))));
  g1(2,16)=1;
  g1(2,32)=(-(params(1)*(1-params(3)+(1-y(31))*y(30))));
  g1(3,7)=(-((-1)/(y(7)*y(7))));
  g1(3,16)=1;
  g1(4,3)=(-(1-params(3)));
  g1(4,13)=1;
  g1(4,18)=(-1);
  g1(5,10)=(-1);
  g1(5,5)=(-(1-params(3)));
  g1(5,17)=1;
  g1(6,8)=(-(T53*getPowerDeriv(y(8),1-params(5),1)));
  g1(6,3)=(-(T55*y(20)*y(5)^params(4)*getPowerDeriv(y(3),params(5),1)));
  g1(6,5)=(-(T55*y(3)^params(5)*y(20)*getPowerDeriv(y(5),params(4),1)));
  g1(6,19)=1;
  g1(6,20)=(-(T55*y(5)^params(4)*y(3)^params(5)));
  g1(7,8)=y(11);
  g1(7,11)=y(8);
  g1(7,19)=(-(1-params(5)));
  g1(8,12)=y(3);
  g1(8,3)=y(12);
  g1(8,19)=(-params(5));
  g1(9,6)=(-(params(6)*1/params(26)/(y(6)/params(26))));
  g1(9,20)=1/params(26)/(y(20)/params(26));
  g1(9,33)=(-1);
  g1(10,8)=(-(y(15)*y(11)));
  g1(10,9)=1;
  g1(10,10)=1;
  g1(10,11)=(-(y(15)*y(8)));
  g1(10,12)=(-(y(15)*y(3)));
  g1(10,3)=(-(y(15)*y(12)));
  g1(10,14)=1;
  g1(10,15)=(-(y(11)*y(8)+y(3)*y(12)));
  g1(11,1)=(-params(7));
  g1(11,9)=1;
  g1(11,34)=(-1);
  g1(12,2)=(-params(8));
  g1(12,10)=1;
  g1(12,35)=(-1);
  g1(13,4)=(-(params(9)*1/params(25)/(y(4)/params(25))));
  g1(13,15)=1/params(25)/(y(15)/params(25));
  g1(13,36)=(-1);
  g1(14,7)=(-1);
  g1(14,9)=(-1);
  g1(14,10)=(-1);
  g1(14,18)=(-1);
  g1(14,19)=1;
  g1(15,19)=(-(100/params(14)));
  g1(15,21)=1;
  g1(16,7)=(-(100/params(24)));
  g1(16,22)=1;
  g1(17,18)=(-(100/params(23)));
  g1(17,23)=1;
  g1(18,8)=(-100);
  g1(18,24)=1;
  g1(19,11)=(-(100/params(20)));
  g1(19,25)=1;
  g1(20,12)=(-100);
  g1(20,26)=1;
  g1(21,14)=(-100);
  g1(21,27)=1;
  g1(22,9)=(-(100*1/y(19)));
  g1(22,19)=(-(100*(-y(9))/(y(19)*y(19))));
  g1(22,28)=1;
  g1(23,10)=(-(100*1/y(19)));
  g1(23,19)=(-(100*(-y(10))/(y(19)*y(19))));
  g1(23,29)=1;
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
