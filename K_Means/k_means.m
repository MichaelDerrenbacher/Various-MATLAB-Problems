clc
clear

%================%
%   Parameters   %
%================%

% how many means to classify the data into
K = 3;

% how the random data is distributed  
%   1:  4 clusters
%   2:  2 columns
%   3:  uniform dist
type = 3;

% breaks after the k means move less than "esp" per iteration
esp = 1E-4;

%================%

[x,y] = gen_data(type);
scatter(x,y)


% place inital m's
for k = 1:K
    m(k,1) = rand()*10;
    m(k,2) = rand()*10;
end


m_dist = 1;
while sum(m_dist) > esp
    scatter(m(:,1), m(:,2), '.k')
    hold on

    % get distance
    for n = 1:length(x)
        for k = 1:K
            k_dist(n, k) = d([x(n), y(n)], [m(k,1), m(k,2)]);
        end
    end
    
    % assign nearest m(k) to nearest data
    for k = 1:K
        r(:, k) = k_dist(:, k) == min(k_dist(:, :), [], 2);
    end
    
    % color based on responsiblity
    for n = 1:length(x)
        if r(n, 1)
            scatter(x(n), y(n), 'blue')
        elseif r(n, 2)
            scatter(x(n), y(n), 'green')
        elseif r(n, 3)
            scatter(x(n), y(n), 'red')
        elseif r(n, 4)
            scatter(x(n), y(n), 'magenta')
        end
    end
    
    % update m(k) based on mean of its data
    for k = 1:K
        m_dist(k) = d(m(k, 1), (x * r(:,k)) / sum(r(:,k)));
        m(k, 1) = (x * r(:,k)) / sum(r(:,k));
        m(k, 2) = (y * r(:,k)) / sum(r(:,k));
    end

    % plot
    xlim([0 10])
    ylim([0 10])
    hold off
    disp("Total Shift this iteration: " + num2str(sum(m_dist)))
    pause(0.5)
end
