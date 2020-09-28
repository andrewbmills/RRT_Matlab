% Simple RRT example
% clear
close all
% Declare size of space
% x_min = -100;
% x_max = 525;
% y_min = 0;
% y_max = 700;
% rect_goal = 25;
% p_a = [225; 610; 0];
% p_b = [37.5; 75; pi/4];
% campus_obstacles;
% x_min = 0;
% x_max = 1000;
% y_min = 0;
% y_max = 1000;
% rect_goal = 25;
% p_a = [100; 100; pi/2];
% p_b = [900; 900; pi/4];
% r = 50;
% d = 2000;
gif_flag = 1;
full_tree_flag = 1;
% goal_bias = 0.02;
% N = 5000;
%O = [300*ones(1,16), 700*ones(1,16); linspace(-200,550,16), linspace(450,1200,16); 30*ones(1,16), 30*ones(1,16)];
% O = [500; 500; 300];
%O = [95; 5; 5];
%O = [ 200, 450, 200; 750, 620, 200]';
filename = 'RRTStar_SciTech2018.gif';

% Run RRT
fig_num = 5;
% [T, goalid, cost, cost_hist] = RRTStar(p_a, p_b, rect_goal, [x_min, x_max; y_min, y_max], O, d, r, goal_bias, N, fig_num, filename, gif_flag );

% figure
% plot(1:N, cost_hist);
% xlabel('iteration number')
% ylabel('cost (m)')

% Plot
RRT_plot(T, p_a, p_b, rect_goal, r, fig_num, [x_min, x_max; y_min, y_max], filename, goalid, cost, O, gif_flag, full_tree_flag);
hold off
% full_tree_flag = 0;
% RRT_plot(T, p_a, p_b, rect_goal, r, fig_num+1, [x_min, x_max; y_min, y_max], filename, goalid, cost, O, gif_flag, full_tree_flag);
% hold off

% if goalid ~= 0
%     ref_traj = RRT_ReferenceTrajectory( T, goalid, r );
%     % figure(fig_num+1)
%     % plot(ref_traj(1,:), ref_traj(2,:))
%     % axis([x_min, x_max, y_min,y_max])
%     % hold off
%     
%     save('RRTStar_Reference_SciTech2018.mat', 'ref_traj', 'O')
% end