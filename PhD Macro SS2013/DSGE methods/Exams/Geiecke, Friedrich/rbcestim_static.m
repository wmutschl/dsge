function [residual, g1, g2] = rbcestim_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 6, 1);

%
% Model equations
%

T31 = params(3)*y(3)^params(4)+(1-params(3))*y(1)^params(4);
T33 = T31^(1/params(4));
T50 = (1-params(3))*y(5)^params(4);
T53 = (y(4)/y(1))^(1-params(4));
T58 = y(2)^params(1)*(1-y(1))^(1-params(1));
T62 = T58^(1-params(2))/y(2);
T65 = params(3)*y(5)^params(4);
T67 = (y(4)/y(3))^(1-params(4));
T70 = 1+T65*T67-params(6);
T75 = getPowerDeriv(T31,1/params(4),1);
T86 = getPowerDeriv(y(4)/y(1),1-params(4),1);
T95 = y(2)^params(1)*(-(getPowerDeriv(1-y(1),1-params(1),1)))*getPowerDeriv(T58,1-params(2),1)/y(2);
T107 = (y(2)*getPowerDeriv(T58,1-params(2),1)*(1-y(1))^(1-params(1))*getPowerDeriv(y(2),params(1),1)-T58^(1-params(2)))/(y(2)*y(2));
T120 = getPowerDeriv(y(4)/y(3),1-params(4),1);
lhs =y(5);
rhs =params(8)*exp(y(6));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+params(9)*x(1);
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(5)*T33;
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(3)+y(2)-y(3)*(1-params(6));
residual(4)= lhs-rhs;
lhs =(1-params(1))/params(1)*y(2)/(1-y(1));
rhs =T50*T53;
residual(5)= lhs-rhs;
lhs =T62;
rhs =T62*params(5)*T70;
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,6)=(-(params(8)*exp(y(6))));
  g1(2,6)=1-params(7);
  g1(3,1)=(-(y(5)*(1-params(3))*getPowerDeriv(y(1),params(4),1)*T75));
  g1(3,3)=(-(y(5)*T75*params(3)*getPowerDeriv(y(3),params(4),1)));
  g1(3,4)=1;
  g1(3,5)=(-T33);
  g1(4,2)=(-1);
  g1(4,3)=(-(1-(1-params(6))));
  g1(4,4)=1;
  g1(5,1)=(1-params(1))/params(1)*y(2)/((1-y(1))*(1-y(1)))-T50*(-y(4))/(y(1)*y(1))*T86;
  g1(5,2)=(1-params(1))/params(1)*1/(1-y(1));
  g1(5,4)=(-(T50*T86*1/y(1)));
  g1(5,5)=(-(T53*(1-params(3))*getPowerDeriv(y(5),params(4),1)));
  g1(6,1)=T95-T70*params(5)*T95;
  g1(6,2)=T107-T70*params(5)*T107;
  g1(6,3)=(-(T62*params(5)*T65*(-y(4))/(y(3)*y(3))*T120));
  g1(6,4)=(-(T62*params(5)*T65*T120*1/y(3)));
  g1(6,5)=(-(T62*params(5)*T67*params(3)*getPowerDeriv(y(5),params(4),1)));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
end
end
