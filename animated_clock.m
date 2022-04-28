clc
clear
close all

% display a clock based on an hour and minute
% loop through times to animate clock moving

% starting hour
hour = 0;

% setup to make clock face look nice
theta = linspace(0, 2*pi, 101);
polarplot(theta, ones(1, 101)*10, 'LineWidth', 4, 'Color', 'Black'); % clock border
hold on
polarplot(theta, ones(1, 101)*0.1, 'LineWidth', 4, 'Color', 'Black'); % clock center
pax = gca;
pax.ThetaZeroLocation = 'top';
pax.RLim = [0 10];
pax.ThetaTick = [];
pax.RTick = [];
pax.ThetaDir = 'clockwise';

% display numbers on clock
% offset is to fix top and bottom text position 
offset = 0.08; 
text(0 - offset, 9, "12", 'fontsize', 20)
text(pi/2, 8.75, "3", 'fontsize', 20)
text(pi + offset/2, 9, "6", 'fontsize', 20)
text(-pi/2, 9.25, "9", 'fontsize', 20)

% initalize these before so deleting them doesn't throw error
minute_hand_line = [];
hour_hand_line = [];

% loop over 12 hours in 1 minute increments
for minute = 0 : 1 : 12*60
    delete(minute_hand_line)
    delete(hour_hand_line)
    
    % adjust hour and minute to handle hours > 12, and minutes > 60
    % this lets me loop through only minutes and not worry about hours
    hour_adjust = mod(hour, 12) + floor(minute / 60); 
    minute_adjust = mod(minute, 60);

    % minute hand angle is determined by minute: 
    %   increases at rate of 6 deg/min
    % hour hand angle is determined by minute and hour:
    %   increases at rate of 30 deg/hour
    %   increases at rate of 0.5 deg/min
    minute_hand_angle = minute_adjust / 60 * 360;
    hour_hand_angle = hour_adjust / 12 * 360 + minute_adjust / 2;

    % convert degrees to radians
    minute_hand_angle = (minute_hand_angle) * pi/180;
    hour_hand_angle = (hour_hand_angle) * pi/180;

    minute_hand_line = polarplot([minute_hand_angle, minute_hand_angle], [0,8], 'LineWidth', 2, 'Color', 'Red');
    hour_hand_line = polarplot([hour_hand_angle, hour_hand_angle], [0,4], 'LineWidth', 2, 'Color', 'Blue');
    
    pause(0.01);
end
