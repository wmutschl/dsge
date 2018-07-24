function T = rbc_dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = rbc_dynamic_g2_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 30);

T = rbc_dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(21) = getPowerDeriv(T(1),1/params(5),2);
T(22) = T(8)*T(21);
T(23) = getPowerDeriv(y(14)/y(1),1-params(5),2);
T(24) = (-y(14))/(y(1)*y(1))*T(23);
T(25) = getPowerDeriv(y(14)/y(5),1-params(5),2);
T(26) = (-y(14))/(y(5)*y(5))*T(25);
T(27) = getPowerDeriv(1-y(5),1-params(2),2);
T(28) = getPowerDeriv(T(2)*T(3),(-params(3)),2);
T(29) = T(2)*T(13)*T(28);
T(30) = getPowerDeriv(y(6),params(2),2);

end
