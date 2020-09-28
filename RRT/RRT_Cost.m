function [ cost ] = RRT_Cost( z, T )
%Given a node in the tree, computes the sum of the costs of the parents to
%the beginning of the tree.

parentid = z(3);
cost  = z(5);

if cost ~= 0
    while T(3,parentid) ~= 0
        cost = cost + T(5, parentid);
        parentid = T(3, parentid);
    end
end

end

