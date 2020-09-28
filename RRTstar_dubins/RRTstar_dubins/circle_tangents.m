function [ pt1, pt2 ] = circle_tangents( p1, p2, r1, r2, dir )
% Outputs the tangent points on the circles given their center locations
% (p1,p2), radii (r1,r2), and the turn directions, dir.  dir = [+/-1;
% +/-1], where +1 is a counter-clockwise turn about the corresponding
% circle.  For example, [-1,1] is a CW turn about circle 1, then a straight
% line, and then a CCW turn about circle 2.

D = norm(p2-p1);
if dir(1) == dir(2)
    r4 = r1-r2;
else
    r4 = r1 + r2;
end

if r4 > D
    return
end

if dir(1) == -1
    y = acos(r4/D);
else
    y = -acos(r4/D);
end
theta = y + atan2(p2(2) - p1(2), p2(1) - p1(1));
pt = p1 + r4*[cos(theta); sin(theta)];
pt1 = p1 + r1*[cos(theta); sin(theta)];
pt2 = pt1 + (p2 - pt);

end

