function [ T_trim, goalid_trim ] = RRT_BranchBound( T, goalid )

cost_min = RRT_Cost(T(:,goalid),T);
cost_bnb_mat = zeros(1,size(T,2));

for i = 1:size(T,2)
    cost_bnb_mat(i) = RRT_Cost(T(:,i), T) + RRT_CostToGo(T(:,i),T(:,goalid));    
end


% Subset of T to be kept
i_trim = (cost_bnb_mat <= cost_min);
T_trim = T(:, i_trim);

for i = 1:size(T_trim,2)
    if T_trim(5,i) == goalid
        goalid_trim = i;
    end
    T_trim(5,i) = i;
    T_trim(4,i) = sum(i_trim(1:T_trim(4,i)));
end

end

