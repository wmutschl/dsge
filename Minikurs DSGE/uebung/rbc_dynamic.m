function [residual, g1, g2, g3] = rbc_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(12, 1);
T18 = params(4)*y(1)^params(5)+(1-params(4))*y(5)^params(5);
T36 = y(6)^params(2);
T39 = (1-y(5))^(1-params(2));
T43 = (T36*T39)^(-params(3));
T46 = y(6)^(params(2)-1);
T47 = params(2)*T43*T46;
T54 = (1-y(5))^(-params(2));
lhs =y(14);
rhs =T18^(1/params(5));
residual(1)= lhs-rhs;
lhs =y(12);
rhs =params(4)*(y(14)/y(1))^(1-params(5));
residual(2)= lhs-rhs;
lhs =y(13);
rhs =(1-params(4))*(y(14)/y(5))^(1-params(5));
residual(3)= lhs-rhs;
lhs =y(10);
rhs =T39*T47;
residual(4)= lhs-rhs;
lhs =y(11);
rhs =(-(T36*(1-params(2))*T43*T54));
residual(5)= lhs-rhs;
lhs =y(10);
rhs =params(1)*y(16)*(1+y(15)*y(17)-params(6));
residual(6)= lhs-rhs;
lhs =y(7);
rhs =params(8)*exp(y(8));
residual(7)= lhs-rhs;
lhs =y(8);
rhs =params(7)*y(2)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(4);
rhs =y(14)*y(7);
residual(9)= lhs-rhs;
lhs =y(3);
rhs =y(9)+y(1)*(1-params(6));
residual(10)= lhs-rhs;
residual(11) = y(11)/y(10)+y(13)*y(7);
lhs =y(6)+y(3);
rhs =y(14)*y(7)+y(1)*(1-params(6));
residual(12)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(12, 18);

  %
  % Jacobian matrix
  %

