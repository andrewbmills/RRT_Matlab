function [ ] = RRT_plot( T, p_a, p_b, fig_num, X_limits, filename, goalid, cost, O )

set(0,'CurrentFigure',fig_num)
clf
hold on
plot(T(1,:), T(2,:), 'k.')
for i = 2:size(T,2)
    line([T(1,i), T(1, T(3,i))], [T(2,i), T(2, T(3,i))]);
end
plot(p_b(1), p_b(2), 'rx')
plot(p_a(1), p_a(2), 'b*')
t = linspace(0,2*pi);
for i = 1:size(O,2)
    plot(O(3,i)*cos(t) + O(1,i), O(3,i)*sin(t) + O(2,i))
end
x_min = X_limits(1,1);
x_max = X_limits(1,2);
y_min = X_limits(2,1);
y_max = X_limits(2,2);
axis([x_min, x_max, y_min,y_max])
set(1, 'Position', [300, 300, 720, 720]);

% Draw final path line
if goalid ~= 0
    title(sprintf('Cost: %f', T(5,goalid)))
    id = goalid;
    while T(3,id) ~= 0
        id_parent = T(3,id);
        line([T(1,id), T(1, id_parent)], [T(2,id), T(2, id_parent)], ...
            'Color', [1 0 1], ...
            'LineWidth', 3);
        id = id_parent;
    end
    title(sprintf('Cost: %f', cost));
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0);
else
    % Add frame to gif
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if size(T,2) == 2
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
      imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0);
    end    
end

end

