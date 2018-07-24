function [residual, g1, g2, g3] = Aufgabe1_Manuel_Peter_dynamic(y, x, params, steady_state, it_)
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
T51 = y(15)*y(11)^params(3)*y(10)^params(4);
T53 = y(8)^(1-params(4));
lhs =(1-y(6))*y(18);
rhs =params(1)*y(7)/(1-y(8));
residual(1)= lhs-rhs;
lhs =y(19);
rhs =params(5)*y(30)*(1-params(2)+(1-y(6))*y(29));
residual(2)= lhs-rhs;
lhs =y(19);
rhs =1/y(7);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =(1-params(2))*y(2)+y(12);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =(1-params(2))*y(3)+y(13);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =T51*T53;
residual(6)= lhs-rhs;
lhs =y(18)*y(8);
rhs =y(14)*(1-params(4));
residual(7)= lhs-rhs;
lhs =y(2)*y(9);
rhs =y(14)*params(4);
residual(8)= lhs-rhs;
lhs =log(y(15)/params(10));
rhs =params(6)*log(y(4)/params(10))+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(13)+y(16)+y(17);
rhs =y(6)*(y(18)*y(8)+y(2)*y(9));
residual(10)= lhs-rhs;
lhs =y(16)-params(11);
rhs =params(8)*(y(5)-params(11))+x(it_, 3);
residual(11)= lhs-rhs;
lhs =y(13)-params(12);
rhs =(y(13)-params(12))*params(9)+x(it_, 4);
residual(12)= lhs-rhs;
lhs =log(y(6)/params(13));
rhs =params(7)*log(y(1)/params(13))+x(it_, 2);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(13)+y(16)+y(7)+y(12);
residual(14)= lhs-rhs;
lhs =y(21);
rhs =100*(y(14)-params(17))/params(17);
residual(15)= lhs-rhs;
lhs =y(20);
rhs =100*(y(7)-params(14))/params(14);
residual(16)= lhs-rhs;
lhs =y(22);
rhs =100*(y(12)-params(20))/params(20);
residual(17)= lhs-rhs;
lhs =y(23);
rhs =100*(y(17)-params(18));
residual(18)= lhs-rhs;
lhs =y(24);
rhs =100*(y(18)-params(16))/params(16);
residual(19)= lhs-rhs;
lhs =y(25);
rhs =100*(y(9)-params(19));
residual(20)= lhs-rhs;
lhs =y(26);
rhs =100*(y(17)-params(18));
residual(21)= lhs-rhs;
lhs =y(27);
rhs =100*(y(16)/y(14)-params(11)/params(17));
residual(22)= lhs-rhs;
lhs =y(28);
rhs =100*(y(13)/y(14)-params(12)/params(17));
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 34);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-y(18));
  g1(1,7)=(-(params(1)*1/(1-y(8))));
  g1(1,8)=(-(params(1)*y(7)/((1-y(8))*(1-y(8)))));
  g1(1,18)=1-y(6);
  g1(2,6)=(-(params(5)*y(30)*(-y(29))));
  g1(2,29)=(-(params(5)*(1-y(6))*y(30)));
  g1(2,19)=1;
  g1(2,30)=(-(params(5)*(1-params(2)+(1-y(6))*y(29))));
  g1(3,7)=(-((-1)/(y(7)*y(7))));
  g1(3,19)=1;
  g1(4,2)=(-(1-params(2)));
  g1(4,10)=1;
  g1(4,12)=(-1);
  g1(5,3)=(-(1-params(2)));
  g1(5,11)=1;
  g1(5,13)=(-1);
  g1(6,8)=(-(T51*getPowerDeriv(y(8),1-params(4),1)));
  g1(6,10)=(-(T53*y(15)*y(11)^params(3)*getPowerDeriv(y(10),params(4),1)));
  g1(6,11)=(-(T53*y(10)^params(4)*y(15)*getPowerDeriv(y(11),params(3),1)));
  g1(6,14)=1;
  g1(6,15)=(-(T53*y(11)^params(3)*y(10)^params(4)));
  g1(7,8)=y(18);
  g1(7,14)=(-(1-params(4)));
  g1(7,18)=y(8);
  g1(8,9)=y(2);
  g1(8,2)=y(9);
  g1(8,14)=(-params(4));
  g1(9,4)=(-(params(6)*1/params(10)/(y(4)/params(10))));
  g1(9,15)=1/params(10)/(y(15)/params(10));
  g1(9,31)=(-1);
  g1(10,6)=(-(y(18)*y(8)+y(2)*y(9)));
  g1(10,8)=(-(y(6)*y(18)));
  g1(10,9)=(-(y(6)*y(2)));
  g1(10,2)=(-(y(6)*y(9)));
  g1(10,13)=1;
  g1(10,16)=1;
  g1(10,17)=1;
  g1(10,18)=(-(y(6)*y(8)));
  g1(11,5)=(-params(8));
  g1(11,16)=1;
  g1(11,33)=(-1);
  g1(12,13)=1-params(9);
  g1(12,34)=(-1);
  g1(13,1)=(-(params(7)*1/params(13)/(y(1)/params(13))));
  g1(13,6)=1/params(13)/(y(6)/params(13));
  g1(13,32)=(-1);
  g1(14,7)=(-1);
  g1(14,12)=(-1);
  g1(14,13)=(-1);
  g1(14,14)=1;
  g1(14,16)=(-1);
  g1(15,14)=(-(100/params(17)));
  g1(15,21)=1;
  g1(16,7)=(-(100/params(14)));
  g1(16,20)=1;
  g1(17,12)=(-(100/params(20)));
  g1(17,22)=1;
  g1(18,17)=(-100);
  g1(18,23)=1;
  g1(19,18)=(-(100/params(16)));
  g1(19,24)=1;
  g1(20,9)=(-100);
  g1(20,25)=1;
  g1(21,17)=(-100);
  g1(21,26)=1;
  g1(22,14)=(-(100*(-y(16))/(y(14)*y(14))));
  g1(22,16)=(-(100*1/y(14)));
  g1(22,27)=1;
  g1(23,13)=(-(100*1/y(14)));
  g1(23,14)=(-(100*(-y(13))/(y(14)*y(14))));
  g1(23,28)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,1156);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,39304);
end
end
