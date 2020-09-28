% Simple RRT example
% Declare size of space
% x_min = 0;
% x_max = 100;
% y_min = 0;
% y_max = 100;
% d = 10;
% p_a = [10; 10];
% p_b = [90; 90];
x_min = -150;
x_max = 500;
y_min = 0;
y_max = 700;
d = 25;
p_a = [240; 610];
p_b = [25; 75];
goal_bias = 0.05;
N = 5000;
k = 10;
% O = [100*rand([2,k]); 7*ones(1,k)];
% O = [50; 50; 40];
campus_obstacles
rmax = 0;
filename = 'RRTStar_example.gif';

% Run RRT
fig_num = 1;
figure(fig_num)
T = RRTStar(p_a, p_b, [x_min, x_max; y_min, y_max], O, d, goal_bias, N, fig_num, filename );
axis([x_min, x_max, y_min,y_max])
hold off