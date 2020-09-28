function T_near = RRT_Near(T, z, d)
% Given a node, z, and tree, T, returns the nodes that are near z within a
% ball of volume y*(log(n)/n)^d.

% Calculate distance between nodes
T_diff = T(1:2,:) - repmat(z(1:2), 1, size(T,2));
T_dist = sqrt(sum(T_diff.^2, 1));

% Find radius of the n-ball

% Find nodes inside of the n-ball
i_near = logical(T_dist < d);
T_near = T(:, i_near);

end

