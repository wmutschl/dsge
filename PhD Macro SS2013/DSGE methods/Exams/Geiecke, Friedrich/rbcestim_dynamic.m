function [residual, g1, g2, g3] = rbcestim_dynamic(y, x, params, steady_state, it_)
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
T52 = (1-params(3))*y(7)^params(4);
T55 = (y(6)/y(3))^(1-params(4));
T60 = y(4)^params(1)*(1-y(3))^(1-params(1));
T71 = y(10)^params(1)*(1-y(9))^(1-params(1));
T74 = params(5)*T71^(1-params(2))/y(10);
T75 = params(3)*y(7)^params(4);
T78 = (y(11)/y(5))^(1-params(4));
T81 = 1+T75*T78-params(6);
T86 = getPowerDeriv(T32,1/params(4),1);
T97 = getPowerDeriv(y(6)/y(3),1-params(4),1);
T144 = getPowerDeriv(y(11)/y(5),1-params(4),1);
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
lhs =(1-params(1))/params(1)*y(4)/(1-y(3));
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
  g1(3,3)=(-(y(7)*(1-params(3))*getPowerDeriv(y(3),params(4),1)*T86));
  g1(3,1)=(-(y(7)*T86*params(3)*getPowerDeriv(y(1),params(4),1)));
  g1(3,6)=1;
  g1(3,7)=(-T34);
  g1(4,4)=(-1);
  g1(4,1)=1-params(6);
  g1(4,5)=(-1);
  g1(4,6)=1;
  g1(5,3)=(1-params(1))/params(1)*y(4)/((1-y(3))*(1-y(3)))-T52*(-y(6))/(y(3)*y(3))*T97;
  g1(5,4)=(1-params(1))/params(1)*1/(1-y(3));
  g1(5,6)=(-(T52*T97*1/y(3)));
  g1(5,7)=(-(T55*(1-params(3))*getPowerDeriv(y(7),params(4),1)));
  g1(6,3)=y(4)^params(1)*(-(getPowerDeriv(1-y(3),1-params(1),1)))*getPowerDeriv(T60,1-params(2),1)/y(4);
  g1(6,9)=(-(T81*params(5)*y(10)^params(1)*(-(getPowerDeriv(1-y(9),1-params(1),1)))*getPowerDeriv(T71,1-params(2),1)/y(10)));
  g1(6,4)=(y(4)*getPowerDeriv(T60,1-params(2),1)*(1-y(3))^(1-params(1))*getPowerDeriv(y(4),params(1),1)-T60^(1-params(2)))/(y(4)*y(4));
  g1(6,10)=(-(T81*params(5)*(y(10)*getPowerDeriv(T71,1-params(2),1)*(1-y(9))^(1-params(1))*getPowerDeriv(y(10),params(1),1)-T71^(1-params(2)))/(y(10)*y(10))));
  g1(6,5)=(-(T74*T75*(-y(11))/(y(5)*y(5))*T144));
  g1(6,11)=(-(T74*T75*T144*1/y(5)));
  g1(6,7)=(-(T74*T78*params(3)*getPowerDeriv(y(7),params(4),1)));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,144);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1728);
end
end
