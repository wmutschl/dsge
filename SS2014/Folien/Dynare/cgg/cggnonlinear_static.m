function [residual, g1, g2] = cggnonlinear_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                    columns: equations in order of declaration
%                                                    rows: variables in declaration order
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: equations in order of declaration
%                                                       rows: variables in declaration order
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 13, 1);

%
% Model equations
%

T17 = (1-params(1))*params(2)/(params(2)-1)*exp(y(2));
T21 = T17*y(4)^params(3);
T23 = T21*y(5);
T26 = T23/exp(y(3));
T45 = (1-params(5)*y(6)^(params(2)-1))/(1-params(5));
T48 = T45^(1/(1-params(2)));
T57 = (1-params(5))*T45^(params(2)/(params(2)-1))+params(5)*y(6)^params(2)/y(8);
T83 = y(11)^(1-params(10));
T84 = y(12)^params(10)*T83;
T87 = y(6)^((1-params(10))*params(11));
T93 = exp(y(13))^((1-params(10))*params(12));
T120 = exp(y(2)/(1+params(3)))*1/(1+params(3));
T133 = y(5)*T17*getPowerDeriv(y(4),params(3),1);
T135 = (-(T133/exp(y(3))));
T157 = (-(params(5)*getPowerDeriv(y(6),params(2)-1,1)))/(1-params(5));
T158 = getPowerDeriv(T45,1/(1-params(2)),1);
T162 = getPowerDeriv(T45,params(2)/(params(2)-1),1);
T167 = (1-params(5))*T157*T162+params(5)*getPowerDeriv(y(6),params(2),1)/y(8);
T168 = getPowerDeriv(T57,(-1),1);
T175 = getPowerDeriv(y(6),(1-params(10))*params(11),1);
T183 = (-(params(5)*y(6)^params(2)))/(y(8)*y(8));
T193 = y(12)^params(10)*getPowerDeriv(y(11),1-params(10),1);
T200 = T83*getPowerDeriv(y(12),params(10),1);
T205 = exp(y(13))*getPowerDeriv(exp(y(13)),(1-params(10))*params(12),1);
T242 = (-(params(5)*getPowerDeriv(y(6),params(2)-1,2)))/(1-params(5));
lhs =y(1);
rhs =T26+y(1)*params(4)*params(5)*y(6)^params(2);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =1+y(7)*params(4)*params(5)*y(6)^(params(2)-1);
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(7)*T48;
residual(3)= lhs-rhs;
lhs =y(8);
rhs =T57^(-1);
residual(4)= lhs-rhs;
lhs =1/y(5);
rhs =params(4)*y(12)/(y(5)*y(6));
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(4)*exp(y(3))*y(8);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =exp(y(3))*exp(y(2)/(1+params(3)));
residual(7)= lhs-rhs;
lhs =y(11);
rhs =y(5)*1/params(4)/y(5);
residual(8)= lhs-rhs;
lhs =y(12);
rhs =T84*T87*T93;
residual(9)= lhs-rhs;
lhs =y(13);
rhs =log(y(5))-log(y(10));
residual(10)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(7)+params(8)*x(1);
residual(11)= lhs-rhs;
lhs =y(3);
rhs =y(9)+y(9);
residual(12)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(6)+params(9)*x(2);
residual(13)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(13, 13);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-params(4)*params(5)*y(6)^params(2);
  g1(1,2)=(-T26);
  g1(1,3)=(-((-(T23*exp(y(3))))/(exp(y(3))*exp(y(3)))));
  g1(1,4)=T135;
  g1(1,5)=(-(T21/exp(y(3))));
  g1(1,6)=(-(y(1)*params(4)*params(5)*getPowerDeriv(y(6),params(2),1)));
  g1(2,6)=(-(y(7)*params(4)*params(5)*getPowerDeriv(y(6),params(2)-1,1)));
  g1(2,7)=1-params(4)*params(5)*y(6)^(params(2)-1);
  g1(3,1)=1;
  g1(3,6)=(-(y(7)*T157*T158));
  g1(3,7)=(-T48);
  g1(4,6)=(-(T167*T168));
  g1(4,8)=1-T168*T183;
  g1(5,5)=(-1)/(y(5)*y(5))-(-(y(6)*params(4)*y(12)))/(y(5)*y(6)*y(5)*y(6));
  g1(5,6)=(-((-(y(5)*params(4)*y(12)))/(y(5)*y(6)*y(5)*y(6))));
  g1(5,12)=(-(params(4)/(y(5)*y(6))));
  g1(6,3)=(-(y(4)*exp(y(3))*y(8)));
  g1(6,4)=(-(exp(y(3))*y(8)));
  g1(6,5)=1;
  g1(6,8)=(-(y(4)*exp(y(3))));
  g1(7,2)=(-(exp(y(3))*T120));
  g1(7,3)=(-(exp(y(3))*exp(y(2)/(1+params(3)))));
  g1(7,10)=1;
  g1(8,11)=1;
  g1(9,6)=(-(T93*T84*T175));
  g1(9,11)=(-(T93*T87*T193));
  g1(9,12)=1-T93*T87*T200;
  g1(9,13)=(-(T84*T87*T205));
  g1(10,5)=(-(1/y(5)));
  g1(10,10)=1/y(10);
  g1(10,13)=1;
  g1(11,9)=1-params(7);
  g1(12,3)=1;
  g1(12,9)=(-2);
  g1(13,2)=1-params(6);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(65,3);
  v2(1,1)=1;
  v2(1,2)=15;
  v2(1,3)=(-T26);
  v2(2,1)=1;
  v2(2,2)=28;
  v2(2,3)=(-((-(T23*exp(y(3))))/(exp(y(3))*exp(y(3)))));
  v2(3,1)=1;
  v2(3,2)=16;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=29;
  v2(4,3)=(-(((-(T23*exp(y(3))))*exp(y(3))*exp(y(3))-(-(T23*exp(y(3))))*(exp(y(3))*exp(y(3))+exp(y(3))*exp(y(3))))/(exp(y(3))*exp(y(3))*exp(y(3))*exp(y(3)))));
  v2(5,1)=1;
  v2(5,2)=41;
  v2(5,3)=T135;
  v2(6,1)=1;
  v2(6,2)=17;
  v2(6,3)=  v2(5,3);
  v2(7,1)=1;
  v2(7,2)=42;
  v2(7,3)=(-((-(exp(y(3))*T133))/(exp(y(3))*exp(y(3)))));
  v2(8,1)=1;
  v2(8,2)=30;
  v2(8,3)=  v2(7,3);
  v2(9,1)=1;
  v2(9,2)=43;
  v2(9,3)=(-(y(5)*T17*getPowerDeriv(y(4),params(3),2)/exp(y(3))));
  v2(10,1)=1;
  v2(10,2)=54;
  v2(10,3)=(-(T21/exp(y(3))));
  v2(11,1)=1;
  v2(11,2)=18;
  v2(11,3)=  v2(10,3);
  v2(12,1)=1;
  v2(12,2)=55;
  v2(12,3)=(-((-(T21*exp(y(3))))/(exp(y(3))*exp(y(3)))));
  v2(13,1)=1;
  v2(13,2)=31;
  v2(13,3)=  v2(12,3);
  v2(14,1)=1;
  v2(14,2)=56;
  v2(14,3)=(-(T17*getPowerDeriv(y(4),params(3),1)/exp(y(3))));
  v2(15,1)=1;
  v2(15,2)=44;
  v2(15,3)=  v2(14,3);
  v2(16,1)=1;
  v2(16,2)=66;
  v2(16,3)=(-(params(4)*params(5)*getPowerDeriv(y(6),params(2),1)));
  v2(17,1)=1;
  v2(17,2)=6;
  v2(17,3)=  v2(16,3);
  v2(18,1)=1;
  v2(18,2)=71;
  v2(18,3)=(-(y(1)*params(4)*params(5)*getPowerDeriv(y(6),params(2),2)));
  v2(19,1)=2;
  v2(19,2)=71;
  v2(19,3)=(-(y(7)*params(4)*params(5)*getPowerDeriv(y(6),params(2)-1,2)));
  v2(20,1)=2;
  v2(20,2)=84;
  v2(20,3)=(-(params(4)*params(5)*getPowerDeriv(y(6),params(2)-1,1)));
  v2(21,1)=2;
  v2(21,2)=72;
  v2(21,3)=  v2(20,3);
  v2(22,1)=3;
  v2(22,2)=71;
  v2(22,3)=(-(y(7)*(T158*T242+T157*T157*getPowerDeriv(T45,1/(1-params(2)),2))));
  v2(23,1)=3;
  v2(23,2)=84;
  v2(23,3)=(-(T157*T158));
  v2(24,1)=3;
  v2(24,2)=72;
  v2(24,3)=  v2(23,3);
  v2(25,1)=4;
  v2(25,2)=71;
  v2(25,3)=(-(T168*((1-params(5))*(T162*T242+T157*T157*getPowerDeriv(T45,params(2)/(params(2)-1),2))+params(5)*getPowerDeriv(y(6),params(2),2)/y(8))+T167*T167*getPowerDeriv(T57,(-1),2)));
  v2(26,1)=4;
  v2(26,2)=97;
  v2(26,3)=(-(T183*T167*getPowerDeriv(T57,(-1),2)+T168*(-(params(5)*getPowerDeriv(y(6),params(2),1)))/(y(8)*y(8))));
  v2(27,1)=4;
  v2(27,2)=73;
  v2(27,3)=  v2(26,3);
  v2(28,1)=4;
  v2(28,2)=99;
  v2(28,3)=(-(T183*T183*getPowerDeriv(T57,(-1),2)+T168*(-((-(params(5)*y(6)^params(2)))*(y(8)+y(8))))/(y(8)*y(8)*y(8)*y(8))));
  v2(29,1)=5;
  v2(29,2)=57;
  v2(29,3)=(y(5)+y(5))/(y(5)*y(5)*y(5)*y(5))-(-((-(y(6)*params(4)*y(12)))*(y(6)*y(5)*y(6)+y(6)*y(5)*y(6))))/(y(5)*y(6)*y(5)*y(6)*y(5)*y(6)*y(5)*y(6));
  v2(30,1)=5;
  v2(30,2)=70;
  v2(30,3)=(-((y(5)*y(6)*y(5)*y(6)*(-(params(4)*y(12)))-(-(y(5)*params(4)*y(12)))*(y(6)*y(5)*y(6)+y(6)*y(5)*y(6)))/(y(5)*y(6)*y(5)*y(6)*y(5)*y(6)*y(5)*y(6))));
  v2(31,1)=5;
  v2(31,2)=58;
  v2(31,3)=  v2(30,3);
  v2(32,1)=5;
  v2(32,2)=71;
  v2(32,3)=(-((-((-(y(5)*params(4)*y(12)))*(y(5)*y(5)*y(6)+y(5)*y(5)*y(6))))/(y(5)*y(6)*y(5)*y(6)*y(5)*y(6)*y(5)*y(6))));
  v2(33,1)=5;
  v2(33,2)=148;
  v2(33,3)=(-((-(params(4)*y(6)))/(y(5)*y(6)*y(5)*y(6))));
  v2(34,1)=5;
  v2(34,2)=64;
  v2(34,3)=  v2(33,3);
  v2(35,1)=5;
  v2(35,2)=149;
  v2(35,3)=(-((-(y(5)*params(4)))/(y(5)*y(6)*y(5)*y(6))));
  v2(36,1)=5;
  v2(36,2)=77;
  v2(36,3)=  v2(35,3);
  v2(37,1)=6;
  v2(37,2)=29;
  v2(37,3)=(-(y(4)*exp(y(3))*y(8)));
  v2(38,1)=6;
  v2(38,2)=42;
  v2(38,3)=(-(exp(y(3))*y(8)));
  v2(39,1)=6;
  v2(39,2)=30;
  v2(39,3)=  v2(38,3);
  v2(40,1)=6;
  v2(40,2)=94;
  v2(40,3)=(-(y(4)*exp(y(3))));
  v2(41,1)=6;
  v2(41,2)=34;
  v2(41,3)=  v2(40,3);
  v2(42,1)=6;
  v2(42,2)=95;
  v2(42,3)=(-exp(y(3)));
  v2(43,1)=6;
  v2(43,2)=47;
  v2(43,3)=  v2(42,3);
  v2(44,1)=7;
  v2(44,2)=15;
  v2(44,3)=(-(exp(y(3))*1/(1+params(3))*T120));
  v2(45,1)=7;
  v2(45,2)=28;
  v2(45,3)=(-(exp(y(3))*T120));
  v2(46,1)=7;
  v2(46,2)=16;
  v2(46,3)=  v2(45,3);
  v2(47,1)=7;
  v2(47,2)=29;
  v2(47,3)=(-(exp(y(3))*exp(y(2)/(1+params(3)))));
  v2(48,1)=9;
  v2(48,2)=71;
  v2(48,3)=(-(T93*T84*getPowerDeriv(y(6),(1-params(10))*params(11),2)));
  v2(49,1)=9;
  v2(49,2)=136;
  v2(49,3)=(-(T93*T175*T193));
  v2(50,1)=9;
  v2(50,2)=76;
  v2(50,3)=  v2(49,3);
  v2(51,1)=9;
  v2(51,2)=141;
  v2(51,3)=(-(T93*T87*y(12)^params(10)*getPowerDeriv(y(11),1-params(10),2)));
  v2(52,1)=9;
  v2(52,2)=149;
  v2(52,3)=(-(T93*T175*T200));
  v2(53,1)=9;
  v2(53,2)=77;
  v2(53,3)=  v2(52,3);
  v2(54,1)=9;
  v2(54,2)=154;
  v2(54,3)=(-(T93*T87*getPowerDeriv(y(11),1-params(10),1)*getPowerDeriv(y(12),params(10),1)));
  v2(55,1)=9;
  v2(55,2)=142;
  v2(55,3)=  v2(54,3);
  v2(56,1)=9;
  v2(56,2)=155;
  v2(56,3)=(-(T93*T87*T83*getPowerDeriv(y(12),params(10),2)));
  v2(57,1)=9;
  v2(57,2)=162;
  v2(57,3)=(-(T84*T175*T205));
  v2(58,1)=9;
  v2(58,2)=78;
  v2(58,3)=  v2(57,3);
  v2(59,1)=9;
  v2(59,2)=167;
  v2(59,3)=(-(T87*T193*T205));
  v2(60,1)=9;
  v2(60,2)=143;
  v2(60,3)=  v2(59,3);
  v2(61,1)=9;
  v2(61,2)=168;
  v2(61,3)=(-(T87*T200*T205));
  v2(62,1)=9;
  v2(62,2)=156;
  v2(62,3)=  v2(61,3);
  v2(63,1)=9;
  v2(63,2)=169;
  v2(63,3)=(-(T84*T87*(T205+exp(y(13))*exp(y(13))*getPowerDeriv(exp(y(13)),(1-params(10))*params(12),2))));
  v2(64,1)=10;
  v2(64,2)=57;
  v2(64,3)=(-((-1)/(y(5)*y(5))));
  v2(65,1)=10;
  v2(65,2)=127;
  v2(65,3)=(-1)/(y(10)*y(10));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),13,169);
end
end
