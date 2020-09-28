function [ ] = RRT_plot( T, p_a, p_b, r_goal, r, fig_num, X_limits, filename, goalid, cost, O, gif_flag, tree_flag )

figure(fig_num)
clf
hold on

% Plot the goal region on the figure
plot(p_b(1), p_b(2), 'r.', 'MarkerSize', 30)
plot(p_a(1), p_a(2), 'g.', 'MarkerSize', 30)
rectangle('Position', [p_b(1) - r_goal, p_b(2) - r_goal, 2*r_goal, 2*r_goal], 'EdgeColor', 'r', 'LineWidth', 3.0);

% Plot the obstacle space according to the obstacle matrix, O
t = linspace(0,2*pi);
for i = 1:size(O,2)
    plot(O(3,i)*cos(t) + O(1,i), O(3,i)*sin(t) + O(2,i), 'k', 'LineWidth', 2)
end

% Size plot window to the appropriate input dimensions and label axes
x_min = X_limits(1,1);
x_max = X_limits(1,2);
y_min = X_limits(2,1);
y_max = X_limits(2,2);
axis([x_min, x_max, y_min, y_max])
grid on
set(fig_num, 'Position', [300, 300, 720, 720]);
xlabel('East (m)', 'FontSize', 18);
ylabel('North (m)', 'FontSize', 18);
set(gca, 'FontSize', 16);

% Plot the RRTStar tree 
if tree_flag
    for i = 2:size(T,2)
        s = T(1:3,T(4,i));
        g = T(1:3,i);
        [ d, pattern, pt1, pt2, d1, d2, d3 ] = RRT_dubins( s, g, r );
        dubins_plot( s, g, r, pt1, pt2, pattern, fig_num, [128, 128, 128]/255, 1.5 );
        
        % Add figure to .gif as you build the tree
        if gif_flag
            % Add frame to gif
            frame = getframe(fig_num);
            im = frame2im(frame);
            [imind,cm] = rgb2ind(im,256);
            if i == 2
                imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
            else
                imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0);
            end
        end
    end
end

% Draw final path line
if goalid ~= 0
    id = goalid;
    while T(4,id) ~= 0
        id_parent = T(4,id);
        s = T(1:3,id_parent);
        g = T(1:3,id);
        [ d, pattern, pt1, pt2, d1, d2, d3 ] = RRT_dubins( s, g, r );
        if tree_flag
            dubins_plot( s, g, r, pt1, pt2, pattern, fig_num, 'k', 3.0 );
        else
            dubins_plot( s, g, r, pt1, pt2, pattern, fig_num, 'b', 3.0 );
        end
        id = id_parent;
    end
    % title(sprintf('Cost: %0.2f m', cost), 'FontSize', 18);
    drawnow
    if gif_flag
        frame = getframe(fig_num);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0);
    end
else
    drawnow
    if gif_flag
        % Add frame to gif
        frame = getframe(fig_num);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if size(T,2) == 2
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0);
        end
    end
end

end

