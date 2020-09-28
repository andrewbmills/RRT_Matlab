function [ T, col ] = RRT( p_a, p_b, X_limits, d, goal_bias )

T = [p_a; 0];
Xmin = X_limits(:,1);
Xrange = X_limits(:,2) - X_limits(:,1);

while T(1:2,end) ~= p_b
    if rand < goal_bias
        n_rand = p_b;
    else
        n_rand = [xmin; ymin] + [xrange; yrange].*[rand([2 1]); 0]; % select a random node location from a uniform distribution
    end
    [n_near, i] = RRT_nearest(n_rand, T); % Find the nearest node to n_rand
    n_new = RRT_saturate(n_near, n_rand, d); % if n_rand is outside of a radius of d, place it along a line between n_near and n_rand at d distance away
    % check if a line from n_near to n_new travels through an obstacle
    %if 
    n_new = [n_new, i]; % add the parent node's column number to n_new
    T = [T, n_new]; % add n_new to the tree
    %end
end



end

