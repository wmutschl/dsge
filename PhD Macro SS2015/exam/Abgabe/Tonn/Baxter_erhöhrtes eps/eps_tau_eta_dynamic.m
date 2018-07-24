function [residual, g1, g2, g3] = eps_tau_eta_dynamic(y, x, params, steady_state, it_)
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
T53 = y(15)*y(6)^params(3)*y(1)^params(1);
T55 = y(8)^(1-params(1));
lhs =(1-y(14))*y(11);
rhs =params(5)*y(7)/(1-y(8));
residual(1)= lhs-rhs;
lhs =y(20);
rhs =params(2)*y(32)*(1-params(4)+(1-y(31))*y(30));
residual(2)= lhs-rhs;
lhs =y(20);
rhs =1/y(7);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =(1-params(4))*y(1)+y(9);
residual(4)= lhs-rhs;
lhs =y(19);
rhs =(1-params(4))*y(6)+y(18);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =T53*T55;
residual(6)= lhs-rhs;
lhs =y(11)*y(8);
rhs =y(13)*(1-params(1));
residual(7)= lhs-rhs;
lhs =y(1)*y(12);
rhs =y(13)*params(1);
residual(8)= lhs-rhs;
lhs =log(y(15)/(steady_state(9)));
rhs =params(6)*log(y(3)/(steady_state(9)))+params(10)*x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(18)+y(17)+y(16);
rhs =y(14)*(y(11)*y(8)+y(1)*y(12));
residual(10)= lhs-rhs;
lhs =y(17)-(steady_state(11));
rhs =params(7)*(y(4)-(steady_state(11)))+params(13)*x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(18)-(steady_state(12));
rhs =params(8)*(y(5)-(steady_state(12)))+params(12)*x(it_, 3);
residual(12)= lhs-rhs;
lhs =log(y(14)/(steady_state(8)));
rhs =params(9)*log(y(2)/(steady_state(8)))+params(11)*x(it_, 4);
residual(13)= lhs-rhs;
lhs =y(13);
rhs =y(18)+y(17)+y(7)+y(9);
residual(14)= lhs-rhs;
lhs =y(21);
rhs =100*(y(13)-(steady_state(7)))/(steady_state(7));
residual(15)= lhs-rhs;
lhs =y(22);
rhs =100*(y(7)-(steady_state(1)))/(steady_state(1));
residual(16)= lhs-rhs;
lhs =y(23);
rhs =100*(y(9)-(steady_state(3)))/(steady_state(3));
residual(17)= lhs-rhs;
lhs =y(24);
rhs =100*(y(8)-(steady_state(2)));
residual(18)= lhs-rhs;
lhs =y(25);
rhs =100*(y(11)-(steady_state(5)))/(steady_state(5));
residual(19)= lhs-rhs;
lhs =y(26);
rhs =100*(y(12)-(steady_state(6)));
residual(20)= lhs-rhs;
lhs =y(27);
rhs =100*(y(16)-(steady_state(10)));
residual(21)= lhs-rhs;
residual(22) = y(28);
residual(23) = y(29);
if nargout >= 2,
  g1 = zeros(23, 36);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-(params(5)*1/(1-y(8))));
  g1(1,8)=(-(params(5)*y(7)/((1-y(8))*(1-y(8)))));
  g1(1,11)=1-y(14);
  g1(1,14)=(-y(11));
  g1(2,30)=(-(params(2)*y(32)*(1-y(31))));
  g1(2,31)=(-(params(2)*y(32)*(-y(30))));
  g1(2,20)=1;
  g1(2,32)=(-(params(2)*(1-params(4)+(1-y(31))*y(30))));
  g1(3,7)=(-((-1)/(y(7)*y(7))));
  g1(3,20)=1;
  g1(4,9)=(-1);
  g1(4,1)=(-(1-params(4)));
  g1(4,10)=1;
  g1(5,18)=(-1);
  g1(5,6)=(-(1-params(4)));
  g1(5,19)=1;
  g1(6,8)=(-(T53*getPowerDeriv(y(8),1-params(1),1)));
  g1(6,1)=(-(T55*y(15)*y(6)^params(3)*getPowerDeriv(y(1),params(1),1)));
  g1(6,13)=1;
  g1(6,15)=(-(T55*y(6)^params(3)*y(1)^params(1)));
  g1(6,6)=(-(T55*y(1)^params(1)*y(15)*getPowerDeriv(y(6),params(3),1)));
  g1(7,8)=y(11);
  g1(7,11)=y(8);
  g1(7,13)=(-(1-params(1)));
  g1(8,1)=y(12);
  g1(8,12)=y(1);
  g1(8,13)=(-params(1));
  g1(9,3)=(-(params(6)*1/(steady_state(9))/(y(3)/(steady_state(9)))));
  g1(9,15)=1/(steady_state(9))/(y(15)/(steady_state(9)));
  g1(9,33)=(-params(10));
  g1(10,8)=(-(y(14)*y(11)));
  g1(10,1)=(-(y(14)*y(12)));
  g1(10,11)=(-(y(14)*y(8)));
  g1(10,12)=(-(y(14)*y(1)));
  g1(10,14)=(-(y(11)*y(8)+y(1)*y(12)));
  g1(10,16)=1;
  g1(10,17)=1;
  g1(10,18)=1;
  g1(11,4)=(-params(7));
  g1(11,17)=1;
  g1(11,34)=(-params(13));
  g1(12,5)=(-params(8));
  g1(12,18)=1;
  g1(12,35)=(-params(12));
  g1(13,2)=(-(params(9)*1/(steady_state(8))/(y(2)/(steady_state(8)))));
  g1(13,14)=1/(steady_state(8))/(y(14)/(steady_state(8)));
  g1(13,36)=(-params(11));
  g1(14,7)=(-1);
  g1(14,9)=(-1);
  g1(14,13)=1;
  g1(14,17)=(-1);
  g1(14,18)=(-1);
  g1(15,13)=(-(100*1/(steady_state(7))));
  g1(15,21)=1;
  g1(16,7)=(-(100*1/(steady_state(1))));
  g1(16,22)=1;
  g1(17,9)=(-(100*1/(steady_state(3))));
  g1(17,23)=1;
  g1(18,8)=(-100);
  g1(18,24)=1;
  g1(19,11)=(-(100*1/(steady_state(5))));
  g1(19,25)=1;
  g1(20,12)=(-100);
  g1(20,26)=1;
  g1(21,16)=(-100);
  g1(21,27)=1;
  g1(22,28)=1;
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
