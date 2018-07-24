function [residual, g1, g2] = rbc_static_resid_g1_g2(T, y, x, params, T_flag)
% function [residual, g1, g2] = rbc_static_resid_g1_g2(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = rbc_static_g2_tt(T, y, x, params);
    end
    [residual, g1] = rbc_static_resid_g1(T, y, x, params, false);
    g2       = rbc_static_g2(T, y, x, params, false);

end
