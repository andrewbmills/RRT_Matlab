function [ r ] = RRT_ReferenceTrajectory( T, goalid, R )
% Takes as input an RRT* dubins tree and computes the x,y coordinates for a
% finite resolution.

id = goalid;
r = T(1:2, goalid);
while T(4, id) ~= 0
    parentid = T(4,id);
    s = T(1:3, parentid);
    g = T(1:3, id);
    [ d, pattern, pt1, pt2, d1, d2, d3 ] = RRT_dubins( s, g, R );    
    
    % Dubins direction (LSL, LSR, RSL, RSR, LRL, RLR)
    Dmat = [1, 1, -1, -1, 1, -1; 1, -1, 1, -1, 1, -1];
    dir = Dmat(:,pattern);
    c1 = s(1:2) + R*[cos(s(3) + dir(1)*pi/2); sin(s(3) + dir(1)*pi/2)];
    c2 = g(1:2) + R*[cos(g(3) + dir(2)*pi/2); sin(g(3) + dir(2)*pi/2)];

    % Phase ranges for maneuver
    v1 = s(1:2) - c1;
    phis = atan2(v1(2),v1(1));
    phit1 = phis + arc_length(s(1:2), pt1, c1, dir(1));
    t1 = phis:dir(1)*pi/180:phit1;

    v2 = g(1:2) - c2;
    phig = atan2(v2(2),v2(1));
    phit2 = phig - arc_length(pt2, g(1:2), c2, dir(2));
    t2 = phit2:dir(2)*pi/180:phig;

    if pattern > 4
        c3 = 2*pt1 - c1;
        v3 = pt1 - c3;
        phit1b = atan2(v3(2),v3(1));
        phit2b = phit1b + arc_length(pt1, pt2, c3, -dir(1));
        t3 = phit1b:-dir(1)*pi/180:phit2b;
        
        r_local = [c1(1) + R*cos(t1), c3(1) + R*cos(t3), c2(1) + R*cos(t2); ...
            c1(2) + R*sin(t1), c3(2) + R*sin(t3), c2(2) + R*sin(t2)];
    else
        dx = R*pi/180;
        dist = norm(pt2 - pt1);
        t3 = linspace(0, 1, ceil(dist/dx));
        x_line = t3*pt2(1) + (1 - t3)*pt1(1);
        y_line = t3*pt2(2) + (1 - t3)*pt1(2);
        
        r_local = [c1(1) + R*cos(t1), x_line, c2(1) + R*cos(t2); ...
            c1(2) + R*sin(t1), y_line, c2(2) + R*sin(t2)];        
    end
    
    r = [r_local, r];
    id = parentid;
end


end

