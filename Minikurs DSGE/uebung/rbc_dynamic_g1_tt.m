function T = rbc_dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = rbc_dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 20);

T = rbc_dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(8) = params(4)*getPowerDeriv(y(1),params(5),1);
T(9) = getPowerDeriv(T(1),1/params(5),1);
T(10) = getPowerDeriv(y(14)/y(1),1-params(5),1);
T(11) = (1-params(4))*getPowerDeriv(y(5),params(5),1);
T(12) = getPowerDeriv(y(14)/y(5),1-params(5),1);
T(13) = (-(getPowerDeriv(1-y(5),1-params(2),1)));
T(14) = getPowerDeriv(T(2)*T(3),(-params(3)),1);
T(15) = (-(getPowerDeriv(1-y(5),(-params(2)),1)));
T(16) = getPowerDeriv(y(6),params(2),1);
T(17) = getPowerDeriv(y(6),params(2)-1,1);
T(18) = T(5)*params(2)*T(14)*T(3)*T(16)+params(2)*T(4)*T(17);
T(19) = 1/y(1);
T(20) = 1/y(5);

end
