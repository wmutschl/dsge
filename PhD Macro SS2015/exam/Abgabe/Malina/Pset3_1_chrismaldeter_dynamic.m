function [residual, g1, g2, g3] = Pset3_1_chrismaldeter_dynamic(y, x, params, steady_state, it_)
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
T65 = y(18)*y(2)^params(3)*y(1)^params(4);
T66 = y(11)^(1-params(4));
lhs =(1-y(27))*y(15);
rhs =params(6)*y(8)/(1-y(11));
residual(1)= lhs-rhs;
lhs =1/y(8);
rhs =params(1)*1/y(29)*(1-params(2)+(1-y(31))*y(30));
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(8)+y(13)+y(14)+y(12);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(13)+(1-params(2))*y(1);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(12)+(1-params(2))*y(2);
residual(5)= lhs-rhs;
lhs =y(15)*y(11);
rhs =y(7)*(1-params(4));
residual(6)= lhs-rhs;
lhs =y(1)*y(16);
rhs =y(7)*params(4);
residual(7)= lhs-rhs;
lhs =y(7);
rhs =T65*T66;
residual(8)= lhs-rhs;
lhs =y(14)+y(12)+y(17);
rhs =y(27)*(y(15)*y(11)+y(1)*y(16));
residual(9)= lhs-rhs;
lhs =y(14)-(steady_state(8));
rhs =params(5)*(y(4)-(steady_state(8)));
residual(10)= lhs-rhs;
lhs =y(12)-(steady_state(6));
rhs =params(5)*(y(3)-(steady_state(6)));
residual(11)= lhs-rhs;
lhs =log(y(27)/(steady_state(21)));
rhs =params(5)*log(y(6)/(steady_state(21)));
residual(12)= lhs-rhs;
lhs =log(y(18)/(steady_state(12)));
rhs =params(5)*log(y(5)/(steady_state(12)));
residual(13)= lhs-rhs;
lhs =y(19);
rhs =100*(y(7)-(steady_state(1)))/(steady_state(1));
residual(14)= lhs-rhs;
lhs =y(20);
rhs =100*(y(8)-(steady_state(2)))/(steady_state(2));
residual(15)= lhs-rhs;
lhs =y(21);
rhs =100*(y(13)-(steady_state(7)))/(steady_state(7));
residual(16)= lhs-rhs;
lhs =y(22);
rhs =100*(y(11)-(steady_state(5)));
residual(17)= lhs-rhs;
lhs =y(23);
rhs =100*(y(15)-(steady_state(9)))/(steady_state(9));
residual(18)= lhs-rhs;
lhs =y(24);
rhs =100*(y(16)-(steady_state(10)));
residual(19)= lhs-rhs;
lhs =y(25);
rhs =100*(y(17)-(steady_state(11)));
residual(20)= lhs-rhs;
lhs =y(26);
rhs =100*(y(14)/y(7)-(steady_state(8))/(steady_state(1)));
residual(21)= lhs-rhs;
lhs =y(28);
rhs =100*(y(12)/y(7)-(steady_state(6))/(steady_state(1)));
residual(22)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(22, 31);

  %
  % Jacobian matrix
  %

  g1(1,8)=(-(params(6)/(1-y(11))));
  g1(1,11)=(-(params(6)*y(8)/((1-y(11))*(1-y(11)))));
  g1(1,15)=1-y(27);
  g1(1,27)=(-y(15));
  g1(2,8)=(-1)/(y(8)*y(8));
  g1(2,29)=(-(params(1)*(1-params(2)+(1-y(31))*y(30))*(-1)/(y(29)*y(29))));
  g1(2,30)=(-(params(1)*1/y(29)*(1-y(31))));
  g1(2,31)=(-(params(1)*1/y(29)*(-y(30))));
  g1(3,7)=1;
  g1(3,8)=(-1);
  g1(3,12)=(-1);
  g1(3,13)=(-1);
  g1(3,14)=(-1);
  g1(4,1)=(-(1-params(2)));
  g1(4,9)=1;
  g1(4,13)=(-1);
  g1(5,2)=(-(1-params(2)));
  g1(5,10)=1;
  g1(5,12)=(-1);
  g1(6,7)=(-(1-params(4)));
  g1(6,11)=y(15);
  g1(6,15)=y(11);
  g1(7,7)=(-params(4));
  g1(7,1)=y(16);
  g1(7,16)=y(1);
  g1(8,7)=1;
  g1(8,1)=(-(T66*y(18)*y(2)^params(3)*getPowerDeriv(y(1),params(4),1)));
  g1(8,2)=(-(T66*y(1)^params(4)*y(18)*getPowerDeriv(y(2),params(3),1)));
  g1(8,11)=(-(T65*getPowerDeriv(y(11),1-params(4),1)));
  g1(8,18)=(-(T66*y(2)^params(3)*y(1)^params(4)));
  g1(9,1)=(-(y(27)*y(16)));
  g1(9,11)=(-(y(27)*y(15)));
  g1(9,12)=1;
  g1(9,14)=1;
  g1(9,15)=(-(y(27)*y(11)));
  g1(9,16)=(-(y(27)*y(1)));
  g1(9,17)=1;
  g1(9,27)=(-(y(15)*y(11)+y(1)*y(16)));
  g1(10,4)=(-params(5));
  g1(10,14)=1;
  g1(11,3)=(-params(5));
  g1(11,12)=1;
  g1(12,6)=(-(params(5)*1/(steady_state(21))/(y(6)/(steady_state(21)))));
  g1(12,27)=1/(steady_state(21))/(y(27)/(steady_state(21)));
  g1(13,5)=(-(params(5)*1/(steady_state(12))/(y(5)/(steady_state(12)))));
  g1(13,18)=1/(steady_state(12))/(y(18)/(steady_state(12)));
  g1(14,7)=(-(100/(steady_state(1))));
  g1(14,19)=1;
  g1(15,8)=(-(100/(steady_state(2))));
  g1(15,20)=1;
  g1(16,13)=(-(100/(steady_state(7))));
  g1(16,21)=1;
  g1(17,11)=(-100);
  g1(17,22)=1;
  g1(18,15)=(-(100/(steady_state(9))));
  g1(18,23)=1;
  g1(19,16)=(-100);
  g1(19,24)=1;
  g1(20,17)=(-100);
  g1(20,25)=1;
  g1(21,7)=(-(100*(-y(14))/(y(7)*y(7))));
  g1(21,14)=(-(100*1/y(7)));
  g1(21,26)=1;
  g1(22,7)=(-(100*(-y(12))/(y(7)*y(7))));
  g1(22,12)=(-(100*1/y(7)));
  g1(22,28)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],22,961);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],22,29791);
end
end
