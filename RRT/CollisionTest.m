% RRT_ObstacleCheck Test
z1 = [-1;-1];
z2 = [3;3];
O = [2, 0.5; 0.5, 3; 1, 2];
t = linspace(0,2*pi);
figure
hold on
for i = 1:size(O,2)
    plot(O(3,i)*cos(t) + O(1,i), O(3,i)*sin(t) + O(2,i))
end
line([z1(1), z2(1)], [z1(2), z2(2)]);
grid on
pbaspect([1 1 1])

RRT_ObstacleCheck(O,z1,z2)
RRT_ObstacleCheck(O(:,1),z1,z2)
RRT_ObstacleCheck(O(:,2),z1,z2)