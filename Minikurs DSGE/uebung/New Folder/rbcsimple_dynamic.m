function [residual, g1, g2, g3] = rbcsimple_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(4, 1);
T12 = params(1)/y(9);
T20 = params(2)*exp(y(8))*y(5)^(params(2)-1);
T50 = (-(T12*T20));
T58 = (-(T12*params(2)*exp(y(8))*getPowerDeriv(y(5),params(2)-1,1)));
lhs =1/y(6);
rhs =T12*(1+T20-params(3));
residual(1)= lhs-rhs;
lhs =y(4);
rhs =params(4)*y(1)+x(it_, 1);
residual(2)= lhs-rhs;
lhs =y(5);
rhs =(1-params(3))*y(2)+exp(y(4))*y(2)^params(2)-y(6);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =0.9*y(3);
residual(4)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(4, 10);

  %
  % Jacobian matrix
  %

  g1(1,8)=T50;
  g1(1,5)=T58;
  g1(1,6)=(-1)/(y(6)*y(6));
  g1(1,9)=(-((1+T20-params(3))*(-params(1))/(y(9)*y(9))));
  g1(2,1)=(-params(4));
  g1(2,4)=1;
  g1(2,10)=(-1);
  g1(3,4)=(-(exp(y(4))*y(2)^params(2)));
  g1(3,2)=(-(1-params(3)+exp(y(4))*getPowerDeriv(y(2),params(2),1)));
  g1(3,5)=1;
  g1(3,6)=1;
  g1(4,3)=(-0.9);
  g1(4,7)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(14,3);
  v2(1,1)=1;
  v2(1,2)=78;
  v2(1,3)=T50;
  v2(2,1)=1;
  v2(2,2)=48;
  v2(2,3)=T58;
  v2(3,1)=1;
  v2(3,2)=75;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=45;
  v2(4,3)=(-(T12*params(2)*exp(y(8))*getPowerDeriv(y(5),params(2)-1,2)));
  v2(5,1)=1;
  v2(5,2)=56;
  v2(5,3)=(y(6)+y(6))/(y(6)*y(6)*y(6)*y(6));
  v2(6,1)=1;
  v2(6,2)=88;
  v2(6,3)=(-(T20*(-params(1))/(y(9)*y(9))));
  v2(7,1)=1;
  v2(7,2)=79;
  v2(7,3)=  v2(6,3);
  v2(8,1)=1;
  v2(8,2)=85;
  v2(8,3)=(-(params(2)*exp(y(8))*getPowerDeriv(y(5),params(2)-1,1)*(-params(1))/(y(9)*y(9))));
  v2(9,1)=1;
  v2(9,2)=49;
  v2(9,3)=  v2(8,3);
  v2(10,1)=1;
  v2(10,2)=89;
  v2(10,3)=(-((1+T20-params(3))*(-((-params(1))*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9))));
  v2(11,1)=3;
  v2(11,2)=34;
  v2(11,3)=(-(exp(y(4))*y(2)^params(2)));
  v2(12,1)=3;
  v2(12,2)=14;
  v2(12,3)=(-(exp(y(4))*getPowerDeriv(y(2),params(2),1)));
  v2(13,1)=3;
  v2(13,2)=32;
  v2(13,3)=  v2(12,3);
  v2(14,1)=3;
  v2(14,2)=12;
  v2(14,3)=(-(exp(y(4))*getPowerDeriv(y(2),params(2),2)));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),4,100);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],4,1000);
end
end
