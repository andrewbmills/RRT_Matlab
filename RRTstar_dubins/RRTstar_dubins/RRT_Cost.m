function [ cost ] = RRT_Cost( z, T )
%Given a node in the tree, computes the sum of the costs of the parents to
%the beginning of the tree.

parentid = z(4);
cost  = z(6);

if cost ~= 0
    while T(4,parentid) ~= 0
        cost = cost + T(6, parentid);
        parentid = T(4, parentid);
    end
end

end

