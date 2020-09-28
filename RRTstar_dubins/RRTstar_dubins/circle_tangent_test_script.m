clear

% Circle tangents test script
% CCW is positive, CW is negative.  LSL is [1,1]. LRL is 1.
% RSR, LSL, LSR, and RSL
% s = [-10; 0; 135*pi/180];
% g = [15; 30; 270*pi/180];
% dir = [-1;-1];
% r1 = 17;
% r2 = 17;
% c1 = s(1:2) + r1*[cos(s(3) + dir(1)*pi/2); sin(s(3) + dir(1)*pi/2)];
% c2 = g(1:2) + r2*[cos(g(3) + dir(2)*pi/2); sin(g(3) + dir(2)*pi/2)];
% t = 0:pi/180:2*pi;
% [pt1, pt2] = circle_tangents(c1, c2, r1, r2, dir);
% 
% if ~isempty(pt1)
%     % Calculate the phase of the path
%     v1 = s(1:2) - c1;
%     phis = atan2(v1(2),v1(1));
%     phit1 = phis + arc_length(s(1:2), pt1, c1, dir(1));
%     t1 = phis:dir(1)*pi/180:phit1;
% 
%     v2 = g(1:2) - c2;
%     phig = atan2(v2(2),v2(1));
%     phit2 = phig - arc_length(pt2, g(1:2), c2, dir(2));
%     t2 = phit2:dir(2)*pi/180:phig;
% 
%     %Plot
%     figure
%     hold on
%     plot(c1(1) + r1*cos(t1), c1(2) + r1*sin(t1), 'm');
%     %plot(c1(1) + r1*cos(t), c1(2) + r1*sin(t), 'm--');
%     plot(c2(1) + r2*cos(t2), c2(2) + r2*sin(t2), 'r');
%     %plot(c2(1) + r2*cos(t), c2(2) + r2*sin(t), 'r--');
%     line([pt1(1); pt2(1)], [pt1(2); pt2(2)]);
%     axis equal
% end
% 
% %%
% % RLR and LRL
% d = -1;
% r = 17;
% c1 = s(1:2) + r1*[cos(s(3) + d*pi/2); sin(s(3) + d*pi/2)];
% c2 = g(1:2) + r2*[cos(g(3) + d*pi/2); sin(g(3) + d*pi/2)];
% if norm(c2-c1) < 4*r
%     [pt1, pt2, c3] = ThreeCircleTangents(c1, c2, r, -1);
%     
%     % Calculate the phase of the path
%     v1 = s(1:2) - c1;
%     phis = atan2(v1(2),v1(1));
%     phit1 = phis + arc_length(s(1:2), pt1, c1, d);
%     t1 = phis:d*pi/180:phit1;
% 
%     v2 = g(1:2) - c2;
%     phig = atan2(v2(2),v2(1));
%     phit2 = phig - arc_length(pt2, g(1:2), c2, d);
%     t2 = phit2:d*pi/180:phig;
% 
%     v3 = pt1 - c3;
%     phit1b = atan2(v3(2),v3(1));
%     phit2b = phit1b + arc_length(pt1, pt2, c3, -d);
%     t3 = phit1b:-d*pi/180:phit2b;
% 
%     figure
%     hold on
%     plot(c1(1) + r*cos(t1), c1(2) + r*sin(t1), 'm');
%     plot(c2(1) + r*cos(t2), c2(2) + r*sin(t2), 'r');
%     plot(c3(1) + r*cos(t3), c3(2) + r*sin(t3), 'b');
%     axis equal
% end

%%
clear
close all
g = [45; 30; 0*pi/180];
s = [0; 0; 90*pi/180];
r = 30;
[ dmin, pattern, pt1, pt2 ] = RRT_dubins( s, g, r );
dubins_plot(s,g,r,pt1,pt2,pattern,3);