T98 = params(4)*getPowerDeriv(y(1),params(5),1);
T99 = getPowerDeriv(T18,1/params(5),1);
T105 = getPowerDeriv(y(14)/y(1),1-params(5),1);
T111 = (1-params(4))*getPowerDeriv(y(5),params(5),1);
T116 = getPowerDeriv(y(14)/y(5),1-params(5),1);
T121 = (-(getPowerDeriv(1-y(5),1-params(2),1)));
T123 = getPowerDeriv(T36*T39,(-params(3)),1);
T134 = (-(getPowerDeriv(1-y(5),(-params(2)),1)));
T139 = getPowerDeriv(y(6),params(2),1);
T143 = getPowerDeriv(y(6),params(2)-1,1);
T146 = T46*params(2)*T123*T39*T139+params(2)*T43*T143;
T167 = 1/y(1);
T171 = 1/y(5);
  g1(1,1)=(-(T98*T99));
  g1(1,5)=(-(T99*T111));
  g1(1,14)=1;
  g1(2,1)=(-(params(4)*(-y(14))/(y(1)*y(1))*T105));
  g1(2,12)=1;
  g1(2,14)=(-(params(4)*T105*T167));
  g1(3,5)=(-((1-params(4))*(-y(14))/(y(5)*y(5))*T116));
  g1(3,13)=1;
  g1(3,14)=(-((1-params(4))*T116*T171));
  g1(4,5)=(-(T47*T121+T39*T46*params(2)*T36*T121*T123));
  g1(4,6)=(-(T39*T146));
  g1(4,10)=1;
  g1(5,5)=T54*T36*(1-params(2))*T36*T121*T123+T36*(1-params(2))*T43*T134;
  g1(5,6)=T54*((1-params(2))*T43*T139+T36*(1-params(2))*T123*T39*T139);
  g1(5,11)=1;
  g1(6,15)=(-(params(1)*y(16)*y(17)));
  g1(6,10)=1;
  g1(6,16)=(-(params(1)*(1+y(15)*y(17)-params(6))));
  g1(6,17)=(-(params(1)*y(16)*y(15)));
  g1(7,7)=1;
  g1(7,8)=(-(params(8)*exp(y(8))));
  g1(8,2)=(-params(7));
  g1(8,8)=1;
  g1(8,18)=(-1);
  g1(9,4)=1;
  g1(9,7)=(-y(14));
  g1(9,14)=(-y(7));
  g1(10,1)=(-(1-params(6)));
  g1(10,3)=1;
  g1(10,9)=(-1);
  g1(11,7)=y(13);
  g1(11,10)=(-y(11))/(y(10)*y(10));
  g1(11,11)=1/y(10);
  g1(11,13)=y(7);
  g1(12,1)=(-(1-params(6)));
  g1(12,3)=1;
  g1(12,6)=1;
  g1(12,7)=(-y(14));
  g1(12,14)=(-y(7));

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(36,3);
T178 = getPowerDeriv(T18,1/params(5),2);
T179 = T98*T178;
T198 = getPowerDeriv(y(14)/y(1),1-params(5),2);
T199 = (-y(14))/(y(1)*y(1))*T198;
T220 = getPowerDeriv(y(14)/y(5),1-params(5),2);
T221 = (-y(14))/(y(5)*y(5))*T220;
T237 = getPowerDeriv(1-y(5),1-params(2),2);
T243 = getPowerDeriv(T36*T39,(-params(3)),2);
T244 = T36*T121*T243;
T267 = getPowerDeriv(y(6),params(2),2);
  v2(1,1)=1;
  v2(1,2)=1;
  v2(1,3)=(-(T99*params(4)*getPowerDeriv(y(1),params(5),2)+T98*T179));
  v2(2,1)=1;
  v2(2,2)=73;
  v2(2,3)=(-(T111*T179));
  v2(3,1)=1;
  v2(3,2)=5;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=77;
  v2(4,3)=(-(T111*T111*T178+T99*(1-params(4))*getPowerDeriv(y(5),params(5),2)));
  v2(5,1)=2;
  v2(5,2)=1;
  v2(5,3)=(-(params(4)*(T105*(-((-y(14))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))+(-y(14))/(y(1)*y(1))*T199)));
  v2(6,1)=2;
  v2(6,2)=235;
  v2(6,3)=(-(params(4)*(T167*T199+T105*(-1)/(y(1)*y(1)))));
  v2(7,1)=2;
  v2(7,2)=14;
  v2(7,3)=  v2(6,3);
  v2(8,1)=2;
  v2(8,2)=248;
  v2(8,3)=(-(params(4)*T167*T167*T198));
  v2(9,1)=3;
  v2(9,2)=77;
  v2(9,3)=(-((1-params(4))*(T116*(-((-y(14))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+(-y(14))/(y(5)*y(5))*T221)));
  v2(10,1)=3;
  v2(10,2)=239;
  v2(10,3)=(-((1-params(4))*(T171*T221+T116*(-1)/(y(5)*y(5)))));
  v2(11,1)=3;
  v2(11,2)=86;
  v2(11,3)=  v2(10,3);
  v2(12,1)=3;
  v2(12,2)=248;
  v2(12,3)=(-((1-params(4))*T171*T171*T220));
  v2(13,1)=4;
  v2(13,2)=77;
  v2(13,3)=(-(T121*T46*params(2)*T36*T121*T123+T47*T237+T121*T46*params(2)*T36*T121*T123+T39*T46*params(2)*(T123*T36*T237+T36*T121*T244)));
  v2(14,1)=4;
  v2(14,2)=95;
  v2(14,3)=(-(T121*T146+T39*(T46*params(2)*(T39*T139*T244+T123*T121*T139)+params(2)*T36*T121*T123*T143)));
  v2(15,1)=4;
  v2(15,2)=78;
  v2(15,3)=  v2(14,3);
  v2(16,1)=4;
  v2(16,2)=96;
  v2(16,3)=(-(T39*(params(2)*T123*T39*T139*T143+T46*params(2)*(T39*T139*T39*T139*T243+T123*T39*T267)+params(2)*T123*T39*T139*T143+params(2)*T43*getPowerDeriv(y(6),params(2)-1,2))));
  v2(17,1)=5;
  v2(17,2)=77;
  v2(17,3)=T36*(1-params(2))*T36*T121*T123*T134+T54*T36*(1-params(2))*(T123*T36*T237+T36*T121*T244)+T36*(1-params(2))*T36*T121*T123*T134+T36*(1-params(2))*T43*getPowerDeriv(1-y(5),(-params(2)),2);
  v2(18,1)=5;
  v2(18,2)=95;
  v2(18,3)=T134*((1-params(2))*T43*T139+T36*(1-params(2))*T123*T39*T139)+T54*((1-params(2))*T36*T121*T123*T139+T36*(1-params(2))*(T39*T139*T244+T123*T121*T139));
  v2(19,1)=5;
  v2(19,2)=78;
  v2(19,3)=  v2(18,3);
  v2(20,1)=5;
  v2(20,2)=96;
  v2(20,3)=T54*(T139*(1-params(2))*T123*T39*T139+(1-params(2))*T43*T267+T139*(1-params(2))*T123*T39*T139+T36*(1-params(2))*(T39*T139*T39*T139*T243+T123*T39*T267));
  v2(21,1)=6;
  v2(21,2)=285;
  v2(21,3)=(-(params(1)*y(17)));
  v2(22,1)=6;
  v2(22,2)=268;
  v2(22,3)=  v2(21,3);
  v2(23,1)=6;
  v2(23,2)=303;
  v2(23,3)=(-(params(1)*y(16)));
  v2(24,1)=6;
  v2(24,2)=269;
  v2(24,3)=  v2(23,3);
  v2(25,1)=6;
  v2(25,2)=304;
  v2(25,3)=(-(params(1)*y(15)));
  v2(26,1)=6;
  v2(26,2)=287;
  v2(26,3)=  v2(25,3);
  v2(27,1)=7;
  v2(27,2)=134;
  v2(27,3)=(-(params(8)*exp(y(8))));
  v2(28,1)=9;
  v2(28,2)=241;
  v2(28,3)=(-1);
  v2(29,1)=9;
  v2(29,2)=122;
  v2(29,3)=  v2(28,3);
  v2(30,1)=11;
  v2(30,2)=172;
  v2(30,3)=(-((-y(11))*(y(10)+y(10))))/(y(10)*y(10)*y(10)*y(10));
  v2(31,1)=11;
  v2(31,2)=190;
  v2(31,3)=(-1)/(y(10)*y(10));
  v2(32,1)=11;
  v2(32,2)=173;
  v2(32,3)=  v2(31,3);
  v2(33,1)=11;
  v2(33,2)=223;
  v2(33,3)=1;
  v2(34,1)=11;
  v2(34,2)=121;
  v2(34,3)=  v2(33,3);
  v2(35,1)=12;
  v2(35,2)=241;
  v2(35,3)=(-1);
  v2(36,1)=12;
  v2(36,2)=122;
  v2(36,3)=  v2(35,3);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),12,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,5832);
end
end
end
end
