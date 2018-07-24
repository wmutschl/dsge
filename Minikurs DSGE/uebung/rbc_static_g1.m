function g1 = rbc_static_g1(T, y, x, params, T_flag)
% function g1 = rbc_static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = rbc_static_g1_tt(T, y, x, params);
end
g1 = zeros(12, 12);
g1(1,1)=(-(params(4)*getPowerDeriv(y(1),params(5),1)*T(8)));
g1(1,3)=(-(T(8)*(1-params(4))*getPowerDeriv(y(3),params(5),1)));
g1(1,12)=1;
g1(2,1)=(-(params(4)*(-y(12))/(y(1)*y(1))*T(9)));
g1(2,10)=1;
g1(2,12)=(-(params(4)*T(9)*1/y(1)));
g1(3,3)=(-((1-params(4))*(-y(12))/(y(3)*y(3))*T(10)));
g1(3,11)=1;
g1(3,12)=(-((1-params(4))*T(10)*1/y(3)));
g1(4,3)=(-(T(6)*T(11)+T(2)*T(5)*params(2)*T(3)*T(11)*T(12)));
g1(4,4)=(-(T(2)*(T(5)*params(2)*T(12)*T(2)*T(13)+params(2)*T(4)*getPowerDeriv(y(4),params(2)-1,1))));
g1(4,8)=1;
g1(5,3)=T(7)*T(3)*(1-params(2))*T(3)*T(11)*T(12)+T(3)*(1-params(2))*T(4)*(-(getPowerDeriv(1-y(3),(-params(2)),1)));
g1(5,4)=T(7)*((1-params(2))*T(4)*T(13)+T(3)*(1-params(2))*T(12)*T(2)*T(13));
g1(5,9)=1;
g1(6,5)=(-(y(10)*y(8)*params(1)));
g1(6,8)=1-params(1)*(1+y(10)*y(5)-params(6));
g1(6,10)=(-(y(8)*params(1)*y(5)));
g1(7,5)=1;
g1(7,6)=(-(params(8)*exp(y(6))));
g1(8,6)=1-params(7);
g1(9,2)=1;
g1(9,5)=(-y(12));
g1(9,12)=(-y(5));
g1(10,1)=1-(1-params(6));
g1(10,7)=(-1);
g1(11,5)=y(11);
g1(11,8)=(-y(9))/(y(8)*y(8));
g1(11,9)=1/y(8);
g1(11,11)=y(5);
g1(12,1)=1-(1-params(6));
g1(12,4)=1;
g1(12,5)=(-y(12));
g1(12,12)=(-y(5));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
