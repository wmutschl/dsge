function T = rbc_static_g1_tt(T, y, x, params)
% function T = rbc_static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 13);

T = rbc_static_resid_tt(T, y, x, params);

T(8) = getPowerDeriv(T(1),1/params(5),1);
T(9) = getPowerDeriv(y(12)/y(1),1-params(5),1);
T(10) = getPowerDeriv(y(12)/y(3),1-params(5),1);
T(11) = (-(getPowerDeriv(1-y(3),1-params(2),1)));
T(12) = getPowerDeriv(T(2)*T(3),(-params(3)),1);
T(13) = getPowerDeriv(y(4),params(2),1);

end
