function [residual, g1, g2, g3] = AnScho_dynamic(y, x, params, steady_state, it_)
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
%                                                           columns: equations in order of declaration
%                                                           rows: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(9, 1);
T21 = exp((-params(2))*y(14)+params(2)*y(5)+y(6)-y(17)-y(15));
T29 = (1-params(3))/(params(3)*params(5)*params(6));
T39 = exp(y(7))*(1-1/(2*params(3)));
T40 = 1/(2*params(3))+T39;
T50 = exp(y(15)+(-params(2))*y(14)+params(2)*y(5)+y(16)-y(8));
lhs =1;
rhs =T21;
residual(1)= lhs-rhs;
lhs =T29*(exp(params(2)*y(5))-1);
rhs =(exp(y(7))-1)*T40-params(1)*(exp(y(15))-1)*T50;
residual(2)= lhs-rhs;
lhs =exp(y(5)-y(8));
rhs =exp((-y(9)))-params(5)*params(6)*params(7)/2*(exp(y(7))-1)^2;
residual(3)= lhs-rhs;
lhs =y(6);
rhs =params(8)*y(1)+y(7)*(1-params(8))*params(11)+(1-params(8))*params(12)*(y(8)-y(9))+x(it_, 1);
residual(4)= lhs-rhs;
lhs =y(9);
rhs =params(9)*y(3)+x(it_, 2);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =params(10)*y(4)+x(it_, 3);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =params(13)+100*(y(10)+y(8)-y(2));
residual(7)= lhs-rhs;
lhs =y(12);
rhs =params(14)+y(7)*400;
residual(8)= lhs-rhs;
lhs =y(13);
rhs =params(14)+params(15)+params(13)*4+y(6)*400;
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 20);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-(params(2)*T21));
  g1(1,14)=(-((-params(2))*T21));
  g1(1,6)=(-T21);
  g1(1,15)=T21;
  g1(1,17)=T21;
  g1(2,5)=T29*params(2)*exp(params(2)*y(5))-(-(params(1)*(exp(y(15))-1)*params(2)*T50));
  g1(2,14)=params(1)*(exp(y(15))-1)*(-params(2))*T50;
  g1(2,7)=(-(exp(y(7))*T40+(exp(y(7))-1)*T39));
  g1(2,15)=params(1)*((exp(y(15))-1)*T50+exp(y(15))*T50);
  g1(2,8)=params(1)*(exp(y(15))-1)*(-T50);
  g1(2,16)=params(1)*(exp(y(15))-1)*T50;
  g1(3,5)=exp(y(5)-y(8));
  g1(3,7)=params(5)*params(6)*params(7)/2*exp(y(7))*2*(exp(y(7))-1);
  g1(3,8)=(-exp(y(5)-y(8)));
  g1(3,9)=exp((-y(9)));
  g1(4,1)=(-params(8));
  g1(4,6)=1;
  g1(4,7)=(-((1-params(8))*params(11)));
  g1(4,8)=(-((1-params(8))*params(12)));
  g1(4,9)=(1-params(8))*params(12);
  g1(4,18)=(-1);
  g1(5,3)=(-params(9));
  g1(5,9)=1;
  g1(5,19)=(-1);
  g1(6,4)=(-params(10));
  g1(6,10)=1;
  g1(6,20)=(-1);
  g1(7,2)=100;
  g1(7,8)=(-100);
  g1(7,10)=(-100);
  g1(7,11)=1;
  g1(8,7)=(-400);
  g1(8,12)=1;
  g1(9,6)=(-400);
  g1(9,13)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(57,3);
  v2(1,1)=1;
  v2(1,2)=85;
  v2(1,3)=(-(params(2)*params(2)*T21));
  v2(2,1)=1;
  v2(2,2)=265;
  v2(2,3)=(-((-params(2))*params(2)*T21));
  v2(3,1)=1;
  v2(3,2)=94;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=274;
  v2(4,3)=(-((-params(2))*(-params(2))*T21));
  v2(5,1)=1;
  v2(5,2)=105;
  v2(5,3)=(-(params(2)*T21));
  v2(6,1)=1;
  v2(6,2)=86;
  v2(6,3)=  v2(5,3);
  v2(7,1)=1;
  v2(7,2)=114;
  v2(7,3)=(-((-params(2))*T21));
  v2(8,1)=1;
  v2(8,2)=266;
  v2(8,3)=  v2(7,3);
  v2(9,1)=1;
  v2(9,2)=106;
  v2(9,3)=(-T21);
  v2(10,1)=1;
  v2(10,2)=285;
  v2(10,3)=params(2)*T21;
  v2(11,1)=1;
  v2(11,2)=95;
  v2(11,3)=  v2(10,3);
  v2(12,1)=1;
  v2(12,2)=294;
  v2(12,3)=(-params(2))*T21;
  v2(13,1)=1;
  v2(13,2)=275;
  v2(13,3)=  v2(12,3);
  v2(14,1)=1;
  v2(14,2)=286;
  v2(14,3)=T21;
  v2(15,1)=1;
  v2(15,2)=115;
  v2(15,3)=  v2(14,3);
  v2(16,1)=1;
  v2(16,2)=295;
  v2(16,3)=(-T21);
  v2(17,1)=1;
  v2(17,2)=325;
  v2(17,3)=params(2)*T21;
  v2(18,1)=1;
  v2(18,2)=97;
  v2(18,3)=  v2(17,3);
  v2(19,1)=1;
  v2(19,2)=334;
  v2(19,3)=(-params(2))*T21;
  v2(20,1)=1;
  v2(20,2)=277;
  v2(20,3)=  v2(19,3);
  v2(21,1)=1;
  v2(21,2)=326;
  v2(21,3)=T21;
  v2(22,1)=1;
  v2(22,2)=117;
  v2(22,3)=  v2(21,3);
  v2(23,1)=1;
  v2(23,2)=335;
  v2(23,3)=(-T21);
  v2(24,1)=1;
  v2(24,2)=297;
  v2(24,3)=  v2(23,3);
  v2(25,1)=1;
  v2(25,2)=337;
  v2(25,3)=(-T21);
  v2(26,1)=2;
  v2(26,2)=85;
  v2(26,3)=T29*params(2)*params(2)*exp(params(2)*y(5))-(-(params(1)*(exp(y(15))-1)*params(2)*params(2)*T50));
  v2(27,1)=2;
  v2(27,2)=265;
  v2(27,3)=params(1)*(exp(y(15))-1)*(-params(2))*params(2)*T50;
  v2(28,1)=2;
  v2(28,2)=94;
  v2(28,3)=  v2(27,3);
  v2(29,1)=2;
  v2(29,2)=274;
  v2(29,3)=params(1)*(exp(y(15))-1)*(-params(2))*(-params(2))*T50;
  v2(30,1)=2;
  v2(30,2)=127;
  v2(30,3)=(-(exp(y(7))*T40+exp(y(7))*T39+(exp(y(7))-1)*T39+exp(y(7))*T39));
  v2(31,1)=2;
  v2(31,2)=285;
  v2(31,3)=params(1)*((exp(y(15))-1)*params(2)*T50+exp(y(15))*params(2)*T50);
  v2(32,1)=2;
  v2(32,2)=95;
  v2(32,3)=  v2(31,3);
  v2(33,1)=2;
  v2(33,2)=294;
  v2(33,3)=params(1)*((exp(y(15))-1)*(-params(2))*T50+exp(y(15))*(-params(2))*T50);
  v2(34,1)=2;
  v2(34,2)=275;
  v2(34,3)=  v2(33,3);
  v2(35,1)=2;
  v2(35,2)=295;
  v2(35,3)=params(1)*((exp(y(15))-1)*T50+exp(y(15))*T50+exp(y(15))*T50+exp(y(15))*T50);
  v2(36,1)=2;
  v2(36,2)=145;
  v2(36,3)=params(1)*(exp(y(15))-1)*(-(params(2)*T50));
  v2(37,1)=2;
  v2(37,2)=88;
  v2(37,3)=  v2(36,3);
  v2(38,1)=2;
  v2(38,2)=154;
  v2(38,3)=params(1)*(exp(y(15))-1)*(-((-params(2))*T50));
  v2(39,1)=2;
  v2(39,2)=268;
  v2(39,3)=  v2(38,3);
  v2(40,1)=2;
  v2(40,2)=155;
  v2(40,3)=params(1)*((exp(y(15))-1)*(-T50)+exp(y(15))*(-T50));
  v2(41,1)=2;
  v2(41,2)=288;
  v2(41,3)=  v2(40,3);
  v2(42,1)=2;
  v2(42,2)=148;
  v2(42,3)=params(1)*(exp(y(15))-1)*T50;
  v2(43,1)=2;
  v2(43,2)=305;
  v2(43,3)=params(1)*(exp(y(15))-1)*params(2)*T50;
  v2(44,1)=2;
  v2(44,2)=96;
  v2(44,3)=  v2(43,3);
  v2(45,1)=2;
  v2(45,2)=314;
  v2(45,3)=params(1)*(exp(y(15))-1)*(-params(2))*T50;
  v2(46,1)=2;
  v2(46,2)=276;
  v2(46,3)=  v2(45,3);
  v2(47,1)=2;
  v2(47,2)=315;
  v2(47,3)=params(1)*((exp(y(15))-1)*T50+exp(y(15))*T50);
  v2(48,1)=2;
  v2(48,2)=296;
  v2(48,3)=  v2(47,3);
  v2(49,1)=2;
  v2(49,2)=308;
  v2(49,3)=params(1)*(exp(y(15))-1)*(-T50);
  v2(50,1)=2;
  v2(50,2)=156;
  v2(50,3)=  v2(49,3);
  v2(51,1)=2;
  v2(51,2)=316;
  v2(51,3)=params(1)*(exp(y(15))-1)*T50;
  v2(52,1)=3;
  v2(52,2)=85;
  v2(52,3)=exp(y(5)-y(8));
  v2(53,1)=3;
  v2(53,2)=127;
  v2(53,3)=params(5)*params(6)*params(7)/2*(exp(y(7))*2*(exp(y(7))-1)+exp(y(7))*2*exp(y(7)));
  v2(54,1)=3;
  v2(54,2)=145;
  v2(54,3)=(-exp(y(5)-y(8)));
  v2(55,1)=3;
  v2(55,2)=88;
  v2(55,3)=  v2(54,3);
  v2(56,1)=3;
  v2(56,2)=148;
  v2(56,3)=exp(y(5)-y(8));
  v2(57,1)=3;
  v2(57,2)=169;
  v2(57,3)=(-exp((-y(9))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),9,400);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,8000);
end
end
