function [ check ] = arc_circle_collision( p1, p2, c, O)
% Checks if an arc intersects a circular obstacle space.  Returns 1 if
% there is no intersection, returns 0 otherwise.  The arc is assumed to
% travel in the CCW direction.

check = 1;

% First, check collisions if the arc were a full circle.
d = repmat(c, 1, size(O,2)) - O(1:2,:);
dist = sqrt(sum(d.^2, 1));
r = norm(p1-c);
r_check = O(3,:) + r;
i_near = logical(dist < r_check);
O_near = O(:, i_near);

% Go through O_near and check each obstacle individually
Vp1 = p1 - c;
Vp2 = p2 - c;
theta1 = (180/pi)*atan2(Vp1(2), Vp1(1));
theta2 = (180/pi)*atan2(Vp2(2), Vp2(1));

for i = 1:size(O_near,2)
    c_o = O_near(1:2,i);
    r_o = O_near(3,i);
    v = c_o - c;
    theta = (180/pi)*atan2(v(2), v(1));
    
    if angle_between(theta, theta1, theta2)
        d = abs(norm(c_o - c) - r);
    else
        d = min([norm(p1 - c_o), norm(p2 - c_o)]);
    end
    
    if d < r_o
        check = 0;
        return
    end
end


end

