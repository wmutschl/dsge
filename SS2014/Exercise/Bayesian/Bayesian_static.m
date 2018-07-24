function [residual, g1, g2] = Bayesian_static(y, x, params)
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

residual = zeros( 7, 1);

%
% Model equations
%

f__ = (params(3)*y(3)^params(4)+(1-params(3))*y(1)^params(4))^(1/params(4));
fl__ = 1/params(4)*(params(3)*y(3)^params(4)+(1-params(3))*y(1)^params(4))^(1/params(4)-1)*params(4)*(1-params(3))*y(1)^(params(4)-1);
fk1__ = 1/params(4)*(params(3)*y(3)^params(4)+(1-params(3))*y(1)^params(4))^(1/params(4)-1)*params(3)*params(4)*y(3)^(params(4)-1);
uc__ = (y(2)^params(1)*(1-y(1))^(1-params(1)))^(-params(2))*(1-y(1))^(1-params(1))*params(1)*y(2)^(params(1)-1);
uc1__ = (y(2)^params(1)*(1-y(1))^(1-params(1)))^(-params(2))*(1-y(1))^(1-params(1))*params(1)*y(2)^(params(1)-1);
ul__ = (y(2)^params(1)*(1-y(1))^(1-params(1)))^(-params(2))*(-(y(2)^params(1)*(1-params(1))*(1-y(1))^(-params(1))));
T17 = params(3)*y(3)^params(4)+(1-params(3))*y(1)^params(4);
T18 = 1/params(4);
T37 = (1-y(1))^(1-params(1));
T38 = y(2)^params(1)*T37;
T41 = T38^(-params(2));
T45 = T37*params(1)*y(2)^(params(1)-1);
T51 = (-(y(2)^params(1)*(1-params(1))*(1-y(1))^(-params(1))));
T101 = y(2)^params(1)*(-(getPowerDeriv(1-y(1),1-params(1),1)))*getPowerDeriv(T38,(-params(2)),1);
T105 = T45*T101+T41*params(1)*y(2)^(params(1)-1)*(-(getPowerDeriv(1-y(1),1-params(1),1)));
T108 = getPowerDeriv(T17,T18-1,1);
T146 = getPowerDeriv(T38,(-params(2)),1)*T37*getPowerDeriv(y(2),params(1),1);
T152 = T45*T146+T41*T37*params(1)*getPowerDeriv(y(2),params(1)-1,1);
lhs =y(5);
rhs =params(8)*exp(y(6));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+x(1);
residual(2)= lhs-rhs;
lhs =0;
rhs =uc__-params(5)*uc1__*(1+y(5)*fk1__-params(6));
residual(3)= lhs-rhs;
lhs =0;
rhs =(-ul__)/uc__-y(5)*fl__;
residual(4)= lhs-rhs;
lhs =0;
rhs =y(3)+y(2)-y(5)*f__-y(3)*(1-params(6));
residual(5)= lhs-rhs;
lhs =y(4);
rhs =y(2)+y(7);
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(3)*(1-params(6))+y(7);
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,6)=(-(params(8)*exp(y(6))));
  g1(2,6)=1-params(7);
  g1(3,1)=(-(T105-params(5)*((1+y(5)*fk1__-params(6))*T105+uc1__*y(5)*params(3)*params(4)*y(3)^(params(4)-1)*T18*(1-params(3))*getPowerDeriv(y(1),params(4),1)*T108)));
  g1(3,2)=(-(T152-params(5)*(1+y(5)*fk1__-params(6))*T152));
  g1(3,3)=params(5)*uc1__*y(5)*(params(3)*params(4)*y(3)^(params(4)-1)*T18*T108*params(3)*getPowerDeriv(y(3),params(4),1)+T18*T17^(T18-1)*params(3)*params(4)*getPowerDeriv(y(3),params(4)-1,1));
  g1(3,5)=params(5)*uc1__*fk1__;
  g1(4,1)=(-((uc__*(-(T51*T101+T41*(-(y(2)^params(1)*(1-params(1))*(-(getPowerDeriv(1-y(1),(-params(1)),1)))))))-(-ul__)*T105)/(uc__*uc__)-y(5)*(params(4)*(1-params(3))*y(1)^(params(4)-1)*T18*(1-params(3))*getPowerDeriv(y(1),params(4),1)*T108+T18*T17^(T18-1)*params(4)*(1-params(3))*getPowerDeriv(y(1),params(4)-1,1))));
  g1(4,2)=(-((uc__*(-(T51*T146+T41*(-((1-y(1))^(-params(1))*(1-params(1))*getPowerDeriv(y(2),params(1),1)))))-(-ul__)*T152)/(uc__*uc__)));
  g1(4,3)=y(5)*params(4)*(1-params(3))*y(1)^(params(4)-1)*T18*T108*params(3)*getPowerDeriv(y(3),params(4),1);
  g1(4,5)=fl__;
  g1(5,1)=y(5)*(1-params(3))*getPowerDeriv(y(1),params(4),1)*getPowerDeriv(T17,T18,1);
  g1(5,2)=(-1);
  g1(5,3)=(-(1-y(5)*getPowerDeriv(T17,T18,1)*params(3)*getPowerDeriv(y(3),params(4),1)-(1-params(6))));
  g1(5,5)=f__;
  g1(6,2)=(-1);
  g1(6,4)=1;
  g1(6,7)=(-1);
  g1(7,3)=1-(1-params(6));
  g1(7,7)=(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,49);
end
end
