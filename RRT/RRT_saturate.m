function [ n_new ] = RRT_saturate( n_near, n_rand, d )

dx = n_rand(1) - n_near(1);
dy = n_rand(2) - n_near(2);
r = sqrt(dx^2 + dy^2);
if r > d
    n_new = n_near(1:2) + (d/r)*[dx; dy];
else
    n_new = n_rand;
end

end

