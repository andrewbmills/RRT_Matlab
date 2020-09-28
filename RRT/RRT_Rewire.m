function T = RRT_Rewire(T, T_near, z_new, O)

for i = 1:size(T_near,2)
    z_near = T_near(:,i);
    if z_near(4) ~= z_new(3)
        % Check for obstacles
        if RRT_ObstacleCheck(O, z_near, z_new)
            % Calculate cost through z_new to z_near
            d = norm(z_new(1:2) - z_near(1:2));
            c = RRT_Cost(z_new, T) + d;
            c_current = RRT_Cost(z_near,T);

            % Make z_new the parent of z_near if c < z_near(5)
            if c < c_current
                T(3, z_near(4)) = z_new(4);
                T(5, z_near(4)) = d;
            end
        end
    end    
end

end

