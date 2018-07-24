function [residual, g1, g2, g3] = Gerling_PS3_Ex1_etanew_dynamic(y, x, params, steady_state, it_)
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
T52 = y(28)*y(4)^params(3)*y(3)^params(5);
T54 = y(17)^(1-params(5));
lhs =(1-y(27))*y(15);
rhs =params(4)*y(19)/(1-y(17));
residual(1)= lhs-rhs;
lhs =1/y(19);
rhs =params(1)*1/y(29)*(1-params(2)+(1-y(31))*y(30));
residual(2)= lhs-rhs;
lhs =y(25);
rhs =(1-params(2))*y(3)+y(21);
residual(3)= lhs-rhs;
lhs =y(26);
rhs =(1-params(2))*y(4)+y(11);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =T52*T54;
residual(5)= lhs-rhs;
lhs =y(15)*y(17);
rhs =y(7)*(1-params(5));
residual(6)= lhs-rhs;
lhs =y(3)*y(23);
rhs =y(7)*params(5);
residual(7)= lhs-rhs;
lhs =log(y(28)/params(21));
rhs =params(6)*log(y(6)/params(21))+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(11)+y(9)+y(13);
rhs =y(27)*(y(15)*y(17)+y(3)*y(23));
residual(9)= lhs-rhs;
lhs =y(9)-params(11);
rhs =params(7)*(y(1)-params(11))+x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(11)-params(12);
rhs =params(8)*(y(2)-params(12))+x(it_, 3);
residual(11)= lhs-rhs;
lhs =log(y(27)/params(22));
rhs =params(9)*log(y(5)/params(22))+x(it_, 4);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(11)+y(9)+y(19)+y(21);
residual(13)= lhs-rhs;
lhs =y(8);
rhs =100*(y(7)-params(10))/params(10);
residual(14)= lhs-rhs;
lhs =y(20);
rhs =100*(y(19)-params(16))/params(16);
residual(15)= lhs-rhs;
lhs =y(22);
rhs =100*(y(21)-params(17))/params(17);
residual(16)= lhs-rhs;
lhs =y(18);
rhs =100*(y(17)-params(15))/params(15);
residual(17)= lhs-rhs;
lhs =y(16);
rhs =100*(y(15)-params(14))/params(14);
residual(18)= lhs-rhs;
lhs =y(24);
rhs =100*(y(23)-params(18));
residual(19)= lhs-rhs;
lhs =y(14);
rhs =100*(y(13)-params(13));
residual(20)= lhs-rhs;
lhs =y(10);
rhs =(y(9)-params(11))*100/params(11);
residual(21)= lhs-rhs;
lhs =y(12);
rhs =(y(11)-params(12))*100/params(12);
residual(22)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(22, 35);

  %
  % Jacobian matrix
  %

  g1(1,15)=1-y(27);
  g1(1,17)=(-(params(4)*y(19)/((1-y(17))*(1-y(17)))));
  g1(1,19)=(-(params(4)*1/(1-y(17))));
  g1(1,27)=(-y(15));
  g1(2,19)=(-1)/(y(19)*y(19));
  g1(2,29)=(-(params(1)*(1-params(2)+(1-y(31))*y(30))*(-1)/(y(29)*y(29))));
  g1(2,30)=(-(params(1)*1/y(29)*(1-y(31))));
  g1(2,31)=(-(params(1)*1/y(29)*(-y(30))));
  g1(3,21)=(-1);
  g1(3,3)=(-(1-params(2)));
  g1(3,25)=1;
  g1(4,11)=(-1);
  g1(4,4)=(-(1-params(2)));
  g1(4,26)=1;
  g1(5,7)=1;
  g1(5,17)=(-(T52*getPowerDeriv(y(17),1-params(5),1)));
  g1(5,3)=(-(T54*y(28)*y(4)^params(3)*getPowerDeriv(y(3),params(5),1)));
  g1(5,4)=(-(T54*y(3)^params(5)*y(28)*getPowerDeriv(y(4),params(3),1)));
  g1(5,28)=(-(T54*y(4)^params(3)*y(3)^params(5)));
  g1(6,7)=(-(1-params(5)));
  g1(6,15)=y(17);
  g1(6,17)=y(15);
  g1(7,7)=(-params(5));
  g1(7,23)=y(3);
  g1(7,3)=y(23);
  g1(8,6)=(-(params(6)*1/params(21)/(y(6)/params(21))));
  g1(8,28)=1/params(21)/(y(28)/params(21));
  g1(8,32)=(-1);
  g1(9,9)=1;
  g1(9,11)=1;
  g1(9,13)=1;
  g1(9,15)=(-(y(27)*y(17)));
  g1(9,17)=(-(y(27)*y(15)));
  g1(9,23)=(-(y(27)*y(3)));
  g1(9,3)=(-(y(27)*y(23)));
  g1(9,27)=(-(y(15)*y(17)+y(3)*y(23)));
  g1(10,1)=(-params(7));
  g1(10,9)=1;
  g1(10,33)=(-1);
  g1(11,2)=(-params(8));
  g1(11,11)=1;
  g1(11,34)=(-1);
  g1(12,5)=(-(params(9)*1/params(22)/(y(5)/params(22))));
  g1(12,27)=1/params(22)/(y(27)/params(22));
  g1(12,35)=(-1);
  g1(13,7)=1;
  g1(13,9)=(-1);
  g1(13,11)=(-1);
  g1(13,19)=(-1);
  g1(13,21)=(-1);
  g1(14,7)=(-(100/params(10)));
  g1(14,8)=1;
  g1(15,19)=(-(100/params(16)));
  g1(15,20)=1;
  g1(16,21)=(-(100/params(17)));
  g1(16,22)=1;
  g1(17,17)=(-(100/params(15)));
  g1(17,18)=1;
  g1(18,15)=(-(100/params(14)));
  g1(18,16)=1;
  g1(19,23)=(-100);
  g1(19,24)=1;
  g1(20,13)=(-100);
  g1(20,14)=1;
  g1(21,9)=(-(100/params(11)));
  g1(21,10)=1;
  g1(22,11)=(-(100/params(12)));
  g1(22,12)=1;
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
