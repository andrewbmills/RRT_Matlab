function [ check ] = RRT_ObstacleCheck( O, z1, z2 )
%Given one node, returns 0 if the node is in the obstacle space, 1
%otherwise.  Given two nodes, returns 0 if the straight line between the
%two points intersects the obstacle space, 1 otherwise.  This only works
%for circular obstacle spaces.

z1 = z1(1:2);
z2 = z2(1:2);
check = 1;
O_p = O(1:2,:);
k = size(O,2);
% Check if the straight line between z1 and z2 intersects the
% obstacles.
dz = z2 - z1;
t_hat = sum((O(1:2,:) - repmat(z1, 1, k)).*repmat(dz, 1, k), 1)/norm(dz)^2;
t_star = min([max([zeros(1, k); t_hat]); ones(1,k)]);
z_star = z1 + (z2 - z1)*t_star;
O_diff = z_star - O_p;
O_dist = sqrt(sum(O_diff.^2,1));
if sum(O_dist < O(3,:)) > 0
    check = 0;
end

end

