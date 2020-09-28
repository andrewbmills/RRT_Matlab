function [ n_near, dmin, pattern_min, pt1min, pt2min] = RRT_nearest( n_rand, T, r )

T_p = T(1:2,:);
T_p = T_p - repmat(n_rand(1:2), [1, size(T,2)]);
[M, i] = min(sum(T_p.^2, 1));
n_near = T(:,i);

% dmin = [inf, 0, 0, 0];
% for i = 1:size(T,2)
%     n = T(:, i);
%     [ d, pattern, pt1, pt2, d1, d2, d3 ] = RRT_dubins( n, n_rand, r );
%     if d < dmin(1)
%         dmin = [d, d1, d2, d3];
%         n_near = n;
%         pattern_min = pattern;
%         pt1min = pt1;
%         pt2min = pt2;
%     end
% end

end

