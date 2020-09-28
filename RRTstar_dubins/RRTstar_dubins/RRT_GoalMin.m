function [ goalid ] = RRT_GoalMin( T, g, r )
i_goal = logical( (T(1,:) < (g(1) + r)) .* (T(1,:) > (g(1) - r)).* (T(2,:) > (g(2) - r)) .* (T(2,:) < (g(2) + r)) );
T_goal = T(:,i_goal);
cost_min = inf;
goalid = 0;
for i = 1:size(T_goal,2)
    cost = RRT_Cost(T_goal(:,i), T);
    if cost < cost_min
        goalid = T_goal(5,i);
        cost_min = cost;
    end
end


end

