function [ dmin, pattern, pt1min, pt2min, d1min, d2min, d3min ] = RRT_dubins( s, g, r )
% Determines the optimal dubins path between two nodes.  The nodes have
% x and y location and orientation.  r is the turn radius of dubins car.
% The function returns the distance of the path and the optimal pattern of
% the 6 possible dubins patterns (RSR, RSL, LSL, LSR, RLR, LRL).

% Find the shortest dubins path

% direction matrix
Dmat = [1, 1, -1, -1, 1, -1; 1, -1, 1, -1, 1, -1];
direct_txt = ['LSL';'LSR';'RSL';'RSR';'LRL';'RLR'];
dmin = inf;

for i = 1:6
    % direction
    dir = Dmat(:,i); % direction (LSL, LSR, RSL, RSR, LRL, RLR)
    
    % circle centers
    c1 = s(1:2) + r*[cos(s(3) + dir(1)*pi/2); sin(s(3) + dir(1)*pi/2)];
    c2 = g(1:2) + r*[cos(g(3) + dir(2)*pi/2); sin(g(3) + dir(2)*pi/2)];
    D = norm(c2-c1);
    
    if i < 5
        if D > 2*r
            [pt1, pt2] = circle_tangents(c1, c2, r, r, dir);
            d2 = norm(pt2-pt1);
        else
            continue
        end
    else
        if D < 4*r
            [pt1, pt2, c3] = ThreeCircleTangents(c1, c2, r, dir(1));
            d2 = r*abs(arc_length(pt1, pt2, c3, -dir(1)));
        else
            continue
        end
    end
    
    d1 = r*abs(arc_length(s(1:2), pt1, c1, dir(1)));
    d3 = r*abs(arc_length(pt2, g(1:2), c2, dir(2)));
    d = d1 + d2 + d3;
    
    if d < dmin
        pattern = i;
        dmin = d;
        pt1min = pt1;
        pt2min = pt2;
        d1min = d1;
        d2min = d2;
        d3min = d3;
    end
    % Troubleshooting Plots
%     h = dubins_plot( s, g, r, pt1, pt2, i, i, 'k' );
%     title(sprintf('%s, d = %f', direct_txt(i,:), d));
    
end

end

