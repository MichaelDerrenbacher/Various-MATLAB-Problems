function [y] = P(x)


% nasty dist
y = (5*exp(-x.^2) + 2*exp(-0.5*(x+3).^2) + 2*exp(-10*(x-3).^2));

% three humps
% y = (5*exp(-10*x.^2) + 5*exp(-10*(x+2).^2) + 5*exp(-10*(x-2).^2));

% two humps with near zero values inbetween
% y = (10*x).^2 .* exp(-x.^2);
end