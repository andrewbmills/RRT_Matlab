function T = RRT_Rewire(T, T_near, z_new, r, D, O)

for i = 1:size(T_near,2)
    z_near = T_near(:,i);
    if z_near(5) ~= z_new(4)
        [ d, patt, pt1, pt2, d1, d2, d3 ] = RRT_dubins( z_new(1:3), z_near(1:3), r );
        % Check for obstacles
        if RRT_ObstacleCheck( O, z_new(1:3), z_near(1:3), r, patt, pt1, pt2 )
            % Calculate cost through z_new to z_near
            c = RRT_Cost(z_new, T) + d;
            c_current = RRT_Cost(z_near,T);

            % Make z_new the parent of z_near if c < c_current
            if c < c_current
                T(4, z_near(5)) = z_new(5);
                T(6, z_near(5)) = d;
            end
        end
    end    
end

end

