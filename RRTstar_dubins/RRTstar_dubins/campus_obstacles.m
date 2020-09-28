% Campus Obstacle Map

% Determine pixel grid spacing
meter_width = (694/82)*61;
grid_pixel_width = (694/meter_width);
spacing = 25*grid_pixel_width;

limits = [-100, 525, 0, 700];

% Engineering Building
O1 = [125, 625, 75; 100, 550, 50; 175, 550, 50; 175, 600, 50];

% Leeds business school
O2 = [85*ones(3,1), linspace(410, 460, 3)', [30; 25; 25]];

% Parking Garage 436/494


% Coors Events Center
O3 = [linspace(300,350,4)', 287.5*ones(4,1), [15; 12.5;12.5;15]; ...
    287.5*ones(5,1), linspace(300, 350, 5)', 12.5*ones(5,1); ...
    360*ones(5,1), linspace(300, 350, 5)', 12.5*ones(5,1); ...
    275, 375, 17.5; 287.5, 410, 20; 325, 410, 20; 325, 375, 20; ...
    350, 362.5, 10];

% C4C
O4 = [linspace(-100, 12.5, 8)', 315*ones(8,1), 12.5*ones(8,1); ...
    -50, 295, 20; -30, 295, 20; ...
    linspace(-75, 0, 6)', 275*ones(6,1), [12.5*ones(4,1); 17*ones(2,1)]];

% Fiske
O5 = [85, 210, 20; 125, 225, 10; linspace(100,135,7)', 210*ones(7,1), 5*ones(7,1)];

% Kittredge Loop Buildings
O6 = [linspace(90,130, 4)', 155*ones(4,1), 12.5*ones(4,1); ...
    linspace(90,130, 4)', 120*ones(4,1), 10*ones(4,1); ...
    80, 160, 8; 90, 145, 5; 90, 135, 5; 90, 100, 15];

O7 = [linspace(160, 235, 8)', [153*ones(4,1); 148*ones(4,1)], 9*ones(8,1); ...
    190, 175, 10; 187, 167, 7];

O8 = [linspace(10,55,6)', 125*ones(6,1), 6*ones(6,1); ...
    20*ones(5,1), linspace(105,160,5)', 7*ones(5,1); ...
    linspace(-10, 20, 4)', 105*ones(4,1), 7*ones(4,1)];

O9 = [linspace(75, 110, 4)', 45*ones(4,1), 12.5*ones(4,1); ...
    linspace(50, 135, 7)', 25*ones(7,1), 8.5*ones(7,1)];

O10 = [linspace(315, 355, 3)', 535*ones(3,1), 13*ones(3,1); ...
    linspace(315, 355, 3)', 585*ones(3,1), 13*ones(3,1); ...
    315, 560, 13; 355, 560, 13];

O11 = [247, 185, 10; 260, 185, 10; 270, 188, 5; 280, 212.5, 11; 280, 188, 8; ...
    300*ones(4,1),  linspace(160, 190, 4)', 8*ones(4,1); 290, 188, 5; ...
    280, 200, 11];

O12 = [390, 570, 12.5; 400, 555, 10; 412.5, 562.5, 12.5];

O13 = [400, 480, 12.5; 375, 480, 12.5; 167.5, 240, 9; 280, 560, 10; 280, 550, 10];

O14 = [385*ones(3,1), linspace(400, 437.5, 3)', 12.5*ones(3,1); ...
    415*ones(3,1), linspace(400, 437.5, 3)', 12.5*ones(3,1); ...
    400, 437.5, 12.5; 400, 400, 12.5];

O15 = [linspace(295, 325, 3)', 115*ones(3,1), 9*ones(3,1); ...
    310*ones(6,1), linspace(50, 105, 6)' 7*ones(6,1); ...
    270, 70, 9; 285, 70, 9; 295, 75, 7];

O16 = [linspace(225, 265, 4)', 38*ones(4,1), 9*ones(4,1); ...
    220*ones(3,1), linspace(65, 90, 3)', 9*ones(3,1); ...
    225, 53, 6; 175, 68, 9; 200*ones(4,1), linspace(30, 65,4)', 8*ones(4,1); ...
    210, 65, 4; 187.5, 65, 5];


O = [O1; O2; O3; O4; O5; O6; O7; O8; O9; O10; O11; O12; O13; O14; O15; O16]';
% t = linspace(0,2*pi);
% figure
% hold on
% for i = 1:size(O,2)
%     plot(O(3,i)*cos(t) + O(1,i), O(3,i)*sin(t) + O(2,i), 'r')
% end
% axis(limits)