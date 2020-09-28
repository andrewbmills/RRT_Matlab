function [ check ] = angle_between( n, a, b )
% Checks if n (deg) is in between a (deg) and b (deg) if you travel from a
% to b in the CCW direction.
n = mod(360 + mod(n,360), 360);
a = mod(3600000 + a, 360);
b = mod(3600000 + b, 360);
if a < b
    check = and(a <= n, n <= b);
else
    check = or(a <= n, n <= b);
end
end

