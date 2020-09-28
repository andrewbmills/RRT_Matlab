function [ n_near, i] = RRT_nearest( n_rand, T )

T_p = T(1:2,:);
T_p = T_p - repmat(n_rand(1:2), [1, size(T,2)]);
[M, i] = min(sum(T_p.^2, 1));
n_near = T(:,i);

end

