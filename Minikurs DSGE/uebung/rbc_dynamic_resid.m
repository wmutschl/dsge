function residual = rbc_dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = rbc_dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = rbc_dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(12, 1);
lhs = y(14);
rhs = T(1)^(1/params(5));
residual(1) = lhs - rhs;
lhs = y(12);
rhs = params(4)*(y(14)/y(1))^(1-params(5));
residual(2) = lhs - rhs;
lhs = y(13);
rhs = (1-params(4))*(y(14)/y(5))^(1-params(5));
residual(3) = lhs - rhs;
lhs = y(10);
rhs = T(3)*T(6);
residual(4) = lhs - rhs;
lhs = y(11);
rhs = (-(T(2)*(1-params(2))*T(4)*T(7)));
residual(5) = lhs - rhs;
lhs = y(10);
rhs = params(1)*y(16)*(1+y(15)*y(17)-params(6));
residual(6) = lhs - rhs;
lhs = y(7);
rhs = params(8)*exp(y(8));
residual(7) = lhs - rhs;
lhs = y(8);
rhs = params(7)*y(2)+x(it_, 1);
residual(8) = lhs - rhs;
lhs = y(4);
rhs = y(14)*y(7);
residual(9) = lhs - rhs;
lhs = y(3);
rhs = y(9)+y(1)*(1-params(6));
residual(10) = lhs - rhs;
residual(11) = y(11)/y(10)+y(13)*y(7);
lhs = y(6)+y(3);
rhs = y(14)*y(7)+y(1)*(1-params(6));
residual(12) = lhs - rhs;

end
