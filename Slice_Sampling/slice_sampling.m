clc
clear


% horizontial line width
W = 1;

% number of sample to generate from input dist P(x)
num_of_samples = 500;

sampling_range = [-7, 7];

view = 1;


x = zeros(1, num_of_samples);
y = zeros(1, num_of_samples);

% view dist P(x)
a = linspace(sampling_range(1),sampling_range(2),1001);
subplot(3,1,1:2)

plot(a, P(a), "Color", "black", "linewidth" ,1.2)
grid on
hold on


% Random starting point
x(1) = unifrnd(sampling_range(1),sampling_range(2));


for t=1:num_of_samples
    % Step 1)
    %   Choose a point between 0 and P(xt) using a uniform dist
    y(t) = unifrnd(0, P(x(t)));

    % Step 2)
    %   Draw a horizontial line with width W, and a uniform offset
    offset = unifrnd(0, W);
    xleft = x(t)-offset;
    xright = x(t)-offset+W;

    % Step 3)
    %   Check that points on either end of line are greater P at that point
    %   if not, extend the line by another segment of length W

    % left end of line 
    while(y(t) < P(xleft))
        xleft = xleft - W;
    end

    % right end of line 
    while(y(t) < P(xright))
        xright = xright + W;
    end

    % Step 4)
    %   Draw uniformly from the line, if the y is greater P at that point,
    %   reject the point and draw again (faster implementation would be to
    %   shink the horizontial line, but that is not done here)
    x(t+1) = unifrnd(xleft, xright);
    while y(t) > P(x(t+1))
        x(t+1) = unifrnd(xleft, xright);
    end

    % make pretty plot
    d = plot(x(t), y(t), "b.");
    xlim(sampling_range)
    if view
        w = line([xleft, xright], [y(t), y(t)], "Color","green", ...
                                            "Marker","|", ...
                                            "linewidth",1.2); 

        subplot(3,1,3)
        hist(x(1:t),[sampling_range(1):0.2:sampling_range(2)])
        grid on
        xlabel("x")
        ylim([0,50])
        xlim(sampling_range)
        subplot(3,1,1:2)
        pause(0.1)

        % delete just the lines, leave the sampled points
        delete(w);
    end

end
title("Generating P(x) using Slice Samples with W = " + num2str(W) + ...
      ", Number of Samples = " + num2str(num_of_samples))
legend("P(x)")

% plot hist of samples from P(x)
subplot(3,1,3)
hist(x,[-7:0.1:7])
grid on
xlabel("x")



%% GIF VERISON
clc
clear

gifFile = "slice.gif";

f = figure;

% horizontial line width
W = 1;

% number of sample to generate from input dist P(x)
num_of_samples = 1000;



% view dist P(x)
a = linspace(-7,7,1001);
subplot(3,1,1:2)
plot(a, P(a), "Color", "black", "linewidth" ,1.2)
xlim([-7,7])
grid on
hold on
title("Generating P(x) using Slice Samples with W = " + num2str(W) + ...
      ", Number of Samples = " + num2str(num_of_samples))

% Random starting point
x(1) = unifrnd(-1, 1);

subplot(3,1,3)
hist(x,[-7:0.2:7])
grid on
xlabel("x")
ylim([0,50])
xlim([-7,7])

for t=1:num_of_samples
    subplot(3,1,1:2)
    % Step 1)
    %   Choose a point between 0 and P(xt) using a uniform dist
    y(t) = unifrnd(0, P(x(t)));

    % Step 2)
    %   Draw a horizontial line with width W, and a uniform offset
    offset = unifrnd(0, W);
    xleft = x(t)-offset;
    xright = x(t)-offset+W;

    % Step 3)
    %   Check that points on either end of line are greater P at that point
    %   if not, extend the line by another segment of length W

    % left end of line 
    while(y(t) < P(xleft))
        xleft = xleft - W;
    end

    % right end of line 
    while(y(t) < P(xright))
        xright = xright + W;
    end

    % Step 4)
    %   Draw uniformly from the line, if the y is greater P at that point,
    %   reject the point and draw again (faster implementation would be to
    %   shink the horizontial line, but that is not done here)
    x(t+1) = unifrnd(xleft, xright);
    while y(t) > P(x(t+1))
        x(t+1) = unifrnd(xleft, xright);
    end

    % make pretty plot
    d = plot(x(t), y(t), "b.");
    w = line([xleft, xright], [y(t), y(t)], "Color","green", ...
                                            "Marker","|", ...
                                            "linewidth",1.2); 


    % plot hist of samples from P(x)
    subplot(3,1,3)
    hist(x,[-7:0.2:7])
    grid on
    xlabel("x")
    ylim([0,50])
    xlim([-7,7])

    exportgraphics(f, gifFile, "Append",true)
    pause(0.1)
    % delete just the lines, leave the sampled points
    delete(w);
end
subplot(3,1,1:2)

title("Generating P(x) using Slice Samples with W = " + num2str(W) + ...
      ", Number of Samples = " + num2str(num_of_samples))
legend("P(x)")

subplot(3,1,3)
hist(x,[-7:0.2:7])
grid on
xlabel("x")
ylim([0,50])
xlim([-7,7])