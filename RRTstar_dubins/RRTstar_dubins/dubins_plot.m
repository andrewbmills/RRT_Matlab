function [h] = dubins_plot( s, g, r, pt1, pt2, pattern, fignum, color, linewidth )

% Dubins direction (LSL, LSR, RSL, RSR, LRL, RLR)
Dmat = [1, 1, -1, -1, 1, -1; 1, -1, 1, -1, 1, -1];
dir = Dmat(:,pattern);
c1 = s(1:2) + r*[cos(s(3) + dir(1)*pi/2); sin(s(3) + dir(1)*pi/2)];
c2 = g(1:2) + r*[cos(g(3) + dir(2)*pi/2); sin(g(3) + dir(2)*pi/2)];

% Phase ranges for maneuver
v1 = s(1:2) - c1;
phis = atan2(v1(2),v1(1));
phit1 = phis + arc_length(s(1:2), pt1, c1, dir(1));
t1 = phis:dir(1)*pi/60:phit1;

v2 = g(1:2) - c2;
phig = atan2(v2(2),v2(1));
phit2 = phig - arc_length(pt2, g(1:2), c2, dir(2));
t2 = phit2:dir(2)*pi/60:phig;

if pattern > 4
    c3 = 2*pt1 - c1;
    v3 = pt1 - c3;
    phit1b = atan2(v3(2),v3(1));
    phit2b = phit1b + arc_length(pt1, pt2, c3, -dir(1));
    t3 = phit1b:-dir(1)*pi/60:phit2b;
end

% Plot
h = figure(fignum);
hold on
% plot(s(1), s(2), color)
% plot(g(1), g(2), color)
plot(c1(1) + r*cos(t1), c1(2) + r*sin(t1), 'Color', color, 'LineWidth', linewidth);
plot(c2(1) + r*cos(t2), c2(2) + r*sin(t2), 'Color', color, 'LineWidth', linewidth);
if pattern > 4
    plot(c3(1) + r*cos(t3), c3(2) + r*sin(t3), 'Color', color, 'LineWidth', linewidth);
else
    line([pt1(1); pt2(1)], [pt1(2); pt2(2)], 'Color', color, ...
            'LineWidth', linewidth);
end
axis equal

end

