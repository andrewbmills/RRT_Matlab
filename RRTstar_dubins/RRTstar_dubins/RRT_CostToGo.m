function [ cost2go ] = RRT_CostToGo( z, g )

cost2go = norm(g(1:2) - z(1:2));

end

