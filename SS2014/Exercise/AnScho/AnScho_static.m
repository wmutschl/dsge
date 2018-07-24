function [residual, g1, g2] = AnScho_static(y, x, params)
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

residual = zeros( 9, 1);

%
% Model equations
%

T20 = exp((-params(2))*y(1)+params(2)*y(1)+y(2)-y(6)-y(3));
T28 = (1-params(3))/(params(3)*params(5)*params(6));
T37 = exp(y(3))*(1-1/(2*params(3)));
T38 = 1/(2*params(3))+T37;
T125 = (exp(y(3))-1)*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4))+exp(y(3))*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4));
lhs =1;
rhs =T20;
residual(1)= lhs-rhs;
lhs =T28*(exp(params(2)*y(1))-1);
rhs =(exp(y(3))-1)*T38-params(1)*(exp(y(3))-1)*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4));
residual(2)= lhs-rhs;
lhs =exp(y(1)-y(4));
rhs =exp((-y(5)))-params(5)*params(6)*params(7)/2*(exp(y(3))-1)^2;
residual(3)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(8)+y(3)*(1-params(8))*params(11)+(1-params(8))*params(12)*(y(4)-y(5))+x(1);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(9)+x(2);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(10)+x(3);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =params(13)+y(6)*100;
residual(7)= lhs-rhs;
lhs =y(8);
rhs =params(14)+y(3)*400;
residual(8)= lhs-rhs;
lhs =y(9);
rhs =params(14)+params(15)+params(13)*4+y(2)*400;
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(T20*(params(2)+(-params(2)))));
  g1(1,2)=(-T20);
  g1(1,3)=T20;
  g1(1,6)=T20;
  g1(2,1)=T28*params(2)*exp(params(2)*y(1))-(-(params(1)*(exp(y(3))-1)*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4))*(params(2)+(-params(2)))));
  g1(2,3)=(-(exp(y(3))*T38+(exp(y(3))-1)*T37-params(1)*T125));
  g1(3,1)=exp(y(1)-y(4));
  g1(3,3)=params(5)*params(6)*params(7)/2*exp(y(3))*2*(exp(y(3))-1);
  g1(3,4)=(-exp(y(1)-y(4)));
  g1(3,5)=exp((-y(5)));
  g1(4,2)=1-params(8);
  g1(4,3)=(-((1-params(8))*params(11)));
  g1(4,4)=(-((1-params(8))*params(12)));
  g1(4,5)=(1-params(8))*params(12);
  g1(5,5)=1-params(9);
  g1(6,6)=1-params(10);
  g1(7,6)=(-100);
  g1(7,7)=1;
  g1(8,3)=(-400);
  g1(8,8)=1;
  g1(9,2)=(-400);
  g1(9,9)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(26,3);
  v2(1,1)=1;
  v2(1,2)=1;
  v2(1,3)=(-((params(2)+(-params(2)))*T20*(params(2)+(-params(2)))));
  v2(2,1)=1;
  v2(2,2)=10;
  v2(2,3)=(-(T20*(params(2)+(-params(2)))));
  v2(3,1)=1;
  v2(3,2)=2;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=11;
  v2(4,3)=(-T20);
  v2(5,1)=1;
  v2(5,2)=19;
  v2(5,3)=T20*(params(2)+(-params(2)));
  v2(6,1)=1;
  v2(6,2)=3;
  v2(6,3)=  v2(5,3);
  v2(7,1)=1;
  v2(7,2)=20;
  v2(7,3)=T20;
  v2(8,1)=1;
  v2(8,2)=12;
  v2(8,3)=  v2(7,3);
  v2(9,1)=1;
  v2(9,2)=21;
  v2(9,3)=(-T20);
  v2(10,1)=1;
  v2(10,2)=46;
  v2(10,3)=T20*(params(2)+(-params(2)));
  v2(11,1)=1;
  v2(11,2)=6;
  v2(11,3)=  v2(10,3);
  v2(12,1)=1;
  v2(12,2)=47;
  v2(12,3)=T20;
  v2(13,1)=1;
  v2(13,2)=15;
  v2(13,3)=  v2(12,3);
  v2(14,1)=1;
  v2(14,2)=48;
  v2(14,3)=(-T20);
  v2(15,1)=1;
  v2(15,2)=24;
  v2(15,3)=  v2(14,3);
  v2(16,1)=1;
  v2(16,2)=51;
  v2(16,3)=(-T20);
  v2(17,1)=2;
  v2(17,2)=1;
  v2(17,3)=T28*params(2)*params(2)*exp(params(2)*y(1))-(-(params(1)*(exp(y(3))-1)*(params(2)+(-params(2)))*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4))*(params(2)+(-params(2)))));
  v2(18,1)=2;
  v2(18,2)=19;
  v2(18,3)=params(1)*((exp(y(3))-1)*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4))*(params(2)+(-params(2)))+exp(y(3))*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4))*(params(2)+(-params(2))));
  v2(19,1)=2;
  v2(19,2)=3;
  v2(19,3)=  v2(18,3);
  v2(20,1)=2;
  v2(20,2)=21;
  v2(20,3)=(-(exp(y(3))*T38+exp(y(3))*T37+(exp(y(3))-1)*T37+exp(y(3))*T37-params(1)*(T125+exp(y(3))*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4))+exp(y(3))*exp(y(3)+(-params(2))*y(1)+params(2)*y(1)+y(4)-y(4)))));
  v2(21,1)=3;
  v2(21,2)=1;
  v2(21,3)=exp(y(1)-y(4));
  v2(22,1)=3;
  v2(22,2)=21;
  v2(22,3)=params(5)*params(6)*params(7)/2*(exp(y(3))*2*(exp(y(3))-1)+exp(y(3))*2*exp(y(3)));
  v2(23,1)=3;
  v2(23,2)=28;
  v2(23,3)=(-exp(y(1)-y(4)));
  v2(24,1)=3;
  v2(24,2)=4;
  v2(24,3)=  v2(23,3);
  v2(25,1)=3;
  v2(25,2)=31;
  v2(25,3)=exp(y(1)-y(4));
  v2(26,1)=3;
  v2(26,2)=41;
  v2(26,3)=(-exp((-y(5))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),9,81);
end
end
