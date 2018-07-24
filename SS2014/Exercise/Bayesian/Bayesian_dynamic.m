function [residual, g1, g2, g3] = Bayesian_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(7, 1);
f__ = (params(3)*y(1)^params(4)+(1-params(3))*y(3)^params(4))^(1/params(4));
fl__ = 1/params(4)*(params(3)*y(1)^params(4)+(1-params(3))*y(3)^params(4))^(1/params(4)-1)*params(4)*(1-params(3))*y(3)^(params(4)-1);
fk1__ = 1/params(4)*(params(3)*y(5)^params(4)+(1-params(3))*y(10)^params(4))^(1/params(4)-1)*params(3)*params(4)*y(5)^(params(4)-1);
uc__ = (y(4)^params(1)*(1-y(3))^(1-params(1)))^(-params(2))*(1-y(3))^(1-params(1))*params(1)*y(4)^(params(1)-1);
uc1__ = (y(11)^params(1)*(1-y(10))^(1-params(1)))^(-params(2))*(1-y(10))^(1-params(1))*params(1)*y(11)^(params(1)-1);
ul__ = (y(4)^params(1)*(1-y(3))^(1-params(1)))^(-params(2))*(-(y(4)^params(1)*(1-params(1))*(1-y(3))^(-params(1))));
T17 = params(3)*y(1)^params(4)+(1-params(3))*y(3)^params(4);
T18 = 1/params(4);
T26 = params(4)*(1-params(3))*y(3)^(params(4)-1);
T38 = params(3)*y(5)^params(4)+(1-params(3))*y(10)^params(4);
T42 = params(3)*params(4)*y(5)^(params(4)-1);
T46 = y(4)^params(1);
T49 = (1-y(3))^(1-params(1));
T50 = T46*T49;
T53 = T50^(-params(2));
T56 = params(1)*y(4)^(params(1)-1);
T57 = T49*T56;
T62 = (1-y(10))^(1-params(1));
T63 = y(11)^params(1)*T62;
T64 = T63^(-params(2));
T66 = params(1)*y(11)^(params(1)-1);
T67 = T62*T66;
T71 = (1-y(3))^(-params(1));
T73 = (-(T46*(1-params(1))*T71));
T122 = (-(getPowerDeriv(1-y(3),1-params(1),1)));
T123 = T46*T122;
T124 = getPowerDeriv(T50,(-params(2)),1);
T125 = T123*T124;
T126 = T56*T122;
T129 = T57*T125+T53*T126;
T134 = (-(T46*(1-params(1))*(-(getPowerDeriv(1-y(3),(-params(1)),1)))));
T138 = (-(T73*T125+T53*T134));
T145 = (1-params(3))*getPowerDeriv(y(3),params(4),1);
T146 = getPowerDeriv(T17,T18-1,1);
T148 = T18*T145*T146;
T150 = params(4)*(1-params(3))*getPowerDeriv(y(3),params(4)-1,1);
T157 = getPowerDeriv(T17,T18,1);
T162 = (-(getPowerDeriv(1-y(10),1-params(1),1)));
T163 = y(11)^params(1)*T162;
T164 = getPowerDeriv(T63,(-params(2)),1);
T165 = T163*T164;
T166 = T66*T162;
T169 = T67*T165+T64*T166;
T171 = (1-params(3))*getPowerDeriv(y(10),params(4),1);
T172 = getPowerDeriv(T38,T18-1,1);
T176 = y(12)*T42*T18*T171*T172;
T183 = T49*getPowerDeriv(y(4),params(1),1);
T184 = T124*T183;
T187 = T49*params(1)*getPowerDeriv(y(4),params(1)-1,1);
T194 = (-(T71*(1-params(1))*getPowerDeriv(y(4),params(1),1)));
T198 = (-(T73*T184+T53*T194));
T205 = T62*getPowerDeriv(y(11),params(1),1);
T206 = T164*T205;
T209 = T62*params(1)*getPowerDeriv(y(11),params(1)-1,1);
T212 = T67*T206+T64*T209;
T217 = params(3)*getPowerDeriv(y(1),params(4),1);
T230 = params(3)*getPowerDeriv(y(5),params(4),1);
T234 = params(3)*params(4)*getPowerDeriv(y(5),params(4)-1,1);
T238 = y(12)*(T42*T18*T172*T230+T18*T38^(T18-1)*T234);
T256 = T124*T46*getPowerDeriv(1-y(3),1-params(1),2)+T123*T123*getPowerDeriv(T50,(-params(2)),2);
T263 = T125*T126+T57*T256+T125*T126+T53*T56*getPowerDeriv(1-y(3),1-params(1),2);
T300 = T183*T123*getPowerDeriv(T50,(-params(2)),2)+T124*T122*getPowerDeriv(y(4),params(1),1);
T308 = T126*T184+T57*T300+T125*T187+T53*T122*params(1)*getPowerDeriv(y(4),params(1)-1,1);
T315 = T183*T183*getPowerDeriv(T50,(-params(2)),2)+T124*T49*getPowerDeriv(y(4),params(1),2);
T324 = T184*T187+T57*T315+T184*T187+T53*T49*params(1)*getPowerDeriv(y(4),params(1)-1,2);
T397 = T125*T134;
lhs =y(7);
rhs =params(8)*exp(y(8));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =params(7)*y(2)+x(it_, 1);
residual(2)= lhs-rhs;
lhs =0;
rhs =uc__-params(5)*uc1__*(1+y(12)*fk1__-params(6));
residual(3)= lhs-rhs;
lhs =0;
rhs =(-ul__)/uc__-y(7)*fl__;
residual(4)= lhs-rhs;
lhs =0;
rhs =y(5)+y(4)-y(7)*f__-y(1)*(1-params(6));
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(4)+y(9);
residual(6)= lhs-rhs;
lhs =y(5);
rhs =y(1)*(1-params(6))+y(9);
residual(7)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(7, 13);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,8)=(-(params(8)*exp(y(8))));
  g1(2,2)=(-params(7));
  g1(2,8)=1;
  g1(2,13)=(-1);
  g1(3,3)=(-T129);
  g1(3,10)=params(5)*((1+y(12)*fk1__-params(6))*T169+uc1__*T176);
  g1(3,4)=(-(T57*T184+T53*T187));
  g1(3,11)=params(5)*(1+y(12)*fk1__-params(6))*T212;
  g1(3,5)=params(5)*uc1__*T238;
  g1(3,12)=params(5)*uc1__*fk1__;
  g1(4,3)=(-((uc__*T138-(-ul__)*T129)/(uc__*uc__)-y(7)*(T26*T148+T18*T17^(T18-1)*T150)));
  g1(4,4)=(-((uc__*T198-(-ul__)*(T57*T184+T53*T187))/(uc__*uc__)));
  g1(4,1)=y(7)*T26*T18*T146*T217;
  g1(4,7)=fl__;
  g1(5,3)=y(7)*T145*T157;
  g1(5,4)=(-1);
  g1(5,1)=(-((-(y(7)*T157*T217))-(1-params(6))));
  g1(5,5)=(-1);
  g1(5,7)=f__;
  g1(6,4)=(-1);
  g1(6,6)=1;
  g1(6,9)=(-1);
  g1(7,1)=(-(1-params(6)));
  g1(7,5)=1;
  g1(7,9)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(39,3);
  v2(1,1)=1;
  v2(1,2)=99;
  v2(1,3)=(-(params(8)*exp(y(8))));
  v2(2,1)=3;
  v2(2,2)=29;
  v2(2,3)=(-T263);
  v2(3,1)=3;
  v2(3,2)=127;
  v2(3,3)=params(5)*(T169*T176+(1+y(12)*fk1__-params(6))*(T165*T166+T67*(T164*y(11)^params(1)*getPowerDeriv(1-y(10),1-params(1),2)+T163*T163*getPowerDeriv(T63,(-params(2)),2))+T165*T166+T64*T66*getPowerDeriv(1-y(10),1-params(1),2))+T169*T176+uc1__*y(12)*T42*T18*(T172*(1-params(3))*getPowerDeriv(y(10),params(4),2)+T171*T171*getPowerDeriv(T38,T18-1,2)));
  v2(4,1)=3;
  v2(4,2)=42;
  v2(4,3)=(-T308);
  v2(5,1)=3;
  v2(5,2)=30;
  v2(5,3)=  v2(4,3);
  v2(6,1)=3;
  v2(6,2)=43;
  v2(6,3)=(-T324);
  v2(7,1)=3;
  v2(7,2)=140;
  v2(7,3)=params(5)*(T176*T212+(1+y(12)*fk1__-params(6))*(T166*T206+T67*(T205*T163*getPowerDeriv(T63,(-params(2)),2)+T164*T162*getPowerDeriv(y(11),params(1),1))+T165*T209+T64*T162*params(1)*getPowerDeriv(y(11),params(1)-1,1)));
  v2(8,1)=3;
  v2(8,2)=128;
  v2(8,3)=  v2(7,3);
  v2(9,1)=3;
  v2(9,2)=141;
  v2(9,3)=params(5)*(1+y(12)*fk1__-params(6))*(T206*T209+T67*(T205*T205*getPowerDeriv(T63,(-params(2)),2)+T164*T62*getPowerDeriv(y(11),params(1),2))+T206*T209+T64*T62*params(1)*getPowerDeriv(y(11),params(1)-1,2));
  v2(10,1)=3;
  v2(10,2)=62;
  v2(10,3)=params(5)*(T169*T238+uc1__*y(12)*(T42*T18*T230*T171*getPowerDeriv(T38,T18-1,2)+T18*T171*T172*T234));
  v2(11,1)=3;
  v2(11,2)=122;
  v2(11,3)=  v2(10,3);
  v2(12,1)=3;
  v2(12,2)=63;
  v2(12,3)=params(5)*T212*T238;
  v2(13,1)=3;
  v2(13,2)=135;
  v2(13,3)=  v2(12,3);
  v2(14,1)=3;
  v2(14,2)=57;
  v2(14,3)=params(5)*uc1__*y(12)*(T18*T172*T230*T234+T42*T18*(T230*T230*getPowerDeriv(T38,T18-1,2)+T172*params(3)*getPowerDeriv(y(5),params(4),2))+T18*T172*T230*T234+T18*T38^(T18-1)*params(3)*params(4)*getPowerDeriv(y(5),params(4)-1,2));
  v2(15,1)=3;
  v2(15,2)=153;
  v2(15,3)=params(5)*(fk1__*T169+uc1__*T42*T18*T171*T172);
  v2(16,1)=3;
  v2(16,2)=129;
  v2(16,3)=  v2(15,3);
  v2(17,1)=3;
  v2(17,2)=154;
  v2(17,3)=params(5)*fk1__*T212;
  v2(18,1)=3;
  v2(18,2)=142;
  v2(18,3)=  v2(17,3);
  v2(19,1)=3;
  v2(19,2)=148;
  v2(19,3)=params(5)*uc1__*(T42*T18*T172*T230+T18*T38^(T18-1)*T234);
  v2(20,1)=3;
  v2(20,2)=64;
  v2(20,3)=  v2(19,3);
  v2(21,1)=4;
  v2(21,2)=29;
  v2(21,3)=(-((uc__*uc__*(T129*T138+uc__*(-(T397+T73*T256+T397+T53*(-(T46*(1-params(1))*getPowerDeriv(1-y(3),(-params(1)),2)))))-(T129*T138+(-ul__)*T263))-(uc__*T138-(-ul__)*T129)*(uc__*T129+uc__*T129))/(uc__*uc__*uc__*uc__)-y(7)*(T148*T150+T26*T18*(T146*(1-params(3))*getPowerDeriv(y(3),params(4),2)+T145*T145*getPowerDeriv(T17,T18-1,2))+T148*T150+T18*T17^(T18-1)*params(4)*(1-params(3))*getPowerDeriv(y(3),params(4)-1,2))));
  v2(22,1)=4;
  v2(22,2)=42;
  v2(22,3)=(-((uc__*uc__*(T129*T198+uc__*(-(T134*T184+T73*T300+T125*T194+T53*(-((-(getPowerDeriv(1-y(3),(-params(1)),1)))*(1-params(1))*getPowerDeriv(y(4),params(1),1)))))-(T138*(T57*T184+T53*T187)+(-ul__)*T308))-(uc__*T198-(-ul__)*(T57*T184+T53*T187))*(uc__*T129+uc__*T129))/(uc__*uc__*uc__*uc__)));
  v2(23,1)=4;
  v2(23,2)=30;
  v2(23,3)=  v2(22,3);
  v2(24,1)=4;
  v2(24,2)=43;
  v2(24,3)=(-((uc__*uc__*((T57*T184+T53*T187)*T198+uc__*(-(T184*T194+T73*T315+T184*T194+T53*(-(T71*(1-params(1))*getPowerDeriv(y(4),params(1),2)))))-((T57*T184+T53*T187)*T198+(-ul__)*T324))-(uc__*T198-(-ul__)*(T57*T184+T53*T187))*(uc__*(T57*T184+T53*T187)+uc__*(T57*T184+T53*T187)))/(uc__*uc__*uc__*uc__)));
  v2(25,1)=4;
  v2(25,2)=3;
  v2(25,3)=y(7)*(T150*T18*T146*T217+T26*T18*T217*T145*getPowerDeriv(T17,T18-1,2));
  v2(26,1)=4;
  v2(26,2)=27;
  v2(26,3)=  v2(25,3);
  v2(27,1)=4;
  v2(27,2)=1;
  v2(27,3)=y(7)*T26*T18*(T217*T217*getPowerDeriv(T17,T18-1,2)+T146*params(3)*getPowerDeriv(y(1),params(4),2));
  v2(28,1)=4;
  v2(28,2)=81;
  v2(28,3)=T26*T148+T18*T17^(T18-1)*T150;
  v2(29,1)=4;
  v2(29,2)=33;
  v2(29,3)=  v2(28,3);
  v2(30,1)=4;
  v2(30,2)=79;
  v2(30,3)=T26*T18*T146*T217;
  v2(31,1)=4;
  v2(31,2)=7;
  v2(31,3)=  v2(30,3);
  v2(32,1)=5;
  v2(32,2)=29;
  v2(32,3)=y(7)*(T157*(1-params(3))*getPowerDeriv(y(3),params(4),2)+T145*T145*getPowerDeriv(T17,T18,2));
  v2(33,1)=5;
  v2(33,2)=3;
  v2(33,3)=y(7)*T217*T145*getPowerDeriv(T17,T18,2);
  v2(34,1)=5;
  v2(34,2)=27;
  v2(34,3)=  v2(33,3);
  v2(35,1)=5;
  v2(35,2)=1;
  v2(35,3)=y(7)*(T217*T217*getPowerDeriv(T17,T18,2)+T157*params(3)*getPowerDeriv(y(1),params(4),2));
  v2(36,1)=5;
  v2(36,2)=81;
  v2(36,3)=T145*T157;
  v2(37,1)=5;
  v2(37,2)=33;
  v2(37,3)=  v2(36,3);
  v2(38,1)=5;
  v2(38,2)=79;
  v2(38,3)=T157*T217;
  v2(39,1)=5;
  v2(39,2)=7;
  v2(39,3)=  v2(38,3);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),7,169);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,2197);
end
end
