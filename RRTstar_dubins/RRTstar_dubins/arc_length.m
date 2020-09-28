function [ theta ] = arc_length( p1, p2, c, dir )

v1 = p1 - c;
v2 = p2 - c;
theta = atan2(v2(2), v2(1)) - atan2(v1(2), v1(1));

if theta <= 0 && dir == 1
    theta = theta + 2*pi;
elseif theta >= 0 && dir == -1
    theta = theta - 2*pi;
end

end

