function g1 = rbc_dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = rbc_dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = rbc_dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(12, 18);
g1(1,1)=(-(T(8)*T(9)));
g1(1,5)=(-(T(9)*T(11)));
g1(1,14)=1;
g1(2,1)=(-(params(4)*(-y(14))/(y(1)*y(1))*T(10)));
g1(2,12)=1;
g1(2,14)=(-(params(4)*T(10)*T(19)));
g1(3,5)=(-((1-params(4))*(-y(14))/(y(5)*y(5))*T(12)));
g1(3,13)=1;
g1(3,14)=(-((1-params(4))*T(12)*T(20)));
g1(4,5)=(-(T(6)*T(13)+T(3)*T(5)*params(2)*T(2)*T(13)*T(14)));
g1(4,6)=(-(T(3)*T(18)));
g1(4,10)=1;
g1(5,5)=T(7)*T(2)*(1-params(2))*T(2)*T(13)*T(14)+T(2)*(1-params(2))*T(4)*T(15);
g1(5,6)=T(7)*((1-params(2))*T(4)*T(16)+T(2)*(1-params(2))*T(14)*T(3)*T(16));
g1(5,11)=1;
g1(6,15)=(-(params(1)*y(16)*y(17)));
g1(6,10)=1;
g1(6,16)=(-(params(1)*(1+y(15)*y(17)-params(6))));
g1(6,17)=(-(params(1)*y(16)*y(15)));
g1(7,7)=1;
g1(7,8)=(-(params(8)*exp(y(8))));
g1(8,2)=(-params(7));
g1(8,8)=1;
g1(8,18)=(-1);
g1(9,4)=1;
g1(9,7)=(-y(14));
g1(9,14)=(-y(7));
g1(10,1)=(-(1-params(6)));
g1(10,3)=1;
g1(10,9)=(-1);
g1(11,7)=y(13);
g1(11,10)=(-y(11))/(y(10)*y(10));
g1(11,11)=1/y(10);
g1(11,13)=y(7);
g1(12,1)=(-(1-params(6)));
g1(12,3)=1;
g1(12,6)=1;
g1(12,7)=(-y(14));
g1(12,14)=(-y(7));

end
