function [ ] = RRT_plot( T, p_a, p_b, fig_num, X_limits )

set(0,'CurrentFigure',fig_num)
hold on
plot(T(1,:), T(2,:), 'k.')
for i = 2:size(T,2)
    line([T(1,i), T(1, T(3,i))], [T(2,i), T(2, T(3,i))]);
end
plot(p_b(1), p_b(2), 'rx')
plot(p_a(1), p_a(2), 'b*')
x_min = X_limits(1,1);
x_max = X_limits(1,2);
y_min = X_limits(2,1);
y_max = X_limits(2,2);
axis([x_min, x_max, y_min,y_max])
drawnow

if T(1:2, end) == p_b
    id = T(3,end);
    while id ~= 0
        id_parent = T(3,id);
        line([T(1,id), T(1, id_new)], [T(2,i), T(2, id_new)]);
        id = id_new;
    end
end

end

