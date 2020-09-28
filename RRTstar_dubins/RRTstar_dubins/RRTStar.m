function [ T, goalid, cost, cost_hist ] = RRTStar( p_a, p_b, r_goal, X_limits, O, D, r, goal_bias, N, fig_num, filename, gif_flag )

T = [p_a; 0; 1; 0];
% [x; y; psi; parent; id; cost to parent]
X_min = X_limits(:,1);
X_range = [X_limits(:,2) - X_limits(:,1); 2*pi];
goalid = 0;
cost = 0;
cost_hist = zeros(1, N);
i = 1;

while i <= N 

    % Select a random node location from a uniform distribution w/ goal
    % bias
    if goalid == 0
        if rand < goal_bias
            n_rand = p_b;
        else
            n_rand = [X_min; 0] + X_range.*rand([3 1]);
        end
    else
        n_rand = [X_min; 0] + X_range.*rand([3 1]);
    end
    
    % Find the nearest node to n_rand
    
    n_near = RRT_nearest(n_rand, T, r);

    % If n_rand is outside of a radius of d, place it along a path between n_near and n_rand at d distance away
    %n_new = RRT_saturate(n_near, n_rand, D-0.5, r);
    n_new = n_rand;
    [ dist, patt_near, pt1_near, pt2_near, d1, d2, d3 ] = RRT_dubins( n_near, n_new, r );

    % Check if a line from n_near to n_new travels through an obstacle
    if RRT_ObstacleCheck(O, n_near, n_new, r, patt_near, pt1_near, pt2_near)
        [T_near, d_near, patt_near] = RRT_Near(T, n_new, D, r);
        [n_new, flag] = RRT_ChooseParent(T_near, d_near, patt_near, T, n_near, n_new, r, D, O);
        
        % Add n_new to the tree
        n_new(5) = size(T,2) + 1;
        T = [T, n_new];

        % Rewire tree with new node
        T = RRT_Rewire(T, T_near, n_new, r, D, O);
        
        goalid = RRT_GoalMin(T, p_b, r_goal);
        
        if goalid ~= 0
            cost = RRT_Cost(T(:,goalid), T);
        end
        
        % Branch-and-Bound
        if mod(i, 50) == 0 && goalid ~= 0
            [T, goalid] = RRT_BranchBound(T, goalid);
        end
        
        i = i + 1;
    end
    cost_hist(i) = cost;
%     if mod(i, 3) == 0 || size(T,2) == 2
%         RRT_plot(T, p_a, p_b, r_goal, r, fig_num, X_limits, filename, goalid, cost, O, gif_flag);
%     end
end

end

