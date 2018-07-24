function [residual, g1, g2, g3] = Ex1_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(22, 1);
T52 = y(19)*y(4)^params(4)*y(1)^params(5);
T54 = y(9)^(1-params(5));
lhs =(1-y(17))*y(12);
rhs =params(2)/(1-y(9))*y(7);
residual(1)= lhs-rhs;
lhs =1/y(7);
rhs =params(1)*1/y(29)*(1-params(3)+(1-y(31))*y(30));
residual(2)= lhs-rhs;
lhs =y(11);
rhs =(1-params(3))*y(1)+y(10);
residual(3)= lhs-rhs;
lhs =y(16);
rhs =(1-params(3))*y(4)+y(15);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =T52*T54;
residual(5)= lhs-rhs;
lhs =y(12)*y(9);
rhs =y(8)*(1-params(5));
residual(6)= lhs-rhs;
lhs =y(1)*y(13);
rhs =y(8)*params(5);
residual(7)= lhs-rhs;
lhs =log(y(19)/params(11));
rhs =params(6)*log(y(6)/params(11))+x(it_, 4)*params(14);
residual(8)= lhs-rhs;
lhs =y(15)+y(14)+y(18);
rhs =y(17)*(y(12)*y(9)+y(1)*y(13));
residual(9)= lhs-rhs;
lhs =y(14)-params(10);
rhs =params(7)*(y(2)-params(10))+x(it_, 1)*params(17);
residual(10)= lhs-rhs;
lhs =y(15)-params(13);
rhs =params(8)*(y(3)-params(13))+x(it_, 2)*params(16);
residual(11)= lhs-rhs;
lhs =log(y(17)/params(12));
rhs =params(9)*log(y(5)/params(12))+x(it_, 3)*params(15);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(15)+y(14)+y(7)+y(10);
residual(13)= lhs-rhs;
lhs =y(20);
rhs =100*(y(8)-(steady_state(2)))/(steady_state(2));
residual(14)= lhs-rhs;
lhs =y(21);
rhs =100*(y(7)-(steady_state(1)))/(steady_state(1));
residual(15)= lhs-rhs;
lhs =y(22);
rhs =100*(y(10)-(steady_state(4)))/(steady_state(4));
residual(16)= lhs-rhs;
lhs =y(23);
rhs =100*(y(9)-(steady_state(3)));
residual(17)= lhs-rhs;
lhs =y(24);
rhs =100*(y(12)-(steady_state(6)))/(steady_state(6));
residual(18)= lhs-rhs;
lhs =y(25);
rhs =100*(y(13)-(steady_state(7)));
residual(19)= lhs-rhs;
lhs =y(26);
rhs =100*(y(18)-(steady_state(12)));
residual(20)= lhs-rhs;
lhs =y(27);
rhs =100*(y(14)/y(8)-(steady_state(8))/(steady_state(2)));
residual(21)= lhs-rhs;
lhs =y(28);
rhs =100*(y(15)/y(8)-(steady_state(9))/(steady_state(2)));
residual(22)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(22, 35);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-(params(2)/(1-y(9))));
  g1(1,9)=(-(y(7)*params(2)/((1-y(9))*(1-y(9)))));
  g1(1,12)=1-y(17);
  g1(1,17)=(-y(12));
  g1(2,7)=(-1)/(y(7)*y(7));
  g1(2,29)=(-((1-params(3)+(1-y(31))*y(30))*params(1)*(-1)/(y(29)*y(29))));
  g1(2,30)=(-(params(1)*1/y(29)*(1-y(31))));
  g1(2,31)=(-(params(1)*1/y(29)*(-y(30))));
  g1(3,10)=(-1);
  g1(3,1)=(-(1-params(3)));
  g1(3,11)=1;
  g1(4,15)=(-1);
  g1(4,4)=(-(1-params(3)));
  g1(4,16)=1;
  g1(5,8)=1;
  g1(5,9)=(-(T52*getPowerDeriv(y(9),1-params(5),1)));
  g1(5,1)=(-(T54*y(19)*y(4)^params(4)*getPowerDeriv(y(1),params(5),1)));
  g1(5,4)=(-(T54*y(1)^params(5)*y(19)*getPowerDeriv(y(4),params(4),1)));
  g1(5,19)=(-(T54*y(4)^params(4)*y(1)^params(5)));
  g1(6,8)=(-(1-params(5)));
  g1(6,9)=y(12);
  g1(6,12)=y(9);
  g1(7,8)=(-params(5));
  g1(7,1)=y(13);
  g1(7,13)=y(1);
  g1(8,6)=(-(params(6)*1/params(11)/(y(6)/params(11))));
  g1(8,19)=1/params(11)/(y(19)/params(11));
  g1(8,35)=(-params(14));
  g1(9,9)=(-(y(17)*y(12)));
  g1(9,1)=(-(y(17)*y(13)));
  g1(9,12)=(-(y(17)*y(9)));
  g1(9,13)=(-(y(17)*y(1)));
  g1(9,14)=1;
  g1(9,15)=1;
  g1(9,17)=(-(y(12)*y(9)+y(1)*y(13)));
  g1(9,18)=1;
  g1(10,2)=(-params(7));
  g1(10,14)=1;
  g1(10,32)=(-params(17));
  g1(11,3)=(-params(8));
  g1(11,15)=1;
  g1(11,33)=(-params(16));
  g1(12,5)=(-(params(9)*1/params(12)/(y(5)/params(12))));
  g1(12,17)=1/params(12)/(y(17)/params(12));
  g1(12,34)=(-params(15));
  g1(13,7)=(-1);
  g1(13,8)=1;
  g1(13,10)=(-1);
  g1(13,14)=(-1);
  g1(13,15)=(-1);
  g1(14,8)=(-(100*1/(steady_state(2))));
  g1(14,20)=1;
  g1(15,7)=(-(100/(steady_state(1))));
  g1(15,21)=1;
  g1(16,10)=(-(100/(steady_state(4))));
  g1(16,22)=1;
  g1(17,9)=(-100);
  g1(17,23)=1;
  g1(18,12)=(-(100/(steady_state(6))));
  g1(18,24)=1;
  g1(19,13)=(-100);
  g1(19,25)=1;
  g1(20,18)=(-100);
  g1(20,26)=1;
  g1(21,8)=(-(100*(-y(14))/(y(8)*y(8))));
  g1(21,14)=(-(100*1/y(8)));
  g1(21,27)=1;
  g1(22,8)=(-(100*(-y(15))/(y(8)*y(8))));
  g1(22,15)=(-(100*1/y(8)));
  g1(22,28)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],22,1225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],22,42875);
end
end
