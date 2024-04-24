function [value] = d(x,m)
    value = sum(0.5 * (m - x).^2);
end