function [residual, g1, g2, g3] = task_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(6, 1);
T26 = y(7)*y(1)^params(3);
T29 = y(3)^(1-params(3));
T42 = (1-params(1))/params(1);
T51 = (1-y(3))^(1-params(1));
T52 = y(4)^params(1)*T51;
T62 = (1-y(9))^(1-params(1));
T63 = y(10)^params(1)*T62;
T66 = params(4)*T63^(1-params(2))/y(10);
T71 = 1+y(6)*y(7)*params(3)/y(1)-params(5);
T74 = getPowerDeriv(y(3),1-params(3),1);
T87 = y(4)^params(1)*(-(getPowerDeriv(1-y(3),1-params(1),1)));
T88 = getPowerDeriv(T52,1-params(2),1);
T93 = y(10)^params(1)*(-(getPowerDeriv(1-y(9),1-params(1),1)));
T94 = getPowerDeriv(T63,1-params(2),1);
T97 = params(4)*T93*T94/y(10);
T103 = T51*getPowerDeriv(y(4),params(1),1);
T110 = T62*getPowerDeriv(y(10),params(1),1);
T116 = params(4)*(y(10)*T94*T110-T63^(1-params(2)))/(y(10)*y(10));
T126 = (-(y(6)*y(7)*params(3)))/(y(1)*y(1));
lhs =y(7);
rhs =params(7)*exp(y(8));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =params(6)*y(2)+params(8)*x(it_, 1);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =T26*T29;
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(4)+y(5)-y(1)*(1-params(5));
residual(4)= lhs-rhs;
lhs =T42*y(4)/(1-y(3));
rhs =y(6)*y(7)*(1-params(3))/y(3);
residual(5)= lhs-rhs;
lhs =T52^(1-params(2))/y(4);
rhs =T66*T71;
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 11);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,8)=(-(params(7)*exp(y(8))));
  g1(2,2)=(-params(6));
  g1(2,8)=1;
  g1(2,11)=(-params(8));
  g1(3,3)=(-(T26*T74));
  g1(3,1)=(-(T29*y(7)*getPowerDeriv(y(1),params(3),1)));
  g1(3,6)=1;
  g1(3,7)=(-(y(1)^params(3)*T29));
  g1(4,4)=(-1);
  g1(4,1)=1-params(5);
  g1(4,5)=(-1);
  g1(4,6)=1;
  g1(5,3)=T42*y(4)/((1-y(3))*(1-y(3)))-(-(y(6)*y(7)*(1-params(3))))/(y(3)*y(3));
  g1(5,4)=T42*1/(1-y(3));
  g1(5,6)=(-(y(7)*(1-params(3))/y(3)));
  g1(5,7)=(-(y(6)*(1-params(3))/y(3)));
  g1(6,3)=T87*T88/y(4);
  g1(6,9)=(-(T71*T97));
  g1(6,4)=(y(4)*T88*T103-T52^(1-params(2)))/(y(4)*y(4));
  g1(6,10)=(-(T71*T116));
  g1(6,1)=(-(T66*T126));
  g1(6,6)=(-(T66*y(7)*params(3)/y(1)));
  g1(6,7)=(-(T66*y(6)*params(3)/y(1)));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(45,3);
  v2(1,1)=1;
  v2(1,2)=85;
  v2(1,3)=(-(params(7)*exp(y(8))));
  v2(2,1)=3;
  v2(2,2)=25;
  v2(2,3)=(-(T26*getPowerDeriv(y(3),1-params(3),2)));
  v2(3,1)=3;
  v2(3,2)=3;
  v2(3,3)=(-(T74*y(7)*getPowerDeriv(y(1),params(3),1)));
  v2(4,1)=3;
  v2(4,2)=23;
  v2(4,3)=  v2(3,3);
  v2(5,1)=3;
  v2(5,2)=1;
  v2(5,3)=(-(T29*y(7)*getPowerDeriv(y(1),params(3),2)));
  v2(6,1)=3;
  v2(6,2)=69;
  v2(6,3)=(-(y(1)^params(3)*T74));
  v2(7,1)=3;
  v2(7,2)=29;
  v2(7,3)=  v2(6,3);
  v2(8,1)=3;
  v2(8,2)=67;
  v2(8,3)=(-(T29*getPowerDeriv(y(1),params(3),1)));
  v2(9,1)=3;
  v2(9,2)=7;
  v2(9,3)=  v2(8,3);
  v2(10,1)=5;
  v2(10,2)=25;
  v2(10,3)=T42*(-(y(4)*((-(1-y(3)))-(1-y(3)))))/((1-y(3))*(1-y(3))*(1-y(3))*(1-y(3)))-(-((-(y(6)*y(7)*(1-params(3))))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3));
  v2(11,1)=5;
  v2(11,2)=36;
  v2(11,3)=T42*1/((1-y(3))*(1-y(3)));
  v2(12,1)=5;
  v2(12,2)=26;
  v2(12,3)=  v2(11,3);
  v2(13,1)=5;
  v2(13,2)=58;
  v2(13,3)=(-((-(y(7)*(1-params(3))))/(y(3)*y(3))));
  v2(14,1)=5;
  v2(14,2)=28;
  v2(14,3)=  v2(13,3);
  v2(15,1)=5;
  v2(15,2)=69;
  v2(15,3)=(-((-(y(6)*(1-params(3))))/(y(3)*y(3))));
  v2(16,1)=5;
  v2(16,2)=29;
  v2(16,3)=  v2(15,3);
  v2(17,1)=5;
  v2(17,2)=72;
  v2(17,3)=(-((1-params(3))/y(3)));
  v2(18,1)=5;
  v2(18,2)=62;
  v2(18,3)=  v2(17,3);
  v2(19,1)=6;
  v2(19,2)=25;
  v2(19,3)=(T88*y(4)^params(1)*getPowerDeriv(1-y(3),1-params(1),2)+T87*T87*getPowerDeriv(T52,1-params(2),2))/y(4);
  v2(20,1)=6;
  v2(20,2)=97;
  v2(20,3)=(-(T71*params(4)*(T94*y(10)^params(1)*getPowerDeriv(1-y(9),1-params(1),2)+T93*T93*getPowerDeriv(T63,1-params(2),2))/y(10)));
  v2(21,1)=6;
  v2(21,2)=36;
  v2(21,3)=(y(4)*(T103*T87*getPowerDeriv(T52,1-params(2),2)+T88*(-(getPowerDeriv(1-y(3),1-params(1),1)))*getPowerDeriv(y(4),params(1),1))-T87*T88)/(y(4)*y(4));
  v2(22,1)=6;
  v2(22,2)=26;
  v2(22,3)=  v2(21,3);
  v2(23,1)=6;
  v2(23,2)=37;
  v2(23,3)=(y(4)*y(4)*(T88*T103+y(4)*(T103*T103*getPowerDeriv(T52,1-params(2),2)+T88*T51*getPowerDeriv(y(4),params(1),2))-T88*T103)-(y(4)*T88*T103-T52^(1-params(2)))*(y(4)+y(4)))/(y(4)*y(4)*y(4)*y(4));
  v2(24,1)=6;
  v2(24,2)=108;
  v2(24,3)=(-(T71*params(4)*(y(10)*(T110*T93*getPowerDeriv(T63,1-params(2),2)+T94*(-(getPowerDeriv(1-y(9),1-params(1),1)))*getPowerDeriv(y(10),params(1),1))-T93*T94)/(y(10)*y(10))));
  v2(25,1)=6;
  v2(25,2)=98;
  v2(25,3)=  v2(24,3);
  v2(26,1)=6;
  v2(26,2)=109;
  v2(26,3)=(-(T71*params(4)*(y(10)*y(10)*(T94*T110+y(10)*(T110*T110*getPowerDeriv(T63,1-params(2),2)+T94*T62*getPowerDeriv(y(10),params(1),2))-T94*T110)-(y(10)*T94*T110-T63^(1-params(2)))*(y(10)+y(10)))/(y(10)*y(10)*y(10)*y(10))));
  v2(27,1)=6;
  v2(27,2)=9;
  v2(27,3)=(-(T97*T126));
  v2(28,1)=6;
  v2(28,2)=89;
  v2(28,3)=  v2(27,3);
  v2(29,1)=6;
  v2(29,2)=10;
  v2(29,3)=(-(T116*T126));
  v2(30,1)=6;
  v2(30,2)=100;
  v2(30,3)=  v2(29,3);
  v2(31,1)=6;
  v2(31,2)=1;
  v2(31,3)=(-(T66*(-((-(y(6)*y(7)*params(3)))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
  v2(32,1)=6;
  v2(32,2)=64;
  v2(32,3)=(-(T97*y(7)*params(3)/y(1)));
  v2(33,1)=6;
  v2(33,2)=94;
  v2(33,3)=  v2(32,3);
  v2(34,1)=6;
  v2(34,2)=65;
  v2(34,3)=(-(T116*y(7)*params(3)/y(1)));
  v2(35,1)=6;
  v2(35,2)=105;
  v2(35,3)=  v2(34,3);
  v2(36,1)=6;
  v2(36,2)=56;
  v2(36,3)=(-(T66*(-(y(7)*params(3)))/(y(1)*y(1))));
  v2(37,1)=6;
  v2(37,2)=6;
  v2(37,3)=  v2(36,3);
  v2(38,1)=6;
  v2(38,2)=75;
  v2(38,3)=(-(T97*y(6)*params(3)/y(1)));
  v2(39,1)=6;
  v2(39,2)=95;
  v2(39,3)=  v2(38,3);
  v2(40,1)=6;
  v2(40,2)=76;
  v2(40,3)=(-(T116*y(6)*params(3)/y(1)));
  v2(41,1)=6;
  v2(41,2)=106;
  v2(41,3)=  v2(40,3);
  v2(42,1)=6;
  v2(42,2)=67;
  v2(42,3)=(-(T66*(-(y(6)*params(3)))/(y(1)*y(1))));
  v2(43,1)=6;
  v2(43,2)=7;
  v2(43,3)=  v2(42,3);
  v2(44,1)=6;
  v2(44,2)=72;
  v2(44,3)=(-(T66*params(3)/y(1)));
  v2(45,1)=6;
  v2(45,2)=62;
  v2(45,3)=  v2(44,3);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),6,121);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1331);
end
end
