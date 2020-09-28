function [z_new, flag] = RRT_ChooseParent(T_near, d_near, patt_near, T, z_nearest, z_new, r, D, O)
% Connects the new node, z_new, to the near node in T_near that minimizes
% the cost to z_new.  The cost to z_new is initialized as cost(z_near) +
% the cost from z_near to z_new.

flag = 1;

% Initialize z_near as the parent of z_new
z_new(4) = z_nearest(5);
[ d, pattern, pt1, pt2, d1, d2, d3 ] = RRT_dubins( z_nearest(1:3), z_new(1:3), r );
z_new(6) = d;
c_min = RRT_Cost(z_nearest, T) + z_new(6);

% Find the cheapest parent node for z_new in T_near
for i = 1:size(T_near,2)
    z_near = T_near(:,i);
    
    [ d, patt, pt1, pt2, d1, d2, d3 ] = RRT_dubins( z_near(1:3), z_new(1:3), r );
    % Check for obstacles
    if RRT_ObstacleCheck( O, z_near(1:3), z_new(1:3), r, patt, pt1, pt2 )
        % Calculate Cost
        c = RRT_Cost(z_near, T) + d;

        % Assign z_near as parent of z_new if it costs less than the cheapest
        % node.
        if c < c_min
            z_new(6) = d;
            z_new(4) = z_near(5);
        end
    end    
end


end

