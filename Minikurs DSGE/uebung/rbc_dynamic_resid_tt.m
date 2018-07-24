function T = rbc_dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = rbc_dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 7);

T(1) = params(4)*y(1)^params(5)+(1-params(4))*y(5)^params(5);
T(2) = y(6)^params(2);
T(3) = (1-y(5))^(1-params(2));
T(4) = (T(2)*T(3))^(-params(3));
T(5) = y(6)^(params(2)-1);
T(6) = params(2)*T(4)*T(5);
T(7) = (1-y(5))^(-params(2));

end
