clc
clear

% https://en.wikipedia.org/wiki/Tupper%27s_self-referential_formula
% displays the bitmap for the variable 'k', which encodes a representation of the formula used to generate said bitmap
% changing k will change what is displayed


% need to use symbolic variable to hold a number so large
k =  sym(['960939379918958884971672962127852754715004339660129306651505519271702802395266424689642842174350' ...
    '718121267153782770623355993237280874144307891325963941337723487857735749823926629715517173716995' ...
    '165232890538221612403238855866184013235585136048828693337902491454229288667081096184496091705183' ...
    '454067827731551705405381627380967602565625016981482083418783163849115590225610003652351370343874' ...
    '461848378737238198224849863465033159410054974700593138339226497249461751545728366702369745461014' ...
    '655997933798537483143786841806593422227898388722980000748404719']);


[x,y] = meshgrid(0:1:106, 0:1:16);


% tupper's formula
tupper = rem(floor(floor((y+k)/17) .* 2.^(-17*x - rem((y+k), 17))), 2);

% convert symbolic back to double
tupper = double(tupper);

% flip and invert
image(fliplr(1-tupper)*255);


colormap gray
axis equal
set(gca, 'XTick', [], 'YTick', []);


