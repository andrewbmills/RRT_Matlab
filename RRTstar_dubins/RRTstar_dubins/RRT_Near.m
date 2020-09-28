function [T_near, d_near, patt_near] = RRT_Near(T, g, d, r)
% Given a goal, g, and tree, T, returns the nodes that are near g within a
% travel cost of d.

T_nearer = T(:, logical((T(1,:) < d).*(T(2,:) < d)));
dist_mat = zeros(1, size(T_nearer,2));
patt_mat = zeros(1, size(T_nearer,2));

for i = 1:size(T_nearer,2)
    s = T_nearer(1:3, i);
    [ dist, pattern, pt1, pt2, d1, d2, d3 ] = RRT_dubins( s, g, r );
    dist_mat(1, i) = dist;
    patt_mat(1, i) = pattern;
end

% Find nodes inside of the n-ball
i_near = logical(dist_mat < d);
T_near = T_nearer(:, i_near);
d_near = dist_mat(:, i_near);
patt_near = patt_mat(:, i_near);

end

