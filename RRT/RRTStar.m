function [ T, goalid, cost ] = RRTStar( p_a, p_b, X_limits, O, d, goal_bias, N, fig_num, filename )

T = [p_a; 0; 1; 0];
% [x; y; parent; id; cost to parent]
X_min = X_limits(:,1);
X_range = X_limits(:,2) - X_limits(:,1);
% y = (4/3)*(d^3)*exp(1);
goalid = 0;
cost = 0;

for i = 1:N 

    % Select a random node location from a uniform distribution w/ goal
    % bias
    if goalid == 0
        if rand < goal_bias
            n_rand = p_b;
        else
            n_rand = X_min + X_range.*rand([2 1]);
        end
    else
        n_rand = X_min + X_range.*rand([2 1]);
    end
    % Find the nearest node to n_rand
    [n_near, i] = RRT_nearest(n_rand, T);

    % If n_rand is outside of a radius of d, place it along a line between n_near and n_rand at d distance away
    n_new = RRT_saturate(n_near, n_rand, d);

    % Check if a line from n_near to n_new travels through an obstacle
    if RRT_ObstacleCheck(O, n_near, n_new)
        T_near = RRT_Near(T, n_new, d);
        n_new = RRT_ChooseParent(T_near, T, n_near, n_new, O);

        % Add n_new to the tree
        n_new(4) = size(T,2) + 1;
        T = [T, n_new];
        if n_new(1:2) == p_b
            goalid = n_new(4);
        end

        % Rewire tree with new node
        T = RRT_Rewire(T, T_near, n_new, O);

        if goalid ~= 0
            cost = RRT_Cost(T(:,goalid), T);
        end    

        if mod(i-1, 10) == 0
            RRT_plot(T,p_a,p_b,fig_num, X_limits, filename, goalid, cost, O)
        end
    end
end



end

