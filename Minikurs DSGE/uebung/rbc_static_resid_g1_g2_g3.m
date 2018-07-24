function [residual, g1, g2, g3] = rbc_static_resid_g1_g2_g3(T, y, x, params, T_flag)
% function [residual, g1, g2, g3] = rbc_static_resid_g1_g2_g3(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = rbc_static_g3_tt(T, y, x, params);
    end
    [residual, g1, g2] = rbc_static_resid_g1_g2(T, y, x, params, false);
    g3       = rbc_static_g3(T, y, x, params, false);

end
