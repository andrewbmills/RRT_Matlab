function [ pt1, pt2, p3 ] = ThreeCircleTangents( p1, p2, r, dir )

D = norm(p2-p1);

if D > (4*r)
    error('Points too far apart.  No feasible path');
end

theta = acos(D/(4*r));

if dir == 1 % LRL
    y = atan2(p2(2) - p1(2), p2(1) - p1(1)) - theta;
elseif dir == -1 % RLR
    y = atan2(p2(2) - p1(2), p2(1) - p1(1)) + theta;
else
    error('Direction input invalid.  Must be either 1 or -1.')
end

pt1 = p1 + r*[cos(y); sin(y)];
p3 = p1 + 2*r*[cos(y); sin(y)];
pt2 = p3 + 0.5*(p2-p3);

end

