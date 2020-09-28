function [ check ] = RRT_ObstacleCheck( O, s, g, r, patt, pt1, pt2 )
% Checks if the dubins path between the two nodes intersects with the
% obstacle space.  Each of the three dubins turns are checked against the
% obstacle space individually.

Dmat = [1, 1, -1, -1, 1, -1; 1, -1, 1, -1, 1, -1];
dir = Dmat(:,patt);

check = 1;
% Check first turn
c1 = s(1:2) + r*[cos(s(3) + dir(1)*pi/2); sin(s(3) + dir(1)*pi/2)];
if dir(1) == 1
    check = arc_circle_collision(s(1:2), pt1, c1, O);
else
    check = arc_circle_collision(pt1, s(1:2), c1, O);
end
if check == 0
    return
end

if patt > 4
    % Check middle turn
    c3 = 2*pt1 - c1;
    if -dir(1) == 1
        check = arc_circle_collision(pt1, pt2, c3, O);
    else
        check = arc_circle_collision(pt2, pt1, c3, O);
    end    
else
    % Check straight line portion
    z1 = pt1;
    z2 = pt2;
    O_p = O(1:2,:);
    k = size(O,2);
    % Check if the straight line between pt1 and pt2 intersects the
    % obstacles.
    dz = z2 - z1;
    t_hat = sum((O(1:2,:) - repmat(z1, 1, k)).*repmat(dz, 1, k), 1)/norm(dz)^2;
    t_star = min([max([zeros(1, k); t_hat]); ones(1,k)]);
    z_star = repmat(z1, 1, k) + (z2 - z1)*t_star;
    O_diff = z_star - O_p;
    O_dist = sqrt(sum(O_diff.^2,1));
    if sum(O_dist < O(3,:)) > 0
        check = 0;
    end
end

if check == 0
    return
end

% Check last turn
c2 = g(1:2) + r*[cos(g(3) + dir(2)*pi/2); sin(g(3) + dir(2)*pi/2)];
if dir(2) == 1
    check = arc_circle_collision(pt2, g(1:2), c2, O);
else
    check = arc_circle_collision(g(1:2), pt2, c2, O);
end

end

