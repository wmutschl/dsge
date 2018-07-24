function [residual, g1, g2] = V10_static(y, x, params)
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
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 23, 1);

%
% Model equations
%

T48 = y(9)*y(13)^params(3)*y(4)^params(1);
T50 = y(2)^(1-params(1));
T213 = ((y(8))-y(8))/((y(8))*(y(8)))/(y(8)/(y(8)));
T222 = ((y(9))-y(9))/((y(9))*(y(9)))/(y(9)/(y(9)));
lhs =(1-y(8))*y(5);
rhs =params(5)*y(1)/(1-y(2));
residual(1)= lhs-rhs;
lhs =y(14);
rhs =params(2)*y(14)*(1-params(4)+(1-y(8))*y(6));
residual(2)= lhs-rhs;
lhs =y(14);
rhs =1/y(1);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =(1-params(4))*y(4)+y(3);
residual(4)= lhs-rhs;
lhs =y(13);
rhs =(1-params(4))*y(13)+y(12);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =T48*T50;
residual(6)= lhs-rhs;
lhs =y(5)*y(2);
rhs =y(7)*(1-params(1));
residual(7)= lhs-rhs;
lhs =y(6)*y(4);
rhs =y(7)*params(1);
residual(8)= lhs-rhs;
lhs =log(y(9)/(y(9)));
rhs =log(y(9)/(y(9)))*params(6)+params(10)*x(1);
residual(9)= lhs-rhs;
lhs =y(12)+y(11)+y(10);
rhs =y(8)*(y(5)*y(2)+y(6)*y(4));
residual(10)= lhs-rhs;
lhs =y(11)-(y(11));
rhs =(y(11)-(y(11)))*params(7)+params(13)*x(2);
residual(11)= lhs-rhs;
lhs =y(12)-(y(12));
rhs =(y(12)-(y(12)))*params(8)+params(12)*x(3);
residual(12)= lhs-rhs;
lhs =log(y(8)/(y(8)));
rhs =log(y(8)/(y(8)))*params(9)+params(11)*x(4);
residual(13)= lhs-rhs;
lhs =y(7);
rhs =y(12)+y(11)+y(1)+y(3);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =100*(y(7)-(y(7)))/(y(7));
residual(15)= lhs-rhs;
lhs =y(16);
rhs =100*(y(1)-(y(1)))/(y(1));
residual(16)= lhs-rhs;
lhs =y(17);
rhs =100*(y(3)-(y(3)))/(y(3));
residual(17)= lhs-rhs;
lhs =y(18);
rhs =100*(y(2)-(y(2)));
residual(18)= lhs-rhs;
lhs =y(19);
rhs =100*(y(5)-(y(5)))/(y(5));
residual(19)= lhs-rhs;
lhs =y(20);
rhs =100*(y(6)-(y(6)));
residual(20)= lhs-rhs;
lhs =y(21);
rhs =100*(y(10)-(y(10)));
residual(21)= lhs-rhs;
residual(22) = y(22);
residual(23) = y(23);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(5)*1/(1-y(2))));
  g1(1,2)=(-(params(5)*y(1)/((1-y(2))*(1-y(2)))));
  g1(1,5)=1-y(8);
  g1(1,8)=(-y(5));
  g1(2,6)=(-(params(2)*(1-y(8))*y(14)));
  g1(2,8)=(-(params(2)*y(14)*(-y(6))));
  g1(2,14)=1-params(2)*(1-params(4)+(1-y(8))*y(6));
  g1(3,1)=(-((-1)/(y(1)*y(1))));
  g1(3,14)=1;
  g1(4,3)=(-1);
  g1(4,4)=1-(1-params(4));
  g1(5,12)=(-1);
  g1(5,13)=1-(1-params(4));
  g1(6,2)=(-(T48*getPowerDeriv(y(2),1-params(1),1)));
  g1(6,4)=(-(T50*y(9)*y(13)^params(3)*getPowerDeriv(y(4),params(1),1)));
  g1(6,7)=1;
  g1(6,9)=(-(T50*y(13)^params(3)*y(4)^params(1)));
  g1(6,13)=(-(T50*y(4)^params(1)*y(9)*getPowerDeriv(y(13),params(3),1)));
  g1(7,2)=y(5);
  g1(7,5)=y(2);
  g1(7,7)=(-(1-params(1)));
  g1(8,4)=y(6);
  g1(8,6)=y(4);
  g1(8,7)=(-params(1));
  g1(9,9)=T222-params(6)*T222;
  g1(10,2)=(-(y(8)*y(5)));
  g1(10,4)=(-(y(8)*y(6)));
  g1(10,5)=(-(y(8)*y(2)));
  g1(10,6)=(-(y(8)*y(4)));
  g1(10,8)=(-(y(5)*y(2)+y(6)*y(4)));
  g1(10,10)=1;
  g1(10,11)=1;
  g1(10,12)=1;
  g1(13,8)=T213-params(9)*T213;
  g1(14,1)=(-1);
  g1(14,3)=(-1);
  g1(14,7)=1;
  g1(14,11)=(-1);
  g1(14,12)=(-1);
  g1(15,7)=(-(100*(-(y(7)-(y(7))))/((y(7))*(y(7)))));
  g1(15,15)=1;
  g1(16,1)=(-(100*(-(y(1)-(y(1))))/((y(1))*(y(1)))));
  g1(16,16)=1;
  g1(17,3)=(-(100*(-(y(3)-(y(3))))/((y(3))*(y(3)))));
  g1(17,17)=1;
  g1(18,18)=1;
  g1(19,5)=(-(100*(-(y(5)-(y(5))))/((y(5))*(y(5)))));
  g1(19,19)=1;
  g1(20,20)=1;
  g1(21,21)=1;
  g1(22,22)=1;
  g1(23,23)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,529);
end
end
