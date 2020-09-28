function z_new = RRT_ChooseParent(T_near, T, z_nearest, z_new, O)
% Connects the new node, z_new, to the near node in T_near that minimizes
% the cost to z_new.  The cost to z_new is initialized as cost(z_near) +
% the cost from z_near to z_new.

% Initialize z_near as the parent of z_new
z_new(3) = z_nearest(4);
z_new(5) = norm(z_new(1:2) - z_nearest(1:2));
c_min = RRT_Cost(z_nearest, T) + z_new(5);

% Find the cheapest parent node for z_new in T_near
for i = 1:size(T_near,2)
    z_near = T_near(:,i);
    
    % Check for obstacles
    if RRT_ObstacleCheck(O, z_near, z_new)
        % Calculate Cost
        d = norm(z_new(1:2) - z_near(1:2));
        c = RRT_Cost(z_near, T) + d;

        % Assign z_near as parent of z_new if it costs less than the cheapest
        % node.
        if c < c_min
            z_new(5) = d;
            z_new(3) = z_near(4);
        end
    end    
end


end

