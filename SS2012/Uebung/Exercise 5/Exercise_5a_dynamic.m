function [residual, g1, g2, g3] = Exercise_5a_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(6, 1);
T32 = params(3)*y(1)^params(4)+(1-params(3))*y(3)^params(4);
T34 = T32^(1/params(4));
T47 = (1-params(1))/params(1);
T52 = (1-params(3))*y(7)^params(4);
T55 = (y(6)/y(3))^(1-params(4));
T59 = (1-y(3))^(1-params(1));
T60 = y(4)^params(1)*T59;
T70 = (1-y(9))^(1-params(1));
T71 = y(10)^params(1)*T70;
T74 = params(5)*T71^(1-params(2))/y(10);
T75 = params(3)*y(7)^params(4);
T78 = (y(11)/y(5))^(1-params(4));
T81 = 1+T75*T78-params(6);
T85 = (1-params(3))*getPowerDeriv(y(3),params(4),1);
T86 = getPowerDeriv(T32,1/params(4),1);
T97 = getPowerDeriv(y(6)/y(3),1-params(4),1);
T103 = y(4)^params(1)*(-(getPowerDeriv(1-y(3),1-params(1),1)));
T104 = getPowerDeriv(T60,1-params(2),1);
T109 = y(10)^params(1)*(-(getPowerDeriv(1-y(9),1-params(1),1)));
T110 = getPowerDeriv(T71,1-params(2),1);
T113 = params(5)*T109*T110/y(10);
T119 = T59*getPowerDeriv(y(4),params(1),1);
T126 = T70*getPowerDeriv(y(10),params(1),1);
T132 = params(5)*(y(10)*T110*T126-T71^(1-params(2)))/(y(10)*y(10));
T136 = params(3)*getPowerDeriv(y(1),params(4),1);
T144 = getPowerDeriv(y(11)/y(5),1-params(4),1);
T146 = T75*(-y(11))/(y(5)*y(5))*T144;
T149 = 1/y(3);
T153 = 1/y(5);
T160 = (1-params(3))*getPowerDeriv(y(7),params(4),1);
T163 = params(3)*getPowerDeriv(y(7),params(4),1);
T164 = T78*T163;
T172 = getPowerDeriv(T32,1/params(4),2);
T173 = T85*T172;
T204 = getPowerDeriv(y(6)/y(3),1-params(4),2);
T205 = (-y(6))/(y(3)*y(3))*T204;
T311 = getPowerDeriv(y(11)/y(5),1-params(4),2);
T312 = (-y(11))/(y(5)*y(5))*T311;
lhs =y(7);
rhs =params(8)*exp(y(8));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =params(7)*y(2)+params(9)*x(it_, 1);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(7)*T34;
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(4)+y(5)-y(1)*(1-params(6));
residual(4)= lhs-rhs;
lhs =T47*y(4)/(1-y(3));
rhs =T52*T55;
residual(5)= lhs-rhs;
lhs =T60^(1-params(2))/y(4);
rhs =T74*T81;
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 12);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,8)=(-(params(8)*exp(y(8))));
  g1(2,2)=(-params(7));
  g1(2,8)=1;
  g1(2,12)=(-params(9));
  g1(3,3)=(-(y(7)*T85*T86));
  g1(3,1)=(-(y(7)*T86*T136));
  g1(3,6)=1;
  g1(3,7)=(-T34);
  g1(4,4)=(-1);
  g1(4,1)=1-params(6);
  g1(4,5)=(-1);
  g1(4,6)=1;
  g1(5,3)=T47*y(4)/((1-y(3))*(1-y(3)))-T52*(-y(6))/(y(3)*y(3))*T97;
  g1(5,4)=T47*1/(1-y(3));
  g1(5,6)=(-(T52*T97*T149));
  g1(5,7)=(-(T55*T160));
  g1(6,3)=T103*T104/y(4);
  g1(6,9)=(-(T81*T113));
  g1(6,4)=(y(4)*T104*T119-T60^(1-params(2)))/(y(4)*y(4));
  g1(6,10)=(-(T81*T132));
  g1(6,5)=(-(T74*T146));
  g1(6,11)=(-(T74*T75*T144*T153));
  g1(6,7)=(-(T74*T164));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(49,3);
  v2(1,1)=1;
  v2(1,2)=92;
  v2(1,3)=(-(params(8)*exp(y(8))));
  v2(2,1)=3;
  v2(2,2)=27;
  v2(2,3)=(-(y(7)*(T86*(1-params(3))*getPowerDeriv(y(3),params(4),2)+T85*T173)));
  v2(3,1)=3;
  v2(3,2)=3;
  v2(3,3)=(-(y(7)*T136*T173));
  v2(4,1)=3;
  v2(4,2)=25;
  v2(4,3)=  v2(3,3);
  v2(5,1)=3;
  v2(5,2)=1;
  v2(5,3)=(-(y(7)*(T136*T136*T172+T86*params(3)*getPowerDeriv(y(1),params(4),2))));
  v2(6,1)=3;
  v2(6,2)=75;
  v2(6,3)=(-(T85*T86));
  v2(7,1)=3;
  v2(7,2)=31;
  v2(7,3)=  v2(6,3);
  v2(8,1)=3;
  v2(8,2)=73;
  v2(8,3)=(-(T86*T136));
  v2(9,1)=3;
  v2(9,2)=7;
  v2(9,3)=  v2(8,3);
  v2(10,1)=5;
  v2(10,2)=27;
  v2(10,3)=T47*(-(y(4)*((-(1-y(3)))-(1-y(3)))))/((1-y(3))*(1-y(3))*(1-y(3))*(1-y(3)))-T52*(T97*(-((-y(6))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3))+(-y(6))/(y(3)*y(3))*T205);
  v2(11,1)=5;
  v2(11,2)=39;
  v2(11,3)=T47*1/((1-y(3))*(1-y(3)));
  v2(12,1)=5;
  v2(12,2)=28;
  v2(12,3)=  v2(11,3);
  v2(13,1)=5;
  v2(13,2)=63;
  v2(13,3)=(-(T52*(T149*T205+T97*(-1)/(y(3)*y(3)))));
  v2(14,1)=5;
  v2(14,2)=30;
  v2(14,3)=  v2(13,3);
  v2(15,1)=5;
  v2(15,2)=66;
  v2(15,3)=(-(T52*T149*T149*T204));
  v2(16,1)=5;
  v2(16,2)=75;
  v2(16,3)=(-((-y(6))/(y(3)*y(3))*T97*T160));
  v2(17,1)=5;
  v2(17,2)=31;
  v2(17,3)=  v2(16,3);
  v2(18,1)=5;
  v2(18,2)=78;
  v2(18,3)=(-(T97*T149*T160));
  v2(19,1)=5;
  v2(19,2)=67;
  v2(19,3)=  v2(18,3);
  v2(20,1)=5;
  v2(20,2)=79;
  v2(20,3)=(-(T55*(1-params(3))*getPowerDeriv(y(7),params(4),2)));
  v2(21,1)=6;
  v2(21,2)=27;
  v2(21,3)=(T104*y(4)^params(1)*getPowerDeriv(1-y(3),1-params(1),2)+T103*T103*getPowerDeriv(T60,1-params(2),2))/y(4);
  v2(22,1)=6;
  v2(22,2)=105;
  v2(22,3)=(-(T81*params(5)*(T110*y(10)^params(1)*getPowerDeriv(1-y(9),1-params(1),2)+T109*T109*getPowerDeriv(T71,1-params(2),2))/y(10)));
  v2(23,1)=6;
  v2(23,2)=39;
  v2(23,3)=(y(4)*(T119*T103*getPowerDeriv(T60,1-params(2),2)+T104*(-(getPowerDeriv(1-y(3),1-params(1),1)))*getPowerDeriv(y(4),params(1),1))-T103*T104)/(y(4)*y(4));
  v2(24,1)=6;
  v2(24,2)=28;
  v2(24,3)=  v2(23,3);
  v2(25,1)=6;
  v2(25,2)=40;
  v2(25,3)=(y(4)*y(4)*(T104*T119+y(4)*(T119*T119*getPowerDeriv(T60,1-params(2),2)+T104*T59*getPowerDeriv(y(4),params(1),2))-T104*T119)-(y(4)*T104*T119-T60^(1-params(2)))*(y(4)+y(4)))/(y(4)*y(4)*y(4)*y(4));
  v2(26,1)=6;
  v2(26,2)=117;
  v2(26,3)=(-(T81*params(5)*(y(10)*(T126*T109*getPowerDeriv(T71,1-params(2),2)+T110*(-(getPowerDeriv(1-y(9),1-params(1),1)))*getPowerDeriv(y(10),params(1),1))-T109*T110)/(y(10)*y(10))));
  v2(27,1)=6;
  v2(27,2)=106;
  v2(27,3)=  v2(26,3);
  v2(28,1)=6;
  v2(28,2)=118;
  v2(28,3)=(-(T81*params(5)*(y(10)*y(10)*(T110*T126+y(10)*(T126*T126*getPowerDeriv(T71,1-params(2),2)+T110*T70*getPowerDeriv(y(10),params(1),2))-T110*T126)-(y(10)*T110*T126-T71^(1-params(2)))*(y(10)+y(10)))/(y(10)*y(10)*y(10)*y(10))));
  v2(29,1)=6;
  v2(29,2)=57;
  v2(29,3)=(-(T113*T146));
  v2(30,1)=6;
  v2(30,2)=101;
  v2(30,3)=  v2(29,3);
  v2(31,1)=6;
  v2(31,2)=58;
  v2(31,3)=(-(T132*T146));
  v2(32,1)=6;
  v2(32,2)=113;
  v2(32,3)=  v2(31,3);
  v2(33,1)=6;
  v2(33,2)=53;
  v2(33,3)=(-(T74*T75*(T144*(-((-y(11))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+(-y(11))/(y(5)*y(5))*T312)));
  v2(34,1)=6;
  v2(34,2)=129;
  v2(34,3)=(-(T113*T75*T144*T153));
  v2(35,1)=6;
  v2(35,2)=107;
  v2(35,3)=  v2(34,3);
  v2(36,1)=6;
  v2(36,2)=130;
  v2(36,3)=(-(T132*T75*T144*T153));
  v2(37,1)=6;
  v2(37,2)=119;
  v2(37,3)=  v2(36,3);
  v2(38,1)=6;
  v2(38,2)=125;
  v2(38,3)=(-(T74*T75*(T153*T312+T144*(-1)/(y(5)*y(5)))));
  v2(39,1)=6;
  v2(39,2)=59;
  v2(39,3)=  v2(38,3);
  v2(40,1)=6;
  v2(40,2)=131;
  v2(40,3)=(-(T74*T75*T153*T153*T311));
  v2(41,1)=6;
  v2(41,2)=81;
  v2(41,3)=(-(T113*T164));
  v2(42,1)=6;
  v2(42,2)=103;
  v2(42,3)=  v2(41,3);
  v2(43,1)=6;
  v2(43,2)=82;
  v2(43,3)=(-(T132*T164));
  v2(44,1)=6;
  v2(44,2)=115;
  v2(44,3)=  v2(43,3);
  v2(45,1)=6;
  v2(45,2)=77;
  v2(45,3)=(-(T74*(-y(11))/(y(5)*y(5))*T144*T163));
  v2(46,1)=6;
  v2(46,2)=55;
  v2(46,3)=  v2(45,3);
  v2(47,1)=6;
  v2(47,2)=83;
  v2(47,3)=(-(T74*T144*T153*T163));
  v2(48,1)=6;
  v2(48,2)=127;
  v2(48,3)=  v2(47,3);
  v2(49,1)=6;
  v2(49,2)=79;
  v2(49,3)=(-(T74*T78*params(3)*getPowerDeriv(y(7),params(4),2)));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),6,144);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1728);
end
end
