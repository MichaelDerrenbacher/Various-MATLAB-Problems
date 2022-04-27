clc
clear

% https://www.youtube.com/watch?v=9PVcTdSlGBA
% 100 guests, guest #1 gets 1% of pie, guest #2 gets 2% of total left, ... 


total_guests = 100;
pie_size = 100; % 100 to make percent calcs easy
pie_remaining = pie_size; 

pie_eaten = zeros(1,total_guests);
pie_left = zeros(1,total_guests);


% calculate how much pie current guest eats based on guest number 
% and total amount of guests (generalized for any amount of guests)
% subtract how much current guest ate, and loop for all guests
for guest_number = 1:total_guests
    pie_eaten(guest_number) = pie_remaining * guest_number/total_guests;
    
    pie_remaining = pie_remaining - pie_eaten(guest_number);
    pie_left(guest_number) = pie_remaining;
end

% find and display the fullest guest
[pie_amount, lucky_guest] = max(pie_eaten);

disp("Guest #" + lucky_guest + " had the most pie with " ...
     + pie_amount + " units eaten")


pie(pie_amount/pie_size, '%.3f%%')
title("Largest Pie Slice Visualization")

figure
subplot(2,1,1)
stem(pie_eaten) 
title("Percentage of Pie Per Guest")
ylabel("Amount of Pie Eaten (%)")
xlabel("Guest")

subplot(2,1,2)
stem(pie_left)
ylabel("Pie Left (%)")
title("Percentage of Pie Left After Each Guest")
xlabel("Guest")
