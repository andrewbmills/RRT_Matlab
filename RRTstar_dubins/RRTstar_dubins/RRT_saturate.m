function [ g_new ] = RRT_saturate( s, g, d, r)

[ d_near, patt_near, pt1, pt2, d1, d2, d3 ] = RRT_dubins( s, g, r );

if d_near > d
    Dmat = [1, 1, -1, -1, 1, -1; 1, -1, 1, -1, 1, -1];
    dir = Dmat(:,patt_near);
    g_new = zeros(6,1);
    if d_near >= d && d1 + d2 < d
        % trim last turn to desired length
        c2 = g(1:2) + r*[cos(g(3) + dir(2)*pi/2); sin(g(3) + dir(2)*pi/2)];
        v2 = g(1:2) - c2;
        phig = atan2(v2(2),v2(1));
        phit2 = phig - arc_length(pt2, g(1:2), c2, dir(2));
        delta = d - d1 - d2;
        phi_new = phit2 + dir(2)*delta/r;
        g_new(1:2) = c2 + r*[cos(phi_new); sin(phi_new)];
        g_new(3) = phi_new + dir(2)*pi/2;
    elseif (d2+d1) >= d && d1 < d
        if patt_near > 4
            % trim second turn to desired length
            c1 = s(1:2) + r*[cos(s(3) + dir(1)*pi/2); sin(s(3) + dir(1)*pi/2)];
            c3 = 2*pt1 - c1;
            v3 = pt1 - c3;
            phit1b = atan2(v3(2),v3(1));
            delta = d - d1;
            phi_new = phit1b - dir(1)*delta/r;
            g_new(1:2) = c3 + r*[cos(phi_new); sin(phi_new)];
            g_new(3) = phi_new - dir(1)*pi/2;
        else
            % trim straight portion to desired length
            delta = d - d1;
            v = (pt2 - pt1)/norm(pt2 - pt1);
            g_new(1:2) = pt1 + delta*v;
            g_new(3) = atan2(v(2), v(1));
        end
    elseif d1 >= d
        % trim first turn to desired length
        c1 = s(1:2) + r*[cos(s(3) + dir(1)*pi/2); sin(s(3) + dir(1)*pi/2)];
        v1 = s(1:2) - c1;
        phis = atan2(v1(2),v1(1));
        phi_new = phis + dir(1)*d/r;
        g_new(1:2) = c1 + r*[cos(phi_new); sin(phi_new)];
        g_new(3) = phi_new + dir(1)*pi/2;
    else
        flag = 0;
    end
else
    g_new = g;
end

end

