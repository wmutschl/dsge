function [residual, g1, g2, g3] = exercise1_task6_dynamic(y, x, params, steady_state, it_)
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
T53 = y(16)*y(3)^params(5)*y(2)^params(4);
T55 = y(10)^(1-params(4));
lhs =(1-y(7))*y(8);
rhs =params(1)*y(9)/(1-y(10));
residual(1)= lhs-rhs;
lhs =y(29);
rhs =params(2)*y(32)*(1-params(3)+(1-y(30))*y(31));
residual(2)= lhs-rhs;
lhs =y(29);
rhs =1/y(9);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =(1-params(3))*y(2)+y(12);
residual(4)= lhs-rhs;
lhs =y(13);
rhs =(1-params(3))*y(3)+y(14);
residual(5)= lhs-rhs;
lhs =y(15);
rhs =T53*T55;
residual(6)= lhs-rhs;
lhs =y(8)*y(10);
rhs =y(15)*(1-params(4));
residual(7)= lhs-rhs;
lhs =y(2)*y(17);
rhs =y(15)*params(4);
residual(8)= lhs-rhs;
lhs =log(y(16)/params(23));
rhs =params(6)*log(y(5)/params(23))+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(14)+y(18)+y(19);
rhs =y(7)*(y(8)*y(10)+y(2)*y(17));
residual(10)= lhs-rhs;
lhs =y(18)-params(14);
rhs =params(8)*(y(6)-params(14))+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(14)-params(15);
rhs =params(10)*(y(4)-params(15))+x(it_, 3);
residual(12)= lhs-rhs;
lhs =log(y(7)/params(24));
rhs =params(12)*log(y(1)/params(24))+x(it_, 4);
residual(13)= lhs-rhs;
lhs =y(15);
rhs =y(14)+y(18)+y(9)+y(12);
residual(14)= lhs-rhs;
lhs =y(20);
rhs =100*(y(15)-params(16))/params(16);
residual(15)= lhs-rhs;
lhs =y(21);
rhs =100*(y(9)-params(17))/params(17);
residual(16)= lhs-rhs;
lhs =y(22);
rhs =100*(y(12)-params(18))/params(18);
residual(17)= lhs-rhs;
lhs =y(23);
rhs =100*(y(10)-params(19));
residual(18)= lhs-rhs;
lhs =y(24);
rhs =100*(y(8)-params(20))/params(20);
residual(19)= lhs-rhs;
lhs =y(25);
rhs =100*(y(17)-params(21));
residual(20)= lhs-rhs;
lhs =y(26);
rhs =100*(y(19)-params(22));
residual(21)= lhs-rhs;
lhs =y(27);
rhs =100*(y(18)/y(15)-params(14)/params(16));
residual(22)= lhs-rhs;
lhs =y(28);
rhs =100*(y(14)/y(15)-params(15)/params(16));
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 36);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-y(8));
  g1(1,8)=1-y(7);
  g1(1,9)=(-(params(1)/(1-y(10))));
  g1(1,10)=(-(params(1)*y(9)/((1-y(10))*(1-y(10)))));
  g1(2,30)=(-(params(2)*y(32)*(-y(31))));
  g1(2,31)=(-(params(2)*y(32)*(1-y(30))));
  g1(2,29)=1;
  g1(2,32)=(-(params(2)*(1-params(3)+(1-y(30))*y(31))));
  g1(3,9)=(-((-1)/(y(9)*y(9))));
  g1(3,29)=1;
  g1(4,2)=(-(1-params(3)));
  g1(4,11)=1;
  g1(4,12)=(-1);
  g1(5,3)=(-(1-params(3)));
  g1(5,13)=1;
  g1(5,14)=(-1);
  g1(6,10)=(-(T53*getPowerDeriv(y(10),1-params(4),1)));
  g1(6,2)=(-(T55*y(16)*y(3)^params(5)*getPowerDeriv(y(2),params(4),1)));
  g1(6,3)=(-(T55*y(2)^params(4)*y(16)*getPowerDeriv(y(3),params(5),1)));
  g1(6,15)=1;
  g1(6,16)=(-(T55*y(3)^params(5)*y(2)^params(4)));
  g1(7,8)=y(10);
  g1(7,10)=y(8);
  g1(7,15)=(-(1-params(4)));
  g1(8,2)=y(17);
  g1(8,15)=(-params(4));
  g1(8,17)=y(2);
  g1(9,5)=(-(params(6)*1/params(23)/(y(5)/params(23))));
  g1(9,16)=1/params(23)/(y(16)/params(23));
  g1(9,33)=(-1);
  g1(10,7)=(-(y(8)*y(10)+y(2)*y(17)));
  g1(10,8)=(-(y(7)*y(10)));
  g1(10,10)=(-(y(7)*y(8)));
  g1(10,2)=(-(y(7)*y(17)));
  g1(10,14)=1;
  g1(10,17)=(-(y(7)*y(2)));
  g1(10,18)=1;
  g1(10,19)=1;
  g1(11,6)=(-params(8));
  g1(11,18)=1;
  g1(11,34)=(-1);
  g1(12,4)=(-params(10));
  g1(12,14)=1;
  g1(12,35)=(-1);
  g1(13,1)=(-(params(12)*1/params(24)/(y(1)/params(24))));
  g1(13,7)=1/params(24)/(y(7)/params(24));
  g1(13,36)=(-1);
  g1(14,9)=(-1);
  g1(14,12)=(-1);
  g1(14,14)=(-1);
  g1(14,15)=1;
  g1(14,18)=(-1);
  g1(15,15)=(-(100*1/params(16)));
  g1(15,20)=1;
  g1(16,9)=(-(100*1/params(17)));
  g1(16,21)=1;
  g1(17,12)=(-(100*1/params(18)));
  g1(17,22)=1;
  g1(18,10)=(-100);
  g1(18,23)=1;
  g1(19,8)=(-(100*1/params(20)));
  g1(19,24)=1;
  g1(20,17)=(-100);
  g1(20,25)=1;
  g1(21,19)=(-100);
  g1(21,26)=1;
  g1(22,15)=(-(100*(-y(18))/(y(15)*y(15))));
  g1(22,18)=(-(100*1/y(15)));
  g1(22,27)=1;
  g1(23,14)=(-(100*1/y(15)));
  g1(23,15)=(-(100*(-y(14))/(y(15)*y(15))));
  g1(23,28)=1;
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
