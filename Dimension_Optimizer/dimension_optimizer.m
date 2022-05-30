clc
clear

%{
     W
 ┌───┴───┐
 ┏━━━━━━━┓ ┐
 ┃       ┃ │
 ┃       ┃ ├ L
 ┃       ┃ │
 ┗━━━━━━━┛ ┘


     W     dW
 ┌───┴───┐┈┈┈┐
 ┏━━━━━━━┓═══╗┐
 ┃       ┃   ║│
 ┃       ┃   ║├ L
 ┃       ┃   ║│
 ┗━━━━━━━┛   ║┘
 ║           ║┆ dL
 ╚═══════════╝┘


%}



% W = 1;
% L = 1;

% D = sqrt(W^2+L^2);
% P = 2*(W+L);
% A = W*L;

% limit perimeter
%   L = P/2 - W

P = 100;
sweep_number = 101;

widths = zeros(1, sweep_number);
lengths = zeros(1, sweep_number);
areas = zeros(1, sweep_number);
perimeters = zeros(1, sweep_number);

index = 1;
for W = linspace(0, P/2, sweep_number)
    L = P/2 - W;
    widths(index) = W;
    lengths(index) = L;
    areas(index) = W*L;
    perimeters(index) = 2*(W+L);

    index = index + 1;
end


[max_area, max_index] = max(areas);

draw_rect(widths(max_index), lengths(max_index))


%%
clc
clear

% W = 1;
% L = 1;

% D = sqrt(W^2+L^2);
% P = 2*(W+L);
% A = W*L;

% limit area
%   L = A/W

A = 10;
sweep_number = 101;

widths = zeros(1, sweep_number);
lengths = zeros(1, sweep_number);
areas = zeros(1, sweep_number);
perimeters = zeros(1, sweep_number);

index = 1;
for W = linspace(0, A, sweep_number)
    L = A/W;
    widths(index) = W;
    lengths(index) = L;
    areas(index) = W*L;
    perimeters(index) = 2*(W+L);

    index = index + 1;
end

[min_perimeter, min_index] = min(perimeters);

draw_rect(widths(min_index), lengths(min_index))